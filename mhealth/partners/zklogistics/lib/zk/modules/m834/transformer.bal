
type SourceType Benefit_Enrollment_and_Maintenance;

type TargetType Benefit_Enrollment_and_Maintenance;

function transform(SourceType sourceType) returns TargetType => sourceType;

function extracted1(SourceType sourceType) returns Transaction_Set_Header_Type {
    return sourceType.Transaction_Set_Header;
}

function extracted(SourceType sourceType) returns Transaction_Set_Header_Type {
    return sourceType.Transaction_Set_Header;
}

public function process(SourceType sourceType) returns TargetType {
    // Implement EDI type specific processing code here

    return transform(sourceType);
}
