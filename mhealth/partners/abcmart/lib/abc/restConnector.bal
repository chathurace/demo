
import ballerina/http;

configurable string ediSchemaURL = ?;
configurable string ediSchemaAccessToken = ?;

EDIReader ediReader = new(ediSchemaURL, ediSchemaAccessToken);

@http:ServiceConfig

service /abcEDIParser on new http:Listener(9090) {

    resource function post [string ediType](@http:Payload string ediData) returns anydata|error {
        EDI_NAMES|error ediTypeName = ediType.ensureType();
        if ediTypeName is error {
            return error("Unsupported EDI type: " + ediType + ". " + ediTypeName.message());
        }
        anydata target = check ediReader.readEDI(ediData, ediTypeName, "");                  
        return target;
    }
}
    