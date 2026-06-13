report 50003 "SK Inventory Value"
{
    ApplicationArea = All;
    CaptionML = ENU = 'Inventory Value', FRA = 'Valeur Stock';
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './.vscode/src/report/rdlc/InventoryValue.rdlc';
    dataset
    {

        dataitem(Item; Item)
        {
            RequestFilterFields = "No.", "Item Category Code";
            column(Picture_; CompanyInfo.Picture)
            {

            }
            column(No_; "No.")
            {

            }
            column(Item_Category_Code; "Item Category Code")
            {

            }
            column(Description; Description)
            {

            }
            column(Inventory; Inventory)
            {

            }
            column(Unit_Cost; "Unit Cost")
            {

            }
            column(TotalValueText; TotalValueText)
            {

            }
            column(TotalValue; TotalValue)
            {

            }
            column(FilterText; FilterText)
            {

            }
            trigger OnAfterGetRecord()
            begin
                TotalValue := "Unit Cost" * Inventory;
            end;

            trigger OnPreDataItem()
            begin
                FilterText := Item.GetFilters();
            end;
        }
    }


    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }

    }
    trigger OnPreReport()
    begin
        CompanyInfo.get();
        CompanyInfo.CalcFields(Picture);
    end;

    var
        TotalValueText: TextConst ENU = 'Total Value', FRA = 'Valeur total';
        TotalValue: Decimal;
        CompanyInfo: Record "Company Information";
        FilterText: Text;
}
