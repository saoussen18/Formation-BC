tableextension 50002 "SK Sales Invoice Header" extends "Sales Invoice Header"
{
    //***********Documentation********************
    // SK01  23/05/2026 : Add Fields 
    // <<SK01
    fields
    {
        field(50000; CIN; code[8])
        {
            CaptionML = ENU = 'CIN', FRA = 'CIN';
            DataClassification = ToBeClassified;
        }
        field(50001; "Passeport No."; Code[20])
        {
            CaptionML = ENU = 'Passeport No.', FRA = 'N° Passeport';
            DataClassification = ToBeClassified;
        }
    }
    // >>SK01
}
