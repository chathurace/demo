import ballerina/sql;
import ballerinax/mysql;
import ballerinax/mysql.driver as _;

import ballerina/time;
import ballerina/log;

configurable string dbHost = "";
configurable string dbName = "";
configurable string dbUser = "";
configurable string dbPass = "";

mysql:Client mysqlEp = check new (host = dbHost, user = dbUser, password = dbPass, database = dbName);

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

    EDITrackingData d = {partnerId: "abc", ediName: ediName, schemaName: mappingName, ediFileName: ediFileName};

    // Tracking data is written to a file in this sample code.
    // Change this code as needed to write data to the required detination.
    log:printInfo("EDI Tracking: " + time:utcNow()[0].toString() + " | " + d.toString());
    sql:ExecutionResult|error executeResponse = mysqlEp->execute(
        sqlQuery = `insert into editracking (partnerId, receivedTime, ediName, schemaName, ediFileName, status) 
            values (${d.partnerId}, ${time:utcNow()[0]}, ${d.ediName}, ${d.schemaName}, ${d.ediFileName}, 'COMPLETED')`);
    if executeResponse is error {
        log:printError("Couldn't insert EDI tracking data into the database. " + executeResponse.message());
    } else if executeResponse.affectedRowCount == sql:EXECUTION_FAILED {
        log:printError("Couldn't insert EDI tracking data into the database. EXECUTION_FAILED.");
    }
    // string trackingFilePath = check file:joinPath("tracking", "data");
    // check io:fileWriteString(trackingFilePath, trackingData.toString(), io:APPEND);

    return targetType;
}
