
import chathurace/edi.core as edi;
import ballerina/file;
import ballerina/os;

import mx12.m835;
import mx12.m836;
import mx12.m834;

public enum EDI_NAMES {
    EDI_835 = "835", EDI_836 = "836", EDI_834 = "834"
}

public function readEDI(string ediText, EDI_NAMES ediName) returns any|error {
    string mappingDirectory = os:getEnv("EDI_MAPPING_PATH");
    if mappingDirectory.trim().length() == 0 {
        mappingDirectory = check file:joinPath("resources", "mx12");
    }
    match ediName {
        
        EDI_835 => {
            check preProcess(ediName, "Health_Care_Claim_Payment_Advice", ediText);
            string mappingPath = check file:joinPath(mappingDirectory, ediName + ".json");
            if !check file:test(mappingPath, file:EXISTS) {
                return error("Unknown EDI " + ediName + "\nMissing EDI mapping file: " + check file:getAbsolutePath(mappingPath));    
            }
            edi:EDIMapping mapping = check edi:readMappingFromFile(mappingPath);
            json jb = check edi:readEDIAsJson(ediText, mapping);
            m835:Health_Care_Claim_Payment_Advice b = check jb.cloneWithType(m835:Health_Care_Claim_Payment_Advice);
            any targetEDI = m835:process(b);
            return check postProcess(ediName, mapping.name, ediText, targetEDI);
        }
        EDI_836 => {
            check preProcess(ediName, "Procurement_Notices", ediText);
            string mappingPath = check file:joinPath(mappingDirectory, ediName + ".json");
            if !check file:test(mappingPath, file:EXISTS) {
                return error("Unknown EDI " + ediName + "\nMissing EDI mapping file: " + check file:getAbsolutePath(mappingPath));    
            }
            edi:EDIMapping mapping = check edi:readMappingFromFile(mappingPath);
            json jb = check edi:readEDIAsJson(ediText, mapping);
            m836:Procurement_Notices b = check jb.cloneWithType(m836:Procurement_Notices);
            any targetEDI = m836:process(b);
            return check postProcess(ediName, mapping.name, ediText, targetEDI);
        }
        EDI_834 => {
            check preProcess(ediName, "Benefit_Enrollment_and_Maintenance", ediText);
            string mappingPath = check file:joinPath(mappingDirectory, ediName + ".json");
            if !check file:test(mappingPath, file:EXISTS) {
                return error("Unknown EDI " + ediName + "\nMissing EDI mapping file: " + check file:getAbsolutePath(mappingPath));    
            }
            edi:EDIMapping mapping = check edi:readMappingFromFile(mappingPath);
            json jb = check edi:readEDIAsJson(ediText, mapping);
            m834:Benefit_Enrollment_and_Maintenance b = check jb.cloneWithType(m834:Benefit_Enrollment_and_Maintenance);
            any targetEDI = m834:process(b);
            return check postProcess(ediName, mapping.name, ediText, targetEDI);
        }
    }
}