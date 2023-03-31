import ballerinax/aws.s3;
import ballerina/log;
import ballerina/os;

configurable string awsAccessKeyId = ?;
configurable string awsSecretAccessKey = ?;
configurable string awsRegion = "us-east2";
configurable string ediBucket = ?;
configurable string schemaBucket = ?;


s3:ConnectionConfig amazonS3Config = {
    accessKeyId: awsAccessKeyId,
    secretAccessKey: awsSecretAccessKey,
    region: "us-east-2"
}; 

// string bucketName = "mapai-health-demo";
string bucketName = "m-abcmart";

public function main() returns error? {

    check os:setEnv("AWS_KEY", awsAccessKeyId);
    check os:setEnv("AWS_SECRET", awsSecretAccessKey);
    check os:setEnv("SCHEMA_BUCKET", schemaBucket);
    check os:setEnv("AWS_REGION", awsRegion);

    s3:Client amazonS3Client = check new (amazonS3Config);

    string ediText = check readS3File(amazonS3Client, bucketName, "esl_sample1.edi", true);
    any target = check readEDI(ediText, EDI_abc834);
    log:printInfo(target.toString());
    
    // string ediText = "";
    // stream<byte[], error?>|error getObjectResponse = amazonS3Client->getObject(bucketName, "esl_sample1.edi");
    // if (getObjectResponse is stream<byte[], error?>) {
    //     while true {
    //         any|error a = getObjectResponse.next();    
    //         if a is error {
    //             break;
    //         } else if a is record {|byte[] value;|} {
    //             ediText += check string:fromBytes(a.value) + "\n";
    //             any target = check readEDI(ediText, EDI_abc834);
    //             log:printInfo(target.toString());
    //         } else {
    //             break;
    //         }
    //     }
    // } else {
    //     io:println("Error: ", getObjectResponse);
    // }
}



