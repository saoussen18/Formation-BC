report 50000 "SK Intervention"
{
    ApplicationArea = All;
    CaptionML = ENU = 'Intervention', FRA = 'Intervention';
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './.vscode/Src/Report/RDLC/Intervention.RDLC';
    dataset
    {
        dataitem("SK Intervention Header"; "SK Intervention Header")
        {
            column(No; "No.")
            {
            }
            column(ItemNoCaption; ItemNoCaption)
            {

            }
            column(ItemDescCaption; ItemDescCaption)
            {

            }
            column(QuantityCaption; QuantityCaption)
            {

            }
            column(UnitPriceCaption; UnitPriceCaption)
            {

            }
            column(AmountCaption; AmountCaption)
            {

            }
            column(CompInf_Picture; CompanyInformation.Picture)
            {

            }
            column(CustomerNo; "Customer No.")
            {
            }
            column(CustomerName; "Customer Name")
            {
            }
            column(CustomerEmail; "Customer Email")
            {
            }
            column(CustomerAdress; "Customer Adress")
            {
            }
            column(ConsultantNo; "Consultant No.")
            {
            }
            column(ConsultantName; "Consultant Name")
            {
            }
            column(InterventionDate; "Intervention Date")
            {
            }
            column(Status; Status)
            {
            }
            column(TotalAmount; "Total Amount")
            {
            }
            dataitem("SK Intervention Lines"; "SK Intervention Lines")
            {
                DataItemLink = "Document No." = field("No.");
                column(Line_No_; "Line No.")
                {
                }
                column(Item_No_; "Item No.")
                {
                }
                column(Item_Designation_; "Item Designation ")
                {
                }
                column(Quantity; Quantity)
                {
                }
                column(Unit_Price; "Unit Price")
                {
                }
                column(Amount; Amount)
                {
                }
            }
        }
    }

    trigger OnPreReport()

    begin
        CompanyInformation.get();
        CompanyInformation.CalcFields(Picture);
    end;

    var
        CompanyInformation: Record "Company Information";
        ItemNoCaption: TextConst ENU = 'Item No.', FRA = 'N° article';
        ItemDescCaption: TextConst ENU = 'Description', FRA = 'Description';
        QuantityCaption: TextConst ENU = 'Quantity', FRA = 'Quantité';
        UnitPriceCaption: TextConst ENU = 'Unit Price', FRA = 'Prix unitaire';
        AmountCaption: TextConst ENU = 'Amount', FRA = 'Montant';

}
