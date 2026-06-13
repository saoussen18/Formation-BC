table 50001 "SK Intervention Header"
{
    CaptionML = ENU = 'Intervention Header', FRA = 'Entete intervention';
    DataClassification = ToBeClassified;

    fields
    {

        field(1; "No."; Code[20])
        {
            CaptionMl = ENU = 'No.', FRA = 'N°';
        }
        field(2; "Consultant No."; Code[20])
        {
            CaptionMl = ENU = 'Consultant No.', FRA = 'N° consultant';
            TableRelation = "SK Consultant";
            trigger OnValidate()
            var
                lConsultant: Record "SK Consultant";
            begin
                Rec."Consultant Name" := '';
                if lConsultant.Get("Consultant No.") then
                    Rec."Consultant Name" := lConsultant.Name;
            end;
        }
        field(3; "Consultant Name"; Text[100])
        {
            CaptionMl = ENU = 'Consultant Name', FRA = 'Nom consultant';
            Editable = false;
        }
        field(4; "Customer No."; Code[20])
        {
            CaptionMl = ENU = 'Customer No.', FRA = 'N° client';
            TableRelation = Customer;
            trigger OnValidate()
            var
                lCustomer: Record Customer;
            begin
                Rec."Customer Name" := '';
                Rec."Customer Adress" := '';
                Rec."Customer Email" := '';
                if lCustomer.get("Customer No.") then
                    Rec."Customer Name" := lCustomer.Name;
                Rec."Customer Adress" := lCustomer.Address;
                Rec."Customer Email" := lCustomer."E-Mail";
            end;
        }
        field(5; "Customer Name"; Text[50])
        {
            CaptionMl = ENU = 'Customer Name', FRA = 'Nom client';
            Editable = false;
        }
        field(6; "Customer Adress"; Text[50])
        {
            CaptionMl = ENU = 'Customer Adress', FRA = 'Adresse client';
            Editable = false;
        }
        field(7; "Customer Email"; Text[80])
        {
            CaptionMl = ENU = 'Customer Email', FRA = 'Email client';
            //Editable = false;
            trigger OnValidate()
            var
                lText: TextConst ENU = 'Incorrect Mail', FRA = 'Mail incorrect';
            begin
                If not VerifMail(Rec."Customer Email") THEN
                    Error(lText);
            end;
        }
        field(8; "Intervention Date"; Date)
        {
            CaptionMl = ENU = 'Intervention Date', FRA = 'Date intervention';
        }
        field(9; Status; Enum "SK Status")
        {
            CaptionMl = ENU = 'Status', FRA = 'Statut';
            Editable = false;
        }
        field(10; "Total Amount"; Decimal)
        {
            CaptionMl = ENU = 'Total Amount', FRA = 'Montant total';
            FieldClass = FlowField;
            CalcFormula = sum("SK Intervention Lines".Amount where("Document No." = field("No.")));
            Editable = false;
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        lSalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: CodeUnit NoSeriesManagement;
    begin
        lSalesSetup.get;
        lSalesSetup.TESTFIELD("Intervention Nos.");
        "No." := NoSeriesMgt.GetNextNo(lSalesSetup."Intervention Nos.", 0D, TRUE);
        Rec."Intervention Date" := WorkDate();
    end;

    local procedure VerifMail(pMail: text[30]): boolean
    var
        i: integer;
    begin
        For i := 1 to StrLen(pMail) do begin
            If pMail[i] = '@' then
                exit(true)
        end;

        exit(false)

    end;
}
