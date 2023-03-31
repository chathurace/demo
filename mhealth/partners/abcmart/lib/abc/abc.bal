
import chathurace/edi.core as edi;
import ballerina/file;
import ballerina/os;

import abc.mabc834;
import abc.mabc835;
import abc.mabc836;

public enum EDI_NAMES {
    EDI_abc834 = "abc834", EDI_abc835 = "abc835", EDI_abc836 = "abc836"
}

public function readEDI(string ediText, EDI_NAMES ediName) returns any|error {
    string mappingDirectory = os:getEnv("EDI_MAPPING_PATH");
    if mappingDirectory.trim().length() == 0 {
        mappingDirectory = check file:joinPath("resources", "abc");
    }
    match ediName {
        
        EDI_abc834 => {
            check preProcess(ediName, "Benefit_Enrollment_and_Maintenance", ediText);
            string mappingPath = check file:joinPath(mappingDirectory, ediName + ".json");
            if !check file:test(mappingPath, file:EXISTS) {
                return error("Unknown EDI " + ediName + "\nMissing EDI mapping file: " + check file:getAbsolutePath(mappingPath));    
            }
            edi:EDIMapping mapping = check edi:readMappingFromFile(mappingPath);
            json jb = check edi:readEDIAsJson(ediText, mapping);
            mabc834:Benefit_Enrollment_and_Maintenance b = check jb.cloneWithType(mabc834:Benefit_Enrollment_and_Maintenance);
            any targetEDI = mabc834:process(b);
            return check postProcess(ediName, mapping.name, ediText, targetEDI);
        }
        EDI_abc835 => {
            check preProcess(ediName, "Health_Care_Claim_Payment_Advice", ediText);
            string mappingPath = check file:joinPath(mappingDirectory, ediName + ".json");
            if !check file:test(mappingPath, file:EXISTS) {
                return error("Unknown EDI " + ediName + "\nMissing EDI mapping file: " + check file:getAbsolutePath(mappingPath));    
            }
            edi:EDIMapping mapping = check edi:readMappingFromFile(mappingPath);
            json jb = check edi:readEDIAsJson(ediText, mapping);
            mabc835:Health_Care_Claim_Payment_Advice b = check jb.cloneWithType(mabc835:Health_Care_Claim_Payment_Advice);
            any targetEDI = mabc835:process(b);
            return check postProcess(ediName, mapping.name, ediText, targetEDI);
        }
        EDI_abc836 => {
            check preProcess(ediName, "Procurement_Notices", ediText);
            string mappingPath = check file:joinPath(mappingDirectory, ediName + ".json");
            if !check file:test(mappingPath, file:EXISTS) {
                return error("Unknown EDI " + ediName + "\nMissing EDI mapping file: " + check file:getAbsolutePath(mappingPath));    
            }
            edi:EDIMapping mapping = check edi:readMappingFromFile(mappingPath);
            json jb = check edi:readEDIAsJson(ediText, mapping);
            mabc836:Procurement_Notices b = check jb.cloneWithType(mabc836:Procurement_Notices);
            any targetEDI = mabc836:process(b);
            return check postProcess(ediName, mapping.name, ediText, targetEDI);
        }
    }
}