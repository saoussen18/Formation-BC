page 50002 "SK Intervention List"
{
    ApplicationArea = All;
    CaptionMl = ENU = 'Intervention List', FRA = 'Liste intervention';
    Editable = false;
    CardPageId = "SK Intervention Card";
    PageType = List;
    SourceTable = "SK Intervention Header";
    UsageCategory = Lists;
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }

                field("Consultant No."; Rec."Consultant No.")
                {
                    ApplicationArea = All;
                }
                field("Consultant Name"; Rec."Consultant Name")
                {
                    ApplicationArea = All;
                }

                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                }
                field("Customer Adress"; Rec."Customer Adress")
                {
                    ApplicationArea = All;
                }
                field("Customer Email"; Rec."Customer Email")
                {
                    ApplicationArea = All;
                }

                field("Intervention Date"; Rec."Intervention Date")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
