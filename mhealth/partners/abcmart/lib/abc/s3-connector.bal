
import ballerinax/aws.s3;
import ballerina/log;
import ballerina/os;

configurable string awsAccessKeyId = ?;
configurable string awsSecretAccessKey = ?;
configurable string awsRegion = "us-east2";
configurable string ediBucket = "m-abc-edi";
configurable string schemaBucket = "m-abc-schema";


s3:ConnectionConfig amazonS3Config = {
    accessKeyId: awsAccessKeyId,
    secretAccessKey: awsSecretAccessKey,
    region: awsRegion
}; 

public function main() returns error? {

    check os:setEnv("AWS_KEY", awsAccessKeyId);
    check os:setEnv("AWS_SECRET", awsSecretAccessKey);
    check os:setEnv("SCHEMA_BUCKET", schemaBucket);
    check os:setEnv("AWS_REGION", awsRegion);

    s3:Client amazonS3Client = check new (amazonS3Config);

    string ediText = check readS3File(amazonS3Client, ediBucket, "esl_sample1.edi", true);
    any target = check readEDI(ediText, EDI_abc834);
    log:printInfo(target.toString());
}
    