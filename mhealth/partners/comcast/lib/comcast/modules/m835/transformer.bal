

type SourceType Health_Care_Claim_Payment_Advice;
type TargetType Health_Care_Claim_Payment_Advice;

function transform(SourceType sourceType) returns TargetType => sourceType;

public function process(SourceType sourceType) returns TargetType {
    // Implement EDI type specific processing code here

    return transform(sourceType);
}
    