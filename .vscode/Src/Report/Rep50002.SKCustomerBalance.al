report 50002 "SK Customer Balance"
{
    ApplicationArea = All;
    CaptionMl = ENU = 'Customer Balance', FRA = 'Balance client';
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './.vscode/Src/Report/RDLC/BalanceSK.RDLC';
    dataset
    {
        dataitem(Customer; Customer)
        {
            RequestFilterFields = "No.";
            column(CompanyInfo_picture; CompanyInfo.Picture)
            {
            }
            column(No; "No.")
            {
            }
            column(Name; Name)
            {
            }
            column(Address; Address)
            {
            }
            column(City; City)
            {
            }
            column(PostCode; "Post Code")
            {
            }
            column(PhoneNo; "Phone No.")
            {
            }
            column(CustomerNoCaption; CustomerNoCaption)
            {
            }
            column(CustomerNameCaption; CustomerNameCaption)
            {
            }
            column(AdressCaption; AdressCaption)
            {
            }
            column(CityCaption; CityCaption)
            {
            }
            column(PostCodeCaption; PostCodeCaption)
            {
            }
            column(PhoneNoCaption; PhoneNoCaption)
            {
            }
            dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
            {
                DataItemLink = "Customer No." = field("No.");
                DataItemTableView = where("Document Type" = const(Invoice));

                column(Document_Type; "Document Type")
                {
                }
                column(Document_No_; "Document No.")
                {
                }
                column(Description; Description)
                {
                }
                column(Amount; Amount)
                {
                }
                // column(Debit_Amount; "Debit Amount")
                // {
                // }
                // column(Credit_Amount; "Credit Amount")
                // {
                // }
                column(Remaining_Amount; "Remaining Amount")
                {
                }
                dataitem("Detailed Cust. Ledg. Entry"; "Detailed Cust. Ledg. Entry")
                {
                    //DataItemLink = "Cust. Ledger Entry No." = field("Entry No.");
                    DataItemLink = "Document No." = field("Document No.");
                    //DataItemTableView = sorting("Document No.", "Document Type", "Posting Date"); // where("Entry Type" = filter(Application));

                    column(Entry_Type; "Entry Type")
                    {
                    }
                    column(Posting_Date; "Posting Date")
                    {
                    }
                    column(Document_Type_L; "Document Type")
                    {
                    }
                    column(Document_No_L; "Document No.")
                    {
                    }

                    column(Initial_Document_Type; "Initial Document Type")
                    {
                    }
                    column(Amount_L; Amount)
                    {
                    }
                    column(CustLedgerEntryNo; "Cust. Ledger Entry No.")
                    {

                    }
                    column(AppliedCustLedgerEntryNo; "Applied Cust. Ledger Entry No.")
                    {

                    }
                }

            }
        }

    }
    trigger OnPreReport()
    begin
        CompanyInfo.Get();
        CompanyInfo.CalcFields(Picture);
    end;

    var
        CompanyInfo: Record "Company Information";

        CustomerNoCaption: TextConst ENU = 'No. :', FRA = 'N° :';
        CustomerNameCaption: TextConst ENU = 'Name :', FRA = 'Nom :';
        AdressCaption: TextConst ENU = 'Adress :', FRA = 'Adresse :';
        CityCaption: TextConst ENU = 'City :', FRA = 'Ville :';
        PostCodeCaption: TextConst ENU = 'PostCode :', FRA = 'Code postal :';
        PhoneNoCaption: TextConst ENU = 'PhoneNo :', FRA = 'N° téléphone :';
}
