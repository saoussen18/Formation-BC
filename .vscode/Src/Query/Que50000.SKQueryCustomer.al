query 50000 "SK Query Customer"
{
    Caption = 'SK Query Customer';
    QueryType = Normal;

    elements
    {
        dataitem(SalesInvoiceLine; "Sales Invoice Line")
        {
            column(DocumentNo; "Document No.")
            {
            }

            column(AmountIncludingVAT; "Amount Including VAT")
            {
                Method = Sum;
            }

        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}
