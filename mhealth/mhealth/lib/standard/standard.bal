
import chathurace/edi.core as edi;
import ballerina/http;

import standard.m835;
import standard.m836;
import standard.m834;

configurable string partnerId = "standard";

public enum EDI_NAMES {
    EDI_835 = "835", EDI_836 = "836", EDI_834 = "834"
}

public class EDIReader {
    string schemaURL = "";
    string schemaAccessToken = "";

    public function init(string schemaURL, string schemaAccessToken) {
        self.schemaURL = schemaURL;
        self.schemaAccessToken = schemaAccessToken;
    }

    public function readEDI(string ediText, EDI_NAMES ediName, string? ediFileName) returns anydata|error {
        string|error mappingText = self.getEDISchemaText(ediName);
        if mappingText is error {
            return error("Schema for the EDI " + ediName + " not found in URL " + self.schemaURL);
        }
        
        match ediName {
            
            EDI_835 => {
                check preProcess(ediName, "Health_Care_Claim_Payment_Advice", ediText, ediFileName);
                edi:EDIMapping mapping = check edi:readMappingFromString(mappingText);
                json jb = check edi:readEDIAsJson(ediText, mapping);
                m835:Health_Care_Claim_Payment_Advice b = check jb.cloneWithType(m835:Health_Care_Claim_Payment_Advice);
                anydata targetEDI = m835:process(b);
                return check postProcess(ediName, mapping.name, ediText, targetEDI, ediFileName);
            }
            EDI_836 => {
                check preProcess(ediName, "Procurement_Notices", ediText, ediFileName);
                edi:EDIMapping mapping = check edi:readMappingFromString(mappingText);
                json jb = check edi:readEDIAsJson(ediText, mapping);
                m836:Procurement_Notices b = check jb.cloneWithType(m836:Procurement_Notices);
                anydata targetEDI = m836:process(b);
                return check postProcess(ediName, mapping.name, ediText, targetEDI, ediFileName);
            }
            EDI_834 => {
                check preProcess(ediName, "Benefit_Enrollment_and_Maintenance", ediText, ediFileName);
                edi:EDIMapping mapping = check edi:readMappingFromString(mappingText);
                json jb = check edi:readEDIAsJson(ediText, mapping);
                m834:Benefit_Enrollment_and_Maintenance b = check jb.cloneWithType(m834:Benefit_Enrollment_and_Maintenance);
                anydata targetEDI = m834:process(b);
                return check postProcess(ediName, mapping.name, ediText, targetEDI, ediFileName);
            }
        }
    }

    public function getEDINames() returns string[] {
        return ["835","836","834"];
    }

    function getEDISchemaText(string ediName) returns string|error {
        http:Client sclient = check new(self.schemaURL);
        string fileName = ediName + ".json";
        string authHeader = "Bearer" + self.schemaAccessToken;
        string schemaContent = check sclient->/[fileName]({
            Authorization: authHeader, 
            Accept: "application/vnd.github.raw"});
        return schemaContent;
    }
}
        