page 50004 "SK Intervention Line"
{
    CaptionMl = ENU = 'Intervention Line', FRA = 'Ligne intervention';
    PageType = ListPart;
    SourceTable = "SK Intervention Lines";
    layout
    {
        area(Content)
        {
            repeater(General)
            {

                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                }
                field("Item Designation "; Rec."Item Designation ")
                {
                    ApplicationArea = All;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
