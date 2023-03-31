import ballerina/http;
import ballerina/log;
import synergy/mx12.m834;

# A service representing a network-accessible API
# bound to port `9090`.
service /edis on new http:Listener(9090) {

    resource function post m834(@http:Payload m834:Benefit_Enrollment_and_Maintenance benefit) returns string|error {
        log:printInfo(benefit.Beginning_Segment.Action_Code ?: "Action code not defined.");

        return "OK";
    }
}
