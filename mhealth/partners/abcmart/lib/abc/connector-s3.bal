import ballerinax/aws.s3;
import ballerina/io;

configurable string awsAccessKeyId = ?;
configurable string awsSecretAccessKey = ?;

s3:ConnectionConfig amazonS3Config = {
    accessKeyId: awsAccessKeyId,
    secretAccessKey: awsSecretAccessKey,
    region: "us-east-2"
}; 

// string bucketName = "mapai-health-demo";
string bucketName = "m-abcmart";

public function main() returns error? {
    s3:Client amazonS3Client = check new (amazonS3Config);
    
    string ediText = "";
    stream<byte[], error?>|error getObjectResponse = amazonS3Client->getObject(bucketName, "esl_sample1.edi");
    if (getObjectResponse is stream<byte[], error?>) {
        while true {
            any|error a = getObjectResponse.next();    
            if a is error {
                break;
            } else if a is record {|byte[] value;|} {
                ediText += check string:fromBytes(a.value) + "\n";
                any target = check readEDI(ediText, EDI_abc834);
                io:println(target.toString());
            } else {
                break;
            }
        }
    } else {
        io:println("Error: ", getObjectResponse);
    }
}

