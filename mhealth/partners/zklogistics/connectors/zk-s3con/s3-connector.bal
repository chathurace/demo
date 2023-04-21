

import ballerinax/aws.s3;
import ballerina/http;
import ballerina/regex;
import ballerina/lang.runtime;
import ballerina/log;

configurable string partnerId = ?;
configurable string awsAccessKeyId = ?;
configurable string awsAccessSecret = ?;
configurable string awsRegion = ?;
configurable string inputBucket = ?;
configurable string processedBucket = ?;
configurable string failedBucket = ?;
configurable int pollingInterval = -1;

configurable string applicationEndpoint = ?;
configurable string applicationToken = ?;

configurable string ediEndpoint = ?;
configurable string ediToken = ?;

s3:ConnectionConfig amazonS3Config = {
    accessKeyId: awsAccessKeyId,
    secretAccessKey: awsAccessSecret,
    region: awsRegion
}; 

EDITracker tracker = new LoggingTracker();

http:Client httpClient = check new(applicationEndpoint);
http:Client ediClient = check new(ediEndpoint);

public function main() {
    s3:Client|error s3Client = new (amazonS3Config);    
    if s3Client is error {
        log:printError("Failed to iniitalize Amazon S3 client. " + s3Client.message());
        return;
    }

    while true {
        error? e = readEDIs(s3Client);
        if e is error {
            log:printError("Couldn't read EDIs.\n" + e.message());
        }
        if pollingInterval < 0 {
            // Negative values for polling interval forces this to run one time.
            // Can be used with external schedulars.
            break;
        }
        runtime:sleep(<decimal>pollingInterval);
    }
}


public function readEDIs(s3:Client s3Client) returns error? {

    string[] edis = check ediClient->/edis;
    s3:S3Object[] listObjects = check s3Client->listObjects(inputBucket);
    foreach s3:S3Object o in listObjects {
        string? fileName = o.objectName;
        if fileName is string {
            string[] parts = regex:split(fileName.trim(), "/");
            if parts.length() != 2 || edis.indexOf(parts[0], 0) is null {
                continue;
            }
            string ediName = parts[0];
            string|error ediText = readS3File(s3Client, inputBucket, fileName, true);
            if ediText is error {
                log:printError("Couldn't read EDI file " + fileName + " from bucket " + inputBucket);
                continue;
            }
            var result = processEDI(s3Client, ediName, ediText, parts[1]);
            if result is error {
                log:printError("Failed to process EDI: " + ediName + " of file: " + parts[1] + "\n" + result.message());
                check tracker.track({partnerId: partnerId, ediName: ediName, ediFileName: parts[1], status: "FAILED"});
                error? e = s3Client->createObject(failedBucket, partnerId + "/" + fileName, ediText);
                if e is error {
                    log:printError("Failed to copy invalid EDI " + fileName + " to bucket " + failedBucket + ". " + e.message());
                    continue;
                }
            } else {
                check tracker.track({partnerId: partnerId, ediName: ediName, ediFileName: parts[1], status: "PROCESSING COMPLETED"});
                error? e2 = s3Client->createObject(processedBucket, partnerId + "/" + fileName, ediText);
                if e2 is error {
                    log:printError("Failed to copy processed EDI " + fileName + " to bucket " + processedBucket + ". " + e2.message());
                    continue;
                }
            }
            error? e3 = s3Client->deleteObject(inputBucket, fileName);
            if e3 is error {
                log:printError("Failed to delete the processed EDI file: " + fileName + " from bucket " + inputBucket + ". " + e3.message());
                continue;
            }
        } else {
            log:printError("Object/file does not contain a valid name in EDI input bucket: " + inputBucket);
        }    
    }
}

function processEDI(s3:Client s3Client, string ediName, string ediText, string? ediFileName) returns error? {
    check tracker.track({partnerId: partnerId, ediName: ediName, ediFileName: ediFileName, status: "RECEIVED"});

    json target = check ediClient->/[ediName].post(ediText, {"API-Key": ediToken});
    json|error response = httpClient->/[ediName].post(target, {"API-Key": applicationToken});
    if response is error {
        return error("Failed to send EDI data to the backend application - " + 
            applicationEndpoint + "\n" + response.message());
    }
    log:printInfo(response.toString());    
}

function readS3File(s3:Client amazonS3Client, string bucketName, string fileName, boolean lineBreaks) returns string|error {
    string ediText = "";
    stream<byte[], error?>|error getObjectResponse = check amazonS3Client->getObject(bucketName, fileName);
    if (getObjectResponse is stream<byte[], error?>) {
        while true {
            any|error a = getObjectResponse.next();    
            if a is record {|byte[] value;|} {
                ediText += check string:fromBytes(a.value) + (lineBreaks?"\n":"");
            } else {
                break;
            }
        }
    } else {
        return error("Failed to connect with S3 bucket: " + bucketName, getObjectResponse);
    } 
    return ediText;   
}
