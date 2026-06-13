page 50001 "SK Consultant Card"
{
    CaptionMl = ENU = 'Consultant Card', FRA = 'Fiche consultant';
    PageType = Card;
    SourceTable = "SK Consultant";

    layout
    {
        area(Content)
        {
            group(General)
            {
                CaptionMl = ENU = 'General', FRA = 'Général';
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field(Adress; Rec.Adress)
                {
                    ApplicationArea = All;
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = All;
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = All;
                }


                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
