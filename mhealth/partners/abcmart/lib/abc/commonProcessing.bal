import ballerina/io;
import ballerina/file;

type EDITrackingData record {
    string partnerId;
    string ediName;
    string schemaName;
    string? ediFileName;
};

function preProcess(string ediName, string mappingName, string ediText, string? ediFileName) returns error? {
    // Implement generic processing code that needs to be executed before parsing EDIs
    // E.g. EDI tracking code

}

function postProcess(string ediName, string mappingName, string ediText, anydata targetType, string? ediFileName) returns anydata|error? {
    // Implement generic processing code that needs to be executed after parsing EDIs

    EDITrackingData trackingData = {partnerId: "abc", ediName: ediName, schemaName: mappingName, ediFileName: ediFileName};
    
    // Tracking data is written to a file in this sample code.
    // Change this code as needed to write data to the required detination.
    string trackingFilePath = check file:joinPath("tracking", "data");
    check io:fileWriteString(trackingFilePath, trackingData.toString(), io:APPEND);

    return targetType;
}    
    