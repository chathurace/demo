public type Transaction_Set_Header_Type record {|
   string Transaction_Set_Identifier_Code;
   string Transaction_Set_Control_Number;
   string Implementation_Convention_Reference?;
|};

public type Beginning_Segment_for_Procurement_Notices_Type record {|
   string Transaction_Set_Purpose_Code;
   string Request_for_Quote_Reference_Number?;
   string Date?;
   string Reference_Identification?;
   string Contract_Status_Code?;
   string Date_1?;
   string Date_2?;
   string Acknowledgment_Type?;
   string Reference_Identification_Qualifier?;
   string Reference_Identification_1?;
   string Transaction_Type_Code?;
   string Action_Code?;
|};

public type Terms_of_Sale_Deferred_Terms_of_Sale_Type record {|
   string Terms_Type_Code?;
   string Terms_Basis_Date_Code?;
   float Terms_Discount_Percent?;
   string Terms_Discount_Due_Date?;
   int Terms_Discount_Days_Due?;
   string Terms_Net_Due_Date?;
   int Terms_Net_Days?;
   float Terms_Discount_Amount?;
   string Terms_Deferred_Due_Date?;
   float Deferred_Amount_Due?;
   float Percent_of_Invoice_Payable?;
   string Description?;
   int Day_of_Month?;
   string Payment_Method_Type_Code?;
   float Percentage_as_Decimal?;
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

public type Restrictions_Conditions_Type record {|
   string Restrictions_Conditions_Qualifier;
   string Description?;
   string Quantity_Qualifier?;
   float Quantity?;
   string Amount_Qualifier_Code?;
   float Amount?;
   Composite_Unit_of_Measure_GType Composite_Unit_of_Measure?;
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

public type Pricing_Information_Type record {|
   string Class_of_Trade_Code?;
   string Price_Identifier_Code?;
   float Unit_Price?;
   float Quantity?;
   Composite_Unit_of_Measure2_GType Composite_Unit_of_Measure?;
   string Price_Multiplier_Qualifier?;
   float Multiplier?;
   float Monetary_Amount?;
   string Basis_of_Unit_Price_Code?;
   string Condition_Value?;
   int Multiple_Price_Quantity?;
|};

public type F_O_B__Related_Instructions_Type record {|
   string Shipment_Method_of_Payment;
   string Location_Qualifier?;
   string Description?;
   string Transportation_Terms_Qualifier_Code?;
   string Transportation_Terms_Code?;
   string Location_Qualifier_1?;
   string Description_1?;
   string Risk_of_Loss_Code?;
   string Description_2?;
|};

public type Monetary_Amount_Information_Type record {|
   string Amount_Qualifier_Code;
   float Monetary_Amount;
   string Credit_Debit_Flag_Code?;
|};

public type Composite_Unit_of_Measure3_GType record {|
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
   Composite_Unit_of_Measure3_GType Composite_Unit_of_Measure?;
   string Free_form_Information?;
|};

public type Date_Time_Reference_Type record {|
   string Date_Time_Qualifier;
   string Date?;
   string Time?;
   string Time_Code?;
   string Date_Time_Period_Format_Qualifier?;
   string Date_Time_Period?;
|};

public type Lead_Time_Type record {|
   string Lead_Time_Code;
   float Quantity;
   string Unit_of_Time_Period_or_Interval;
   string Date?;
|};

public type Actions_Indicated_GType record {|
   string Paperwork_Report_Action_Code;
   string Paperwork_Report_Action_Code_1?;
   string Paperwork_Report_Action_Code_2?;
   string Paperwork_Report_Action_Code_3?;
   string Paperwork_Report_Action_Code_4?;
|};

public type Paperwork_Type record {|
   string Report_Type_Code;
   string Report_Transmission_Code?;
   int Report_Copies_Needed?;
   string Entity_Identifier_Code?;
   string Identification_Code_Qualifier?;
   string Identification_Code?;
   string Description?;
   Actions_Indicated_GType Actions_Indicated?;
   string Request_Category_Code?;
|};

public type Text_Type record {|
   string Note_Reference_Code?;
   string Textual_Data?;
   string Textual_Data_1?;
   string Printer_Carriage_Control_Code?;
   int Number?;
   string Language_Code?;
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

public type F_O_B__Related_Instructions_1_Type record {|
   string Shipment_Method_of_Payment;
   string Location_Qualifier?;
   string Description?;
   string Transportation_Terms_Qualifier_Code?;
   string Transportation_Terms_Code?;
   string Location_Qualifier_1?;
   string Description_1?;
   string Risk_of_Loss_Code?;
   string Description_2?;
|};

public type N1_Loop_GType record {|
   Party_Identification_Type Party_Identification?;
   Additional_Name_Information_Type[] Additional_Name_Information = [];
   Party_Location_Type[] Party_Location = [];
   Geographic_Location_Type Geographic_Location?;
   Reference_Information_Type[] Reference_Information = [];
   Administrative_Communications_Contact_Type[] Administrative_Communications_Contact = [];
   F_O_B__Related_Instructions_1_Type F_O_B__Related_Instructions_1?;
|};

public type Code_Source_Information_Type record {|
   string Agency_Qualifier_Code;
   string Source_Subqualifier?;
|};

public type Industry_Code_Identification_Type record {|
   string Code_List_Qualifier_Code?;
   string Industry_Code?;
|};

public type LM_Loop_GType record {|
   Code_Source_Information_Type Code_Source_Information?;
   Industry_Code_Identification_Type[] Industry_Code_Identification = [];
|};

public type Baseline_Item_Data_Type record {|
   string Assigned_Identification?;
   float Quantity?;
   string Unit_or_Basis_for_Measurement_Code?;
   float Unit_Price?;
   string Basis_of_Unit_Price_Code?;
   string Product_Service_ID_Qualifier?;
   string Product_Service_ID?;
   string Product_Service_ID_Qualifier_1?;
   string Product_Service_ID_1?;
   string Product_Service_ID_Qualifier_2?;
   string Product_Service_ID_2?;
   string Product_Service_ID_Qualifier_3?;
   string Product_Service_ID_3?;
   string Product_Service_ID_Qualifier_4?;
   string Product_Service_ID_4?;
   string Product_Service_ID_Qualifier_5?;
   string Product_Service_ID_5?;
   string Product_Service_ID_Qualifier_6?;
   string Product_Service_ID_6?;
   string Product_Service_ID_Qualifier_7?;
   string Product_Service_ID_7?;
   string Product_Service_ID_Qualifier_8?;
   string Product_Service_ID_8?;
   string Product_Service_ID_Qualifier_9?;
   string Product_Service_ID_9?;
|};

public type Additional_Item_Detail_Type record {|
   string Change_Reason_Code;
   string Date?;
   string Price_Identifier_Code?;
   float Unit_Price?;
   string Basis_of_Unit_Price_Code?;
   float Quantity;
   string Unit_or_Basis_for_Measurement_Code;
   string Description?;
|};

public type Composite_Unit_of_Measure4_GType record {|
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

public type Pricing_Information_1_Type record {|
   string Class_of_Trade_Code?;
   string Price_Identifier_Code?;
   float Unit_Price?;
   float Quantity?;
   Composite_Unit_of_Measure4_GType Composite_Unit_of_Measure?;
   string Price_Multiplier_Qualifier?;
   float Multiplier?;
   float Monetary_Amount?;
   string Basis_of_Unit_Price_Code?;
   string Condition_Value?;
   int Multiple_Price_Quantity?;
|};

public type Product_Item_Description_Type record {|
   string Item_Description_Type;
   string Product_Process_Characteristic_Code?;
   string Agency_Qualifier_Code?;
   string Product_Description_Code?;
   string Description?;
   string Surface_Layer_Position_Code?;
   string Source_Subqualifier?;
   string Yes_No_Condition_or_Response_Code?;
   string Language_Code?;
|};

public type Service_Characteristic_Identification_Type record {|
   string Agency_Qualifier_Code;
   string Service_Characteristics_Qualifier;
   string Product_Service_ID;
   string Service_Characteristics_Qualifier_1?;
   string Product_Service_ID_1?;
   string Service_Characteristics_Qualifier_2?;
   string Product_Service_ID_2?;
   string Service_Characteristics_Qualifier_3?;
   string Product_Service_ID_3?;
   string Service_Characteristics_Qualifier_4?;
   string Product_Service_ID_4?;
   string Service_Characteristics_Qualifier_5?;
   string Product_Service_ID_5?;
   string Service_Characteristics_Qualifier_6?;
   string Product_Service_ID_6?;
   string Service_Characteristics_Qualifier_7?;
   string Product_Service_ID_7?;
   string Service_Characteristics_Qualifier_8?;
   string Product_Service_ID_8?;
   string Service_Characteristics_Qualifier_9?;
   string Product_Service_ID_9?;
|};

public type Composite_Unit_of_Measure5_GType record {|
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

public type Measurements_Type record {|
   string Measurement_Reference_ID_Code?;
   string Measurement_Qualifier?;
   float Measurement_Value?;
   Composite_Unit_of_Measure5_GType Composite_Unit_of_Measure?;
   float Range_Minimum?;
   float Range_Maximum?;
   string Measurement_Significance_Code?;
   string Measurement_Attribute_Code?;
   string Surface_Layer_Position_Code?;
   string Measurement_Method_or_Device?;
   string Code_List_Qualifier_Code?;
   string Industry_Code?;
|};

public type Actions_Indicated2_GType record {|
   string Paperwork_Report_Action_Code;
   string Paperwork_Report_Action_Code_1?;
   string Paperwork_Report_Action_Code_2?;
   string Paperwork_Report_Action_Code_3?;
   string Paperwork_Report_Action_Code_4?;
|};

public type Paperwork_1_Type record {|
   string Report_Type_Code;
   string Report_Transmission_Code?;
   int Report_Copies_Needed?;
   string Entity_Identifier_Code?;
   string Identification_Code_Qualifier?;
   string Identification_Code?;
   string Description?;
   Actions_Indicated2_GType Actions_Indicated?;
   string Request_Category_Code?;
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

public type Terms_of_Sale_Deferred_Terms_of_Sale_1_Type record {|
   string Terms_Type_Code?;
   string Terms_Basis_Date_Code?;
   float Terms_Discount_Percent?;
   string Terms_Discount_Due_Date?;
   int Terms_Discount_Days_Due?;
   string Terms_Net_Due_Date?;
   int Terms_Net_Days?;
   float Terms_Discount_Amount?;
   string Terms_Deferred_Due_Date?;
   float Deferred_Amount_Due?;
   float Percent_of_Invoice_Payable?;
   string Description?;
   int Day_of_Month?;
   string Payment_Method_Type_Code?;
   float Percentage_as_Decimal?;
|};

public type Date_Time_Reference_1_Type record {|
   string Date_Time_Qualifier;
   string Date?;
   string Time?;
   string Time_Code?;
   string Date_Time_Period_Format_Qualifier?;
   string Date_Time_Period?;
|};

public type Composite_Unit_of_Measure6_GType record {|
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

public type Restrictions_Conditions_1_Type record {|
   string Restrictions_Conditions_Qualifier;
   string Description?;
   string Quantity_Qualifier?;
   float Quantity?;
   string Amount_Qualifier_Code?;
   float Amount?;
   Composite_Unit_of_Measure6_GType Composite_Unit_of_Measure?;
|};

public type Composite_Unit_of_Measure7_GType record {|
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
   Composite_Unit_of_Measure7_GType Composite_Unit_of_Measure?;
   string Free_form_Information?;
|};

public type Monetary_Amount_Information_1_Type record {|
   string Amount_Qualifier_Code;
   float Monetary_Amount;
   string Credit_Debit_Flag_Code?;
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

public type Date_Time_Reference_2_Type record {|
   string Date_Time_Qualifier;
   string Date?;
   string Time?;
   string Time_Code?;
   string Date_Time_Period_Format_Qualifier?;
   string Date_Time_Period?;
|};

public type REF_Loop_GType record {|
   Reference_Information_1_Type Reference_Information_1?;
   Date_Time_Reference_2_Type[] Date_Time_Reference_2 = [];
|};

public type Composite_Unit_of_Measure8_GType record {|
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

public type Subline_Item_Detail_Type record {|
   string Assigned_Identification;
   string Assigned_Identification_1?;
   string Relationship_Code;
   float Quantity?;
   Composite_Unit_of_Measure8_GType Composite_Unit_of_Measure?;
   float Unit_Price?;
   string Basis_of_Unit_Price_Code?;
   string Relationship_Code_1?;
   string Product_Service_ID_Qualifier?;
   string Product_Service_ID?;
   string Product_Service_ID_Qualifier_1?;
   string Product_Service_ID_1?;
   string Product_Service_ID_Qualifier_2?;
   string Product_Service_ID_2?;
   string Product_Service_ID_Qualifier_3?;
   string Product_Service_ID_3?;
   string Product_Service_ID_Qualifier_4?;
   string Product_Service_ID_4?;
   string Product_Service_ID_Qualifier_5?;
   string Product_Service_ID_5?;
   string Product_Service_ID_Qualifier_6?;
   string Product_Service_ID_6?;
   string Product_Service_ID_Qualifier_7?;
   string Product_Service_ID_7?;
   string Product_Service_ID_Qualifier_8?;
   string Product_Service_ID_8?;
   string Product_Service_ID_Qualifier_9?;
   string Product_Service_ID_9?;
|};

public type Product_Item_Description_1_Type record {|
   string Item_Description_Type;
   string Product_Process_Characteristic_Code?;
   string Agency_Qualifier_Code?;
   string Product_Description_Code?;
   string Description?;
   string Surface_Layer_Position_Code?;
   string Source_Subqualifier?;
   string Yes_No_Condition_or_Response_Code?;
   string Language_Code?;
|};

public type SLN_Loop_GType record {|
   Subline_Item_Detail_Type Subline_Item_Detail?;
   Product_Item_Description_1_Type[] Product_Item_Description_1 = [];
|};

public type Party_Identification_1_Type record {|
   string Entity_Identifier_Code;
   string Name?;
   string Identification_Code_Qualifier?;
   string Identification_Code?;
   string Entity_Relationship_Code?;
   string Entity_Identifier_Code_1?;
|};

public type Additional_Name_Information_1_Type record {|
   string Name;
   string Name_1?;
|};

public type Party_Location_1_Type record {|
   string Address_Information;
   string Address_Information_1?;
|};

public type Geographic_Location_1_Type record {|
   string City_Name?;
   string State_or_Province_Code?;
   string Postal_Code?;
   string Country_Code?;
   string Location_Qualifier?;
   string Location_Identifier?;
   string Country_Subdivision_Code?;
|};

public type Reference_Identifier3_GType record {|
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
   Reference_Identifier3_GType Reference_Identifier?;
|};

public type Administrative_Communications_Contact_2_Type record {|
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

public type F_O_B__Related_Instructions_2_Type record {|
   string Shipment_Method_of_Payment;
   string Location_Qualifier?;
   string Description?;
   string Transportation_Terms_Qualifier_Code?;
   string Transportation_Terms_Code?;
   string Location_Qualifier_1?;
   string Description_1?;
   string Risk_of_Loss_Code?;
   string Description_2?;
|};

public type Date_Time_Reference_3_Type record {|
   string Date_Time_Qualifier;
   string Date?;
   string Time?;
   string Time_Code?;
   string Date_Time_Period_Format_Qualifier?;
   string Date_Time_Period?;
|};

public type Lead_Time_1_Type record {|
   string Lead_Time_Code;
   float Quantity;
   string Unit_of_Time_Period_or_Interval;
   string Date?;
|};

public type Text_1_Type record {|
   string Note_Reference_Code?;
   string Textual_Data?;
   string Textual_Data_1?;
   string Printer_Carriage_Control_Code?;
   int Number?;
   string Language_Code?;
|};

public type N1_Loop_1_GType record {|
   Party_Identification_1_Type Party_Identification_1?;
   Additional_Name_Information_1_Type[] Additional_Name_Information_1 = [];
   Party_Location_1_Type[] Party_Location_1 = [];
   Geographic_Location_1_Type Geographic_Location_1?;
   Reference_Information_2_Type[] Reference_Information_2 = [];
   Administrative_Communications_Contact_2_Type[] Administrative_Communications_Contact_2 = [];
   F_O_B__Related_Instructions_2_Type[] F_O_B__Related_Instructions_2 = [];
   Date_Time_Reference_3_Type[] Date_Time_Reference_3 = [];
   Lead_Time_1_Type[] Lead_Time_1 = [];
   Text_1_Type[] Text_1 = [];
|};

public type Code_Source_Information_1_Type record {|
   string Agency_Qualifier_Code;
   string Source_Subqualifier?;
|};

public type Industry_Code_Identification_1_Type record {|
   string Code_List_Qualifier_Code?;
   string Industry_Code?;
|};

public type LM_Loop_1_GType record {|
   Code_Source_Information_1_Type Code_Source_Information_1?;
   Industry_Code_Identification_1_Type[] Industry_Code_Identification_1 = [];
|};

public type PO1_Loop_GType record {|
   Baseline_Item_Data_Type Baseline_Item_Data?;
   Additional_Item_Detail_Type[] Additional_Item_Detail = [];
   Pricing_Information_1_Type[] Pricing_Information_1 = [];
   Product_Item_Description_Type[] Product_Item_Description = [];
   Service_Characteristic_Identification_Type[] Service_Characteristic_Identification = [];
   Measurements_Type[] Measurements = [];
   Paperwork_1_Type[] Paperwork_1 = [];
   Administrative_Communications_Contact_1_Type[] Administrative_Communications_Contact_1 = [];
   Terms_of_Sale_Deferred_Terms_of_Sale_1_Type Terms_of_Sale_Deferred_Terms_of_Sale_1?;
   Date_Time_Reference_1_Type[] Date_Time_Reference_1 = [];
   Restrictions_Conditions_1_Type Restrictions_Conditions_1?;
   Quantity_Information_1_Type[] Quantity_Information_1 = [];
   Monetary_Amount_Information_1_Type[] Monetary_Amount_Information_1 = [];
   REF_Loop_GType[] REF_Loop = [];
   SLN_Loop_GType[] SLN_Loop = [];
   N1_Loop_1_GType[] N1_Loop_1 = [];
   LM_Loop_1_GType[] LM_Loop_1 = [];
|};

public type Transaction_Set_Trailer_Type record {|
   int Number_of_Included_Segments;
   string Transaction_Set_Control_Number;
|};

public type Procurement_Notices record {|
   Transaction_Set_Header_Type Transaction_Set_Header;
   Beginning_Segment_for_Procurement_Notices_Type Beginning_Segment_for_Procurement_Notices;
   Terms_of_Sale_Deferred_Terms_of_Sale_Type[] Terms_of_Sale_Deferred_Terms_of_Sale = [];
   Restrictions_Conditions_Type[] Restrictions_Conditions = [];
   Pricing_Information_Type[] Pricing_Information = [];
   F_O_B__Related_Instructions_Type F_O_B__Related_Instructions?;
   Monetary_Amount_Information_Type[] Monetary_Amount_Information = [];
   Quantity_Information_Type[] Quantity_Information = [];
   Date_Time_Reference_Type[] Date_Time_Reference = [];
   Lead_Time_Type[] Lead_Time = [];
   Paperwork_Type[] Paperwork = [];
   Text_Type[] Text = [];
   N1_Loop_GType[] N1_Loop = [];
   LM_Loop_GType[] LM_Loop = [];
   PO1_Loop_GType[] PO1_Loop = [];
   Transaction_Set_Trailer_Type Transaction_Set_Trailer;
|};

