

type SourceType Procurement_Notices;
type TargetType Procurement_Notices;

function transform(SourceType sourceType) returns TargetType => sourceType;

public function process(SourceType sourceType) returns TargetType {
    // Implement EDI type specific processing code here

    return transform(sourceType);
}
    