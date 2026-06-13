table 50000 "SK Consultant"
{
    CaptionMl = ENU = 'SK Consultant';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            CaptionMl = ENU = 'No.', FRA = 'N°';
        }
        field(2; Name; Text[100])
        {
            CaptionMl = ENU = 'Name', FRA = 'Nom';
        }
        field(3; Department; Enum "SK Department")
        {
            CaptionMl = ENU = 'Department', FRA = 'Département';
        }
        field(4; Adress; Text[100])
        {
            CaptionMl = ENU = 'Adress', FRA = 'Adresse';
        }
        field(5; "Phone No."; Code[20])
        {
            CaptionMl = ENU = 'Phone No.', FRA = 'N° téléphone';
        }
        field(6; Email; Text[30])
        {
            CaptionMl = ENU = 'Email', FRA = 'Email';
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
}
