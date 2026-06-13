pageextension 50000 "SK Customer Card" extends "Customer Card"
{
    //***********Documentation********************
    // SK01  23/05/2026 : Add Fields 
    // <<SK01
    layout
    {
        addbefore(Address)
        {
            field(CIN; Rec.CIN)
            {
                ApplicationArea = all;
            }
            field("Passeport No."; Rec."Passeport No.")
            {
                ApplicationArea = all;
            }
        }

    }
    // >>SK01
}
