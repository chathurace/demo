
import chathurace/edi.core as edi;
import ballerina/http;

import abc.mabc834;
import abc.mabc835;
import abc.mabc836;

public enum EDI_NAMES {
    EDI_abc834 = "abc834", EDI_abc835 = "abc835", EDI_abc836 = "abc836"
}

public class EDIReader {
    string schemaURL = "";
    string schemaAccessToken = "";

    public function init(string schemaURL, string schemaAccessToken) {
        self.schemaURL = schemaURL;
        self.schemaAccessToken = schemaAccessToken;
    }

    public function getEDINames() returns string[] {
        return ["abc834", "abc835"];
    }

    public function readEDI(string ediText, EDI_NAMES ediName, string? ediFileName) returns anydata|error {
        string|error mappingText = self.getEDISchemaText(ediName);
        if mappingText is error {
            return error("Schema for the EDI " + ediName + " not found in URL " + schemaURL);
        }
        
        match ediName {
            
                EDI_abc834 => {
                    check preProcess(ediName, "Benefit_Enrollment_and_Maintenance", ediText, ediFileName);
                    edi:EDIMapping mapping = check edi:readMappingFromString(mappingText);
                    json jb = check edi:readEDIAsJson(ediText, mapping);
                    mabc834:Benefit_Enrollment_and_Maintenance b = check jb.cloneWithType(mabc834:Benefit_Enrollment_and_Maintenance);
                    anydata targetEDI = mabc834:process(b);
                    return check postProcess(ediName, mapping.name, ediText, targetEDI, ediFileName);
                }
                EDI_abc835 => {
                    check preProcess(ediName, "Health_Care_Claim_Payment_Advice", ediText, ediFileName);
                    edi:EDIMapping mapping = check edi:readMappingFromString(mappingText);
                    json jb = check edi:readEDIAsJson(ediText, mapping);
                    mabc835:Health_Care_Claim_Payment_Advice b = check jb.cloneWithType(mabc835:Health_Care_Claim_Payment_Advice);
                    anydata targetEDI = mabc835:process(b);
                    return check postProcess(ediName, mapping.name, ediText, targetEDI, ediFileName);
                }
                EDI_abc836 => {
                    check preProcess(ediName, "Procurement_Notices", ediText, ediFileName);
                    edi:EDIMapping mapping = check edi:readMappingFromString(mappingText);
                    json jb = check edi:readEDIAsJson(ediText, mapping);
                    mabc836:Procurement_Notices b = check jb.cloneWithType(mabc836:Procurement_Notices);
                    anydata targetEDI = mabc836:process(b);
                    return check postProcess(ediName, mapping.name, ediText, targetEDI, ediFileName);
                }
        }
    }

    function getEDISchemaText(string ediName) returns string|error {
        http:Client sclient = check new(self.schemaURL);
        string fileName = ediName + ".json";
        string schemaContent = check sclient->/[fileName]({
            Authorization: "Bearer " + self.schemaAccessToken,
            Accept: "application/vnd.github.raw"});
        return schemaContent;
    }
}


        