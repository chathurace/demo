
import chathurace/edi.core as edi;
import ballerina/file;
import ballerina/os;

import abc.mabc834;
import abc.mabc835;
import abc.mabc836;
import ballerina/log;
import ballerinax/aws.s3;

s3:ConnectionConfig amazonS3Config1 = {
    accessKeyId: "key",
    secretAccessKey: "secret",
    region: "us-east-2"
};

public enum EDI_NAMES {
    EDI_abc834 = "abc834", EDI_abc835 = "abc835", EDI_abc836 = "abc836"
}

public function readEDI(string ediText, EDI_NAMES ediName) returns any|error {
    string schemaBucket = os:getEnv("SCHEMA_BUCKET");
    log:printInfo("Schema bucket provided: " + schemaBucket);
    string mappingText = "";
    if schemaBucket.length() > 0 {
        amazonS3Config1.accessKeyId = os:getEnv("AWS_KEY");
        amazonS3Config1.secretAccessKey = os:getEnv("AWS_SECRET");
        amazonS3Config1.region = os:getEnv("AWS_REGION");
        mappingText = check readS3File(check new(amazonS3Config1), schemaBucket, ediName + ".json", false);
    }
    string mappingDirectory = check file:joinPath("resources", "abc");
    match ediName {
        
        EDI_abc834 => {
            check preProcess(ediName, "Benefit_Enrollment_and_Maintenance", ediText);
            string mappingPath = check file:joinPath(mappingDirectory, ediName + ".json");
            if schemaBucket.length() == 0 && !check file:test(mappingPath, file:EXISTS) {
                return error("Unknown EDI " + ediName + "\nMissing EDI mapping file: " + check file:getAbsolutePath(mappingPath));    
            }
            edi:EDIMapping mapping = schemaBucket.length() > 0? 
                check edi:readMappingFromString(mappingText):
                check edi:readMappingFromFile(mappingPath);
            json jb = check edi:readEDIAsJson(ediText, mapping);
            mabc834:Benefit_Enrollment_and_Maintenance b = check jb.cloneWithType(mabc834:Benefit_Enrollment_and_Maintenance);
            any targetEDI = mabc834:process(b);
            return check postProcess(ediName, mapping.name, ediText, targetEDI);
        }
        EDI_abc835 => {
            check preProcess(ediName, "Health_Care_Claim_Payment_Advice", ediText);
            string mappingPath = check file:joinPath(mappingDirectory, ediName + ".json");
            if !check file:test(mappingPath, file:EXISTS) {
                return error("Unknown EDI " + ediName + "\nMissing EDI mapping file: " + check file:getAbsolutePath(mappingPath));    
            }
            edi:EDIMapping mapping = check edi:readMappingFromFile(mappingPath);
            json jb = check edi:readEDIAsJson(ediText, mapping);
            mabc835:Health_Care_Claim_Payment_Advice b = check jb.cloneWithType(mabc835:Health_Care_Claim_Payment_Advice);
            any targetEDI = mabc835:process(b);
            return check postProcess(ediName, mapping.name, ediText, targetEDI);
        }
        EDI_abc836 => {
            check preProcess(ediName, "Procurement_Notices", ediText);
            string mappingPath = check file:joinPath(mappingDirectory, ediName + ".json");
            if !check file:test(mappingPath, file:EXISTS) {
                return error("Unknown EDI " + ediName + "\nMissing EDI mapping file: " + check file:getAbsolutePath(mappingPath));    
            }
            edi:EDIMapping mapping = check edi:readMappingFromFile(mappingPath);
            json jb = check edi:readEDIAsJson(ediText, mapping);
            mabc836:Procurement_Notices b = check jb.cloneWithType(mabc836:Procurement_Notices);
            any targetEDI = mabc836:process(b);
            return check postProcess(ediName, mapping.name, ediText, targetEDI);
        }
    }
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