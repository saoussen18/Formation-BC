page 50006 "API CUST"
{
    PageType = API;
    Caption = 'Customer API';
    APIPublisher = 'mycompany';       // Your publisher name (lowercase, no spaces)
    APIGroup = 'customers';           // Logical grouping
    APIVersion = 'v1.0';              // Versioning
    EntityName = 'customer';          // Singular entity name
    EntitySetName = 'customers';      // Plural entity name
    SourceTable = Customer;           // Table to expose
    DelayedInsert = true;

    layout
    {
        area(content)
        {
            field(id; Rec."No.")
            {
                Caption = 'Customer ID';
                Editable = false;
            }
            field(name; Rec.Name)
            {
                Caption = 'Customer Name';
            }
            field(city; Rec.City)
            {
                Caption = 'City';
            }
            field(balance; Rec."Balance (LCY)")
            {
                Caption = 'Balance';
                Editable = false;
            }
        }
    }

    actions
    {
        // No actions needed for GET-only API
    }
}
