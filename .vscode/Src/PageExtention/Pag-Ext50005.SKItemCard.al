pageextension 50005 "SK Item Card" extends "Item Card"
{
    layout
    {
        addafter("Sales Unit of Measure")
        {
            field("Need Transport"; Rec."Need Transport")
            {
                ApplicationArea = all;

            }
        }


    }
}
