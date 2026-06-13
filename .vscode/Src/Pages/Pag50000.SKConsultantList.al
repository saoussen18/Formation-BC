page 50000 "SK Consultant List"
{
    CaptionMl = ENU = 'Consultant List', FRA = 'Liste consultant';
    PageType = List;
    SourceTable = "SK Consultant";
    Editable = false;
    CardPageId = "SK Consultant Card";
    UsageCategory = Lists;
    ApplicationArea = all;
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.', Comment = '%';
                }
                field(Adress; Rec.Adress)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Adress field.', Comment = '%';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Department field.', Comment = '%';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Email field.', Comment = '%';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Phone No. field.', Comment = '%';
                }
            }
        }
    }
}
