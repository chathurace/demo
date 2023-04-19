public type Transaction_Set_Header_Type record {|
   string Transaction_Set_Identifier_Code;
   string Transaction_Set_Control_Number;
   string Implementation_Convention_Reference?;
|};

public type Beginning_Segment_for_Payment_Order_Remittance_Advice_Type record {|
   string Transaction_Handling_Code;
   float Monetary_Amount;
   string Credit_Debit_Flag_Code;
   string Payment_Method_Code;
   string Payment_Format_Code?;
   string A__DFI__ID_Number_Qualifier?;
   string A__DFI__Identification_Number?;
   string Account_Number_Qualifier?;
   string Account_Number?;
   string Originating_Company_Identifier?;
   string Originating_Company_Supplemental_Code?;
   string A__DFI__ID_Number_Qualifier_1?;
   string A__DFI__Identification_Number_1?;
   string Account_Number_Qualifier_1?;
   string Account_Number_1?;
   string Date?;
   string Business_Function_Code?;
   string A__DFI__ID_Number_Qualifier_2?;
   string A__DFI__Identification_Number_2?;
   string Account_Number_Qualifier_2?;
   string Account_Number_2?;
|};

public type Note_Special_Instruction_Type record {|
   string Note_Reference_Code?;
   string Description;
|};

public type Trace_Type record {|
   string Trace_Type_Code;
   string Reference_Identification;
   string Originating_Company_Identifier?;
   string Reference_Identification_1?;
|};

public type Currency_Type record {|
   string Entity_Identifier_Code;
   string Currency_Code;
   float Exchange_Rate?;
   string Entity_Identifier_Code_1?;
   string Currency_Code_1?;
   string Currency_Market_Exchange_Code?;
   string Date_Time_Qualifier?;
   string Date?;
   string Time?;
   string Date_Time_Qualifier_1?;
   string Date_1?;
   string Time_1?;
   string Date_Time_Qualifier_2?;
   string Date_2?;
   string Time_2?;
   string Date_Time_Qualifier_3?;
   string Date_3?;
   string Time_3?;
   string Date_Time_Qualifier_4?;
   string Date_4?;
   string Time_4?;
|};

public type Reference_Identifier_GType record {|
   string Reference_Identification_Qualifier;
   string Reference_Identification;
   string Reference_Identification_Qualifier_1?;
   string Reference_Identification_1?;
   string Reference_Identification_Qualifier_2?;
   string Reference_Identification_2?;
|};

public type Reference_Information_Type record {|
   string Reference_Identification_Qualifier;
   string Reference_Identification?;
   string Description?;
   Reference_Identifier_GType Reference_Identifier?;
|};

public type Date_Time_Reference_Type record {|
   string Date_Time_Qualifier;
   string Date?;
   string Time?;
   string Time_Code?;
   string Date_Time_Period_Format_Qualifier?;
   string Date_Time_Period?;
|};

public type Party_Identification_Type record {|
   string Entity_Identifier_Code;
   string Name?;
   string Identification_Code_Qualifier?;
   string Identification_Code?;
   string Entity_Relationship_Code?;
   string Entity_Identifier_Code_1?;
|};

public type Additional_Name_Information_Type record {|
   string Name;
   string Name_1?;
|};

public type Party_Location_Type record {|
   string Address_Information;
   string Address_Information_1?;
|};

public type Geographic_Location_Type record {|
   string City_Name?;
   string State_or_Province_Code?;
   string Postal_Code?;
   string Country_Code?;
   string Location_Qualifier?;
   string Location_Identifier?;
   string Country_Subdivision_Code?;
|};

public type Reference_Identifier2_GType record {|
   string Reference_Identification_Qualifier;
   string Reference_Identification;
   string Reference_Identification_Qualifier_1?;
   string Reference_Identification_1?;
   string Reference_Identification_Qualifier_2?;
   string Reference_Identification_2?;
|};

public type Reference_Information_1_Type record {|
   string Reference_Identification_Qualifier;
   string Reference_Identification?;
   string Description?;
   Reference_Identifier2_GType Reference_Identifier?;
|};

public type Administrative_Communications_Contact_Type record {|
   string Contact_Function_Code;
   string Name?;
   string Communication_Number_Qualifier?;
   string Communication_Number?;
   string Communication_Number_Qualifier_1?;
   string Communication_Number_1?;
   string Communication_Number_Qualifier_2?;
   string Communication_Number_2?;
   string Contact_Inquiry_Reference?;
|};

public type Reference_Identifier3_GType record {|
   string Reference_Identification_Qualifier;
   string Reference_Identification;
   string Reference_Identification_Qualifier_1?;
   string Reference_Identification_1?;
   string Reference_Identification_Qualifier_2?;
   string Reference_Identification_2?;
|};

public type Reference_Identifier_1_GType record {|
   string Reference_Identification_Qualifier;
   string Reference_Identification;
   string Reference_Identification_Qualifier_1?;
   string Reference_Identification_1?;
   string Reference_Identification_Qualifier_2?;
   string Reference_Identification_2?;
|};

public type Remittance_Delivery_Method_Type record {|
   string Report_Transmission_Code;
   string Name?;
   string Communication_Number?;
   Reference_Identifier3_GType Reference_Identifier?;
   Reference_Identifier_1_GType Reference_Identifier_1?;
|};

public type Date_Time_Reference_1_Type record {|
   string Date_Time_Qualifier;
   string Date?;
   string Time?;
   string Time_Code?;
   string Date_Time_Period_Format_Qualifier?;
   string Date_Time_Period?;
|};

public type A_1000_Loop_GType record {|
   Party_Identification_Type Party_Identification?;
   Additional_Name_Information_Type[] Additional_Name_Information = [];
   Party_Location_Type[] Party_Location = [];
   Geographic_Location_Type Geographic_Location?;
   Reference_Information_1_Type[] Reference_Information_1 = [];
   Administrative_Communications_Contact_Type[] Administrative_Communications_Contact = [];
   Remittance_Delivery_Method_Type Remittance_Delivery_Method?;
   Date_Time_Reference_1_Type Date_Time_Reference_1?;
|};

public type Transaction_Set_Line_Number_Type record {|
   int Assigned_Number;
|};

public type Transaction_Statistics_Type record {|
   string Reference_Identification;
   string Facility_Code_Value;
   string Date;
   float Quantity;
   float Monetary_Amount;
   float Monetary_Amount_1?;
   float Monetary_Amount_2?;
   float Monetary_Amount_3?;
   float Monetary_Amount_4?;
   float Monetary_Amount_5?;
   float Monetary_Amount_6?;
   float Monetary_Amount_7?;
   float Monetary_Amount_8?;
   float Monetary_Amount_9?;
   float Monetary_Amount_10?;
   float Monetary_Amount_11?;
   float Monetary_Amount_12?;
   float Monetary_Amount_13?;
   float Monetary_Amount_14?;
   float Monetary_Amount_15?;
   float Monetary_Amount_16?;
   float Monetary_Amount_17?;
   float Quantity_1?;
   float Monetary_Amount_18?;
|};

public type Transaction_Supplemental_Statistics_Type record {|
   float Monetary_Amount?;
   float Monetary_Amount_1?;
   float Monetary_Amount_2?;
   float Monetary_Amount_3?;
   float Monetary_Amount_4?;
   float Monetary_Amount_5?;
   float Quantity?;
   float Monetary_Amount_6?;
   float Monetary_Amount_7?;
   float Quantity_1?;
   float Quantity_2?;
   float Quantity_3?;
   float Quantity_4?;
   float Quantity_5?;
   float Monetary_Amount_8?;
   float Quantity_6?;
   float Monetary_Amount_9?;
   float Monetary_Amount_10?;
   float Monetary_Amount_11?;
|};

public type Claim_Level_Data_Type record {|
   string Claim_Submitters_Identifier;
   string Claim_Status_Code;
   float Monetary_Amount;
   float Monetary_Amount_1;
   float Monetary_Amount_2?;
   string Claim_Filing_Indicator_Code?;
   string Reference_Identification?;
   string Facility_Code_Value?;
   string Claim_Frequency_Type_Code?;
   string Patient_Status_Code?;
   string Diagnosis_Related_Group__DRG__Code?;
   float Quantity?;
   float Percentage_as_Decimal?;
   string Yes_No_Condition_or_Response_Code?;
|};

public type Claims_Adjustment_Type record {|
   string Claim_Adjustment_Group_Code;
   string Claim_Adjustment_Reason_Code;
   float Monetary_Amount;
   float Quantity?;
   string Claim_Adjustment_Reason_Code_1?;
   float Monetary_Amount_1?;
   float Quantity_1?;
   string Claim_Adjustment_Reason_Code_2?;
   float Monetary_Amount_2?;
   float Quantity_2?;
   string Claim_Adjustment_Reason_Code_3?;
   float Monetary_Amount_3?;
   float Quantity_3?;
   string Claim_Adjustment_Reason_Code_4?;
   float Monetary_Amount_4?;
   float Quantity_4?;
   string Claim_Adjustment_Reason_Code_5?;
   float Monetary_Amount_5?;
   float Quantity_5?;
|};

public type Individual_or_Organizational_Name_Type record {|
   string Entity_Identifier_Code;
   string Entity_Type_Qualifier;
   string Name_Last_or_Organization_Name?;
   string Name_First?;
   string Name_Middle?;
   string Name_Prefix?;
   string Name_Suffix?;
   string Identification_Code_Qualifier?;
   string Identification_Code?;
   string Entity_Relationship_Code?;
   string Entity_Identifier_Code_1?;
   string Name_Last_or_Organization_Name_1?;
|};

public type Medicare_Inpatient_Adjudication_Type record {|
   float Quantity;
   float Monetary_Amount?;
   float Quantity_1?;
   float Monetary_Amount_1?;
   string Reference_Identification?;
   float Monetary_Amount_2?;
   float Monetary_Amount_3?;
   float Monetary_Amount_4?;
   float Monetary_Amount_5?;
   float Monetary_Amount_6?;
   float Monetary_Amount_7?;
   float Monetary_Amount_8?;
   float Monetary_Amount_9?;
   float Monetary_Amount_10?;
   float Quantity_2?;
   float Monetary_Amount_11?;
   float Monetary_Amount_12?;
   float Monetary_Amount_13?;
   float Monetary_Amount_14?;
   string Reference_Identification_1?;
   string Reference_Identification_2?;
   string Reference_Identification_3?;
   string Reference_Identification_4?;
   float Monetary_Amount_15?;
|};

public type Medicare_Outpatient_Adjudication_Type record {|
   float Percentage_as_Decimal?;
   float Monetary_Amount?;
   string Reference_Identification?;
   string Reference_Identification_1?;
   string Reference_Identification_2?;
   string Reference_Identification_3?;
   string Reference_Identification_4?;
   float Monetary_Amount_1?;
   float Monetary_Amount_2?;
|};

public type Reference_Identifier4_GType record {|
   string Reference_Identification_Qualifier;
   string Reference_Identification;
   string Reference_Identification_Qualifier_1?;
   string Reference_Identification_1?;
   string Reference_Identification_Qualifier_2?;
   string Reference_Identification_2?;
|};

public type Reference_Information_2_Type record {|
   string Reference_Identification_Qualifier;
   string Reference_Identification?;
   string Description?;
   Reference_Identifier4_GType Reference_Identifier?;
|};

public type Date_Time_Reference_2_Type record {|
   string Date_Time_Qualifier;
   string Date?;
   string Time?;
   string Time_Code?;
   string Date_Time_Period_Format_Qualifier?;
   string Date_Time_Period?;
|};

public type Administrative_Communications_Contact_1_Type record {|
   string Contact_Function_Code;
   string Name?;
   string Communication_Number_Qualifier?;
   string Communication_Number?;
   string Communication_Number_Qualifier_1?;
   string Communication_Number_1?;
   string Communication_Number_Qualifier_2?;
   string Communication_Number_2?;
   string Contact_Inquiry_Reference?;
|};

public type Monetary_Amount_Information_Type record {|
   string Amount_Qualifier_Code;
   float Monetary_Amount;
   string Credit_Debit_Flag_Code?;
|};

public type Composite_Unit_of_Measure_GType record {|
   string Unit_or_Basis_for_Measurement_Code;
   float Exponent?;
   float Multiplier?;
   string Unit_or_Basis_for_Measurement_Code_1?;
   float Exponent_1?;
   float Multiplier_1?;
   string Unit_or_Basis_for_Measurement_Code_2?;
   float Exponent_2?;
   float Multiplier_2?;
   string Unit_or_Basis_for_Measurement_Code_3?;
   float Exponent_3?;
   float Multiplier_3?;
   string Unit_or_Basis_for_Measurement_Code_4?;
   float Exponent_4?;
   float Multiplier_4?;
|};

public type Quantity_Information_Type record {|
   string Quantity_Qualifier;
   float Quantity?;
   Composite_Unit_of_Measure_GType Composite_Unit_of_Measure?;
   string Free_form_Information?;
|};

public type Composite_Medical_Procedure_Identifier_GType record {|
   string Product_Service_ID_Qualifier;
   string Product_Service_ID;
   string Procedure_Modifier?;
   string Procedure_Modifier_1?;
   string Procedure_Modifier_2?;
   string Procedure_Modifier_3?;
   string Description?;
   string Product_Service_ID_1?;
|};

public type Composite_Medical_Procedure_Identifier_1_GType record {|
   string Product_Service_ID_Qualifier;
   string Product_Service_ID;
   string Procedure_Modifier?;
   string Procedure_Modifier_1?;
   string Procedure_Modifier_2?;
   string Procedure_Modifier_3?;
   string Description?;
   string Product_Service_ID_1?;
|};

public type Service_Information_Type record {|
   Composite_Medical_Procedure_Identifier_GType Composite_Medical_Procedure_Identifier;
   float Monetary_Amount;
   float Monetary_Amount_1?;
   string Product_Service_ID?;
   float Quantity?;
   Composite_Medical_Procedure_Identifier_1_GType Composite_Medical_Procedure_Identifier_1?;
   float Quantity_1?;
|};

public type Date_Time_Reference_3_Type record {|
   string Date_Time_Qualifier;
   string Date?;
   string Time?;
   string Time_Code?;
   string Date_Time_Period_Format_Qualifier?;
   string Date_Time_Period?;
|};

public type Claims_Adjustment_1_Type record {|
   string Claim_Adjustment_Group_Code;
   string Claim_Adjustment_Reason_Code;
   float Monetary_Amount;
   float Quantity?;
   string Claim_Adjustment_Reason_Code_1?;
   float Monetary_Amount_1?;
   float Quantity_1?;
   string Claim_Adjustment_Reason_Code_2?;
   float Monetary_Amount_2?;
   float Quantity_2?;
   string Claim_Adjustment_Reason_Code_3?;
   float Monetary_Amount_3?;
   float Quantity_3?;
   string Claim_Adjustment_Reason_Code_4?;
   float Monetary_Amount_4?;
   float Quantity_4?;
   string Claim_Adjustment_Reason_Code_5?;
   float Monetary_Amount_5?;
   float Quantity_5?;
|};

public type Reference_Identifier5_GType record {|
   string Reference_Identification_Qualifier;
   string Reference_Identification;
   string Reference_Identification_Qualifier_1?;
   string Reference_Identification_1?;
   string Reference_Identification_Qualifier_2?;
   string Reference_Identification_2?;
|};

public type Reference_Information_3_Type record {|
   string Reference_Identification_Qualifier;
   string Reference_Identification?;
   string Description?;
   Reference_Identifier5_GType Reference_Identifier?;
|};

public type Monetary_Amount_Information_1_Type record {|
   string Amount_Qualifier_Code;
   float Monetary_Amount;
   string Credit_Debit_Flag_Code?;
|};

public type Composite_Unit_of_Measure2_GType record {|
   string Unit_or_Basis_for_Measurement_Code;
   float Exponent?;
   float Multiplier?;
   string Unit_or_Basis_for_Measurement_Code_1?;
   float Exponent_1?;
   float Multiplier_1?;
   string Unit_or_Basis_for_Measurement_Code_2?;
   float Exponent_2?;
   float Multiplier_2?;
   string Unit_or_Basis_for_Measurement_Code_3?;
   float Exponent_3?;
   float Multiplier_3?;
   string Unit_or_Basis_for_Measurement_Code_4?;
   float Exponent_4?;
   float Multiplier_4?;
|};

public type Quantity_Information_1_Type record {|
   string Quantity_Qualifier;
   float Quantity?;
   Composite_Unit_of_Measure2_GType Composite_Unit_of_Measure?;
   string Free_form_Information?;
|};

public type Industry_Code_Identification_Type record {|
   string Code_List_Qualifier_Code?;
   string Industry_Code?;
|};

public type A_2110_Loop_GType record {|
   Service_Information_Type Service_Information?;
   Date_Time_Reference_3_Type[] Date_Time_Reference_3 = [];
   Claims_Adjustment_1_Type[] Claims_Adjustment_1 = [];
   Reference_Information_3_Type[] Reference_Information_3 = [];
   Monetary_Amount_Information_1_Type[] Monetary_Amount_Information_1 = [];
   Quantity_Information_1_Type[] Quantity_Information_1 = [];
   Industry_Code_Identification_Type[] Industry_Code_Identification = [];
|};

public type A_2100_Loop_GType record {|
   Claim_Level_Data_Type Claim_Level_Data;
   Claims_Adjustment_Type[] Claims_Adjustment = [];
   Individual_or_Organizational_Name_Type[] Individual_or_Organizational_Name = [];
   Medicare_Inpatient_Adjudication_Type Medicare_Inpatient_Adjudication?;
   Medicare_Outpatient_Adjudication_Type Medicare_Outpatient_Adjudication?;
   Reference_Information_2_Type[] Reference_Information_2 = [];
   Date_Time_Reference_2_Type[] Date_Time_Reference_2 = [];
   Administrative_Communications_Contact_1_Type[] Administrative_Communications_Contact_1 = [];
   Monetary_Amount_Information_Type[] Monetary_Amount_Information = [];
   Quantity_Information_Type[] Quantity_Information = [];
   A_2110_Loop_GType[] A_2110_Loop = [];
|};

public type A_2000_Loop_GType record {|
   Transaction_Set_Line_Number_Type Transaction_Set_Line_Number?;
   Transaction_Statistics_Type Transaction_Statistics?;
   Transaction_Supplemental_Statistics_Type Transaction_Supplemental_Statistics?;
   A_2100_Loop_GType[] A_2100_Loop = [];
|};

public type Adjustment_Identifier_GType record {|
   string Adjustment_Reason_Code;
   string Reference_Identification?;
|};

public type Adjustment_Identifier_1_GType record {|
   string Adjustment_Reason_Code;
   string Reference_Identification?;
|};

public type Adjustment_Identifier_2_GType record {|
   string Adjustment_Reason_Code;
   string Reference_Identification?;
|};

public type Adjustment_Identifier_3_GType record {|
   string Adjustment_Reason_Code;
   string Reference_Identification?;
|};

public type Adjustment_Identifier_4_GType record {|
   string Adjustment_Reason_Code;
   string Reference_Identification?;
|};

public type Adjustment_Identifier_5_GType record {|
   string Adjustment_Reason_Code;
   string Reference_Identification?;
|};

public type Provider_Level_Adjustment_Type record {|
   string Reference_Identification;
   string Date;
   Adjustment_Identifier_GType Adjustment_Identifier;
   float Monetary_Amount;
   Adjustment_Identifier_1_GType Adjustment_Identifier_1?;
   float Monetary_Amount_1?;
   Adjustment_Identifier_2_GType Adjustment_Identifier_2?;
   float Monetary_Amount_2?;
   Adjustment_Identifier_3_GType Adjustment_Identifier_3?;
   float Monetary_Amount_3?;
   Adjustment_Identifier_4_GType Adjustment_Identifier_4?;
   float Monetary_Amount_4?;
   Adjustment_Identifier_5_GType Adjustment_Identifier_5?;
   float Monetary_Amount_5?;
|};

public type Transaction_Set_Trailer_Type record {|
   int Number_of_Included_Segments;
   string Transaction_Set_Control_Number;
|};

public type Health_Care_Claim_Payment_Advice record {|
   Transaction_Set_Header_Type Transaction_Set_Header;
   Beginning_Segment_for_Payment_Order_Remittance_Advice_Type Beginning_Segment_for_Payment_Order_Remittance_Advice;
   Note_Special_Instruction_Type[] Note_Special_Instruction = [];
   Trace_Type Trace?;
   Currency_Type Currency?;
   Reference_Information_Type[] Reference_Information = [];
   Date_Time_Reference_Type[] Date_Time_Reference = [];
   A_1000_Loop_GType[] A_1000_Loop = [];
   A_2000_Loop_GType[] A_2000_Loop = [];
   Provider_Level_Adjustment_Type[] Provider_Level_Adjustment = [];
   Transaction_Set_Trailer_Type Transaction_Set_Trailer;
|};

