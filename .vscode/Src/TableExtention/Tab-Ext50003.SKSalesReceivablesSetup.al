tableextension 50003 "SK Sales & Receivables Setup " extends "Sales & Receivables Setup"
{
    fields
    {
        field(50000; "Intervention Nos."; Code[20])
        {
            CaptionMl = ENU = 'Intervention Nos.', FRA = 'Nos intervention';
            TableRelation = "No. Series";
            DataClassification = ToBeClassified;
        }
        field(50001; "Transport Item No."; Code[20])
        {
            CaptionMl = ENU = 'Transport Item No. ', FRA = 'N° article transport ';
            TableRelation = Item;
            DataClassification = ToBeClassified;
        }
        field(50002; "Tax Amount"; Decimal)
        {
            CaptionMl = ENU = 'Tax Amount ', FRA = 'Montant taxe ';
            DataClassification = ToBeClassified;
        }
    }
}
