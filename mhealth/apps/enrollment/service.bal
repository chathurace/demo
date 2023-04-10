import ballerina/http;
import ballerina/log;
// import synergy/mx12.m834;
// import ballerina/time;
// import ballerinax/aws.s3;

type ClaimAmount record {|
    string qualifier;
    float amount;
|};

type Sponser record {|
    string id;
    string location;
|};

type BenefitEnrollment record {|
    ClaimAmount[] claimAmounts;
    Sponser[] sponsers;
|};

// configurable string awsAccessKeyId = ?;
// configurable string awsSecretAccessKey = ?;
// configurable string awsRegion = "us-east-2";
// configurable string enrollmentsBucket = "m-enroll";

// s3:ConnectionConfig amazonS3Config = {
//     accessKeyId: awsAccessKeyId,
//     secretAccessKey: awsSecretAccessKey,
//     region: awsRegion
// }; 

# A service representing a network-accessible API
# bound to port `9090`.
service /edis on new http:Listener(9090) {

    // resource function post m834(@http:Payload m834:Benefit_Enrollment_and_Maintenance benefit) returns string|error {
    //     log:printInfo(benefit.Beginning_Segment.Action_Code ?: "Action code not defined.");

    //     log:printDebug(benefit.toJsonString());

    //     s3:Client s3Client = check new(amazonS3Config);

    //     time:Utc currentUtc = time:utcNow();
    //     time:Civil ct = time:utcToCivil(currentUtc);
    //     string objectName = string `enroll-${ct.hour}:${ct.minute}:${ct.second?:0}`;
    //     check s3Client->createObject(enrollmentsBucket, objectName, benefit.toJsonString());
    //     return "OK";
    // }

    // resource function post enroll(@http:Payload Sponser b) returns error? {
    //     log:printDebug(b.toJsonString());

    //     s3:Client s3Client = check new(amazonS3Config);

    //     time:Utc currentUtc = time:utcNow();
    //     time:Civil ct = time:utcToCivil(currentUtc);
    //     string objectName = string `enroll-${ct.hour}:${ct.minute}:${ct.second?:0}`;
    //     check s3Client->createObject(enrollmentsBucket, objectName, b.toJsonString());
    // }

    resource function post '834(@http:Payload json message) returns json|error? {
        log:printInfo("Enrollment service: " + message.toString());
        return {appEp: "Received the message."};
    }
}
