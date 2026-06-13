table 50002 "SK Intervention Lines"
{
    CaptionMl = ENU = 'Intervention Lines', FRA = 'Lignes interventions';
    DataClassification = ToBeClassified;
    LookupPageId = "SK Intervention Line";
    DrillDownPageId = "SK Intervention Line";
    fields
    {
        field(1; "Document No."; Code[20])
        {
            CaptionMl = ENU = 'Document No.', FRA = 'N° document';
            Editable = false;
        }
        field(2; "Line No."; Integer)
        {
            CaptionMl = ENU = 'Line No.', FRA = 'N° ligne';
            Editable = false;
        }
        field(3; "Item No."; Code[20])
        {
            CaptionMl = ENU = 'Item No.', FRA = 'N° article';
            TableRelation = Item;
            trigger OnValidate()
            var
                lItem: Record Item;
            begin
                Rec."Item Designation " := '';
                If lItem.get(Rec."Item No.") then
                    Rec."Item Designation " := lItem.Description;
            end;
        }
        field(4; "Item Designation "; Text[50])
        {
            CaptionMl = ENU = 'Item Designation', FRA = 'Désignation article';
            Editable = false;
        }
        field(5; Quantity; Decimal)
        {
            CaptionMl = ENU = 'Quantity', FRA = 'Quantité';
            trigger OnValidate()
            begin
                Rec.Amount := Rec.Quantity * Rec."Unit Price";
            end;
        }
        field(6; "Unit Price"; Decimal)
        {
            CaptionMl = ENU = 'Unit Price', FRA = 'Prix unitaire';
            trigger OnValidate()
            begin
                Rec.Amount := Rec.Quantity * Rec."Unit Price";
            end;
        }
        field(7; Amount; Decimal)
        {
            CaptionMl = ENU = 'Amount', FRA = 'Montant';
            Editable = false;
        }
    }
    keys
    {
        key(PK; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    begin
        Rec."Line No." := GetNextLine(Rec."Document No.");
    end;

    local procedure GetNextLine(pDocumentNo: Code[20]): integer
    var
        lInterventionLines: Record "SK Intervention Lines";
    begin
        lInterventionLines.Reset();
        lInterventionLines.SetCurrentKey("Document No.", "Line No.");
        lInterventionLines.SetRange("Document No.", pDocumentNo);
        if lInterventionLines.FindLast() then
            EXIT(lInterventionLines."Line No." + 10000)
        else
            exit(10000)
    end;

}
