
type SourceType Benefit_Enrollment_and_Maintenance;

type TargetType Benefit_Enrollment_and_Maintenance;

function transform(Benefit_Enrollment_and_Maintenance enrollment) returns Benefit_Enrollment_and_Maintenance => enrollment;

function setCode(string v, string k) returns string {
    return "a_" + v + k;
}

function transformRefId(string v) returns string {
    return "Id_" + v;
}

public function process(SourceType sourceType) returns TargetType {
    // Implement EDI type specific processing code here

    TargetType target = transform(sourceType);

    return target;
}

// function analyze(TargetType target) {
//     Benefit_Enrollment_and_Maintenance b = target;

//     json adata = {
//         a: b.Transaction_Set_Header.Transaction_Set_Identifier_Code,
//         c: b.Beginning_Segment.Date
//     };

//     log:setOutputFile()
// }
