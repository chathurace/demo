
type SourceType Benefit_Enrollment_and_Maintenance;

type TargetType Benefit_Enrollment_and_Maintenance;

function transform(SourceType sourceType) returns TargetType =>  sourceType;

public function process(SourceType sourceType) returns TargetType {
    // Implement EDI type specific processing code here

    return transform(sourceType);
}
