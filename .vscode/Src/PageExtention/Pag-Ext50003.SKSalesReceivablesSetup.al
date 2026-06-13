pageextension 50003 "SK Sales & Receivables Setup" extends "Sales & Receivables Setup"
{
    layout
    {
        addafter("Price List Nos.")
        {
            field("Intervention Nos."; Rec."Intervention Nos.")
            {
                ApplicationArea = All;
            }
        }
        addlast(General)
        {
            field("Transport Item No."; Rec."Transport Item No.")
            {
                ApplicationArea = all;
            }
            field("Tax Amount"; Rec."Tax Amount")
            {
                ApplicationArea = all;
            }
        }
    }
}
