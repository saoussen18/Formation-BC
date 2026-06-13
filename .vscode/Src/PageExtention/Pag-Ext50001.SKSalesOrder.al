pageextension 50001 "SK Sales Order" extends "Sales Order"
{
    //***********Documentation********************
    // SK01  23/05/2026 : Add Fields 
    // <<SK01
    layout
    {
        modify("Posting Date")
        {
            trigger OnAfterValidate()
            begin
                if Rec."Posting Date" >= 20221231D THEN
                    Error('Vous devez saisie une date inférieur à 31/12/2022');
            end;
        }
        modify("Sell-to Customer Name")
        {
            Editable = false;
            StyleExpr = true;
            Style = Favorable;
        }
        addbefore("Sell-to Address")
        {
            field(CIN; Rec.CIN)
            {
                ApplicationArea = All;
            }
            field("Passeport No."; Rec."Passeport No.")
            {
                ApplicationArea = All;
            }
        }
    }
    // >>SK01
}
