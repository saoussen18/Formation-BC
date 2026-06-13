tableextension 50001 "SK Sales Header" extends "Sales Header"
{
    //***********Documentation********************
    // SK01  23/05/2026 : Add Fields 
    // <<SK01 
    fields
    {
        modify("Sell-to Customer No.")
        {
            trigger OnAfterValidate()
            var
                lCustomer: Record Customer;
            begin
                Rec.CIN := '';
                Rec."Passeport No." := '';
                if lCustomer.Get("Sell-to Customer No.") then begin
                    Rec.CIN := lCustomer.CIN;
                    Rec."Passeport No." := lCustomer."Passeport No.";
                end;
            end;
        }

        field(50000; CIN; Code[8])
        {
            CaptionML = ENU = 'CIN', FRA = 'CIN';
            Editable = false;
            DataClassification = ToBeClassified;

        }
        field(50001; "Passeport No."; Code[20])
        {
            CaptionML = ENU = 'Passeport No.', FRA = 'N° Passeport';
            Editable = false;
            DataClassification = ToBeClassified;
        }
    }
    //>>SK01
}
