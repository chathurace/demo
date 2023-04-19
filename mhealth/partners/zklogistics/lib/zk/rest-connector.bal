import ballerina/http;

configurable string ediSchemaURL = ?;
configurable string ediSchemaAccessToken = ?;

type EDIData record {|
    string ediType;
    string fileName?;
    string content;
|};

EDIReader ediReader = new(ediSchemaURL, ediSchemaAccessToken);

service /kmart_edi on new http:Listener(9090) {

    resource function post [string ediType](@http:Payload string ediData) returns anydata|error {
        EDI_NAMES|error ediTypeName = ediType.ensureType();
        if ediTypeName is error {
            return error("Unsupported EDI type: " + ediType + ". " + ediTypeName.message());
        }
        anydata target = check ediReader.readEDI(ediData, ediTypeName, "");                  
        return target;
    }
}