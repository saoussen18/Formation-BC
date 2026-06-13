tableextension 50000 "SK Customer" extends Customer
{
    //***********Documentation********************
    // SK01  23/05/2026 : Add Fields 
    // <<SK01
    fields
    {
        modify("Credit Limit (LCY)")
        {
            CaptionML = ENU = 'TEST', FRA = 'teste';
        }

        field(50000; CIN; Code[8])
        {
            CaptionMl = ENU = 'CIN', FRA = 'CIN';
            DataClassification = ToBeClassified;
        }
        field(50001; "Passeport No."; Code[20])
        {
            CaptionMl = ENU = 'Passeport No.', FRA = 'N° Passeport';

            DataClassification = ToBeClassified;
        }

    }
    trigger OnAfterInsert()
    begin
        "Disable Search by Name" := true;
    end;
    // >>SK01
}
