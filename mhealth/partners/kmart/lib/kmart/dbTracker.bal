import ballerina/sql;
import ballerinax/mysql;
import ballerinax/mysql.driver as _;
import ballerina/time;
import ballerina/log;

configurable string dbHost = ?;
configurable string dbName = ?;
configurable string dbUser = ?;
configurable string dbPass = ?;

mysql:Client mysqlEp = check new (host = dbHost, user = dbUser, password = dbPass, database = dbName);

class DBTracker {
    *EDITracker;

    function track(EDITrackingData data) returns error? {
        log:printInfo("EDI Tracking: " + time:utcNow()[0].toString() + " | " + data.toString());
        sql:ExecutionResult|error executeResponse = mysqlEp->execute(
            sqlQuery = `insert into editracking (partnerId, receivedTime, ediName, schemaName, ediFileName, status) 
                values (${data.partnerId}, ${time:utcNow()[0]}, ${data.ediName}, ${data.schemaName}, ${data.ediFileName}, ${data.status})`);
        if executeResponse is error {
            log:printError("Couldn't insert EDI tracking data into the database. " + executeResponse.message());
        } else if executeResponse.affectedRowCount == sql:EXECUTION_FAILED {
            log:printError("Couldn't insert EDI tracking data into the database. EXECUTION_FAILED.");
        }
    }
}