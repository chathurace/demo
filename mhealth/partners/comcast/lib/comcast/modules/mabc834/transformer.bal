import synergy/mx12;
import synergy/mx12.m834;

type SourceType Benefit_Enrollment_and_Maintenance;

type TargetType m834:Benefit_Enrollment_and_Maintenance;

function transform(SourceType sourceType) returns TargetType => {
    Transaction_Set_Header: sourceType.Transaction_Set_Header,
    Beginning_Segment: {
        Action_Code: mx12:getActionCode(),
        Transaction_Set_Purpose_Code: sourceType.Beginning_Segment.Transaction_Set_Purpose_Code,
        Reference_Identification: sourceType.Beginning_Segment.Reference_Identification,
        Date: sourceType.Beginning_Segment.Date,
        Time: sourceType.Beginning_Segment.Time,
        Time_Code: sourceType.Beginning_Segment.Time_Code,
        Reference_Identification_1: sourceType.Beginning_Segment.Reference_Identification_1,
        Transaction_Type_Code: sourceType.Beginning_Segment.Transaction_Type_Code,
        Security_Level_Code: sourceType.Beginning_Segment.Security_Level_Code
    },
    Reference_Information: sourceType.Reference_Information,
    Date_or_Time_or_Period: sourceType.Date_or_Time_or_Period,
    Monetary_Amount_Information: from var Monetary_Amount_InformationItem in sourceType.Monetary_Amount_Information
        select {
            Amount_Qualifier_Code: Monetary_Amount_InformationItem.Amount_Qualifier_Code,
            Monetary_Amount: Monetary_Amount_InformationItem.Monetary_Amount,
            Credit_Debit_Flag_Code: Monetary_Amount_InformationItem.Credit_Debit_Flag_Code ?: "Marpai Credit"
        },
    Quantity_Information: sourceType.Quantity_Information,
    A_1000_Loop: sourceType.A_1000_Loop,
    A_2000_Loop: sourceType.A_2000_Loop,
    Transaction_Set_Trailer: sourceType.Transaction_Set_Trailer
};

public function process(SourceType sourceType) returns TargetType {
    // Implement EDI type specific processing code here

    return transform(sourceType);
}
