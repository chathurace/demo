import ballerinax/aws.s3;
import ballerina/io;

configurable string awsAccessKeyId = ?;
configurable string awsSecretAccessKey = ?;

s3:ConnectionConfig amazonS3Config = {
    accessKeyId: awsAccessKeyId,
    secretAccessKey: awsSecretAccessKey,
    region: "us-east-1"
}; 

string bucketName = "mapai-health-demo";

public function main() returns error? {
    s3:Client amazonS3Client = check new (amazonS3Config);
    s3:S3Object[] objects = check amazonS3Client->listObjects(bucketName);
    foreach s3:S3Object item in objects {
        io:println(item.objectName);
    }

    stream<byte[], error?>|error getObjectResponse = amazonS3Client->getObject(bucketName, "834-sample.edi");
    if (getObjectResponse is stream<byte[], error?>) {
        check getObjectResponse.forEach(function(byte[] data) {
            io:println("Data: ", string:fromBytes(data));
        });
    } else {
        io:println("Error: ", getObjectResponse);
    }
}

