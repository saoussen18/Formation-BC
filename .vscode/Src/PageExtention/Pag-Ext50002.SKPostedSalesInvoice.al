pageextension 50002 "SK Posted Sales Invoice" extends "Posted Sales Invoice"
{
    //***********Documentation********************
    // SK01  23/05/2026 : Add Fields 
    // <<SK01
    layout
    {
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
