pageextension 50006 "SK Sales Invoice Subform " extends "Sales Invoice Subform"
{
    layout
    {
        modify(Quantity)
        {
            trigger OnAfterValidate()
            var
                SKSalesSubscribers: codeunit "SK Sales Subscribers";
            begin
                SKSalesSubscribers.InsertTransportLine(Rec);
                //  Rec.SetCurrentKey("Document Type", "Document No.", "Line No.");   // tartib les ligne bel key  
                CurrPage.Update();

            end;
        }
    }
}
