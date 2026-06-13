codeunit 50000 "SK Sales Subscribers"
{
    [EventSubscriber(ObjectType::Table, Database::"Sales Invoice Header", 'OnAfterDeleteEvent', '', false, false)]
    local procedure OnAfterDeleteInvoice(var Rec: Record "Sales Invoice Header")
    var
        ErrorTxt: TextConst ENU = 'You cannot delete an approved document', FRA = 'Vous ne pouvez pas supprimer un document validé';
    begin
        Error(ErrorTxt);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterCheckMandatoryFields', '', false, false)]
    local procedure OnAfterCheckMandatoryFields(var SalesHeader: Record "Sales Header"; CommitIsSuppressed: Boolean)

    begin
        // if SalesHeader."Salesperson Code" = '' THEN
        //     Error('Vous devez saisie le code vendeur');
        if SalesHeader."Document Type" = SalesHeader."Document Type"::Invoice then
            SalesHeader.TestField("Salesperson Code");
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforeSalesInvHeaderInsert', '', false, false)]
    local procedure OnBeforeSalesInvHeaderInsert(var SalesInvHeader: Record "Sales Invoice Header"; SalesHeader: Record "Sales Header"; CommitIsSuppressed: Boolean)
    var
        lSaleSetup: record "Sales & Receivables Setup";
    begin
        lSaleSetup.get();

        SalesInvHeader."Amount Including VAT" := SalesInvHeader."Amount Including VAT" + lSaleSetup."Tax Amount";

    end;


    // [EventSubscriber(ObjectType::Page, Page::"Customer Card", 'OnOpenPageEvent', '', true, true)]
    // local procedure CheckAddressLineOnBeforeValidateEvent(var Rec: Record Customer)
    // begin
    //     Message('Ce client' + Rec."No." + ' ' + Rec.Name);
    // end;



    // 5edma 3al table ligne 

    // [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateEvent', 'Quantity', false, false)]
    // local procedure OnAfterValidateQuantity(var Rec: Record "Sales Line")
    // var
    //     litem: record Item;
    //     lSaleSetup: record "Sales & Receivables Setup";
    //     lSalesLine: record "Sales Line";
    // begin
    //     litem.get(rec."No.");
    //     if litem."Need Transport" = true THEN begin
    //         lSaleSetup.get();
    //         lSalesLine.init();
    //         lSalesLine."Document Type" := rec."Document Type";
    //         lSalesLine."Document No." := rec."Document No.";
    //         lSalesLine.setrange("Document Type", rec."Document Type");   // hy a el equal ( bech yselecti)
    //         lSalesLine.setrange("Document No.", rec."Document No.");
    //         lSalesLine.setrange("No.", lSaleSetup."Transport Item No.");
    //         if not lSalesLine.FindFirst() then begin
    //             lSalesLine."Line No." := GetLastLine(rec."Document Type", rec."Document No.") + 10000;
    //             lSalesLine.Type := lSalesLine.Type::item;
    //             lSaleSetup.TestField("Transport Item No.");
    //             lSalesLine.Validate("No.", lSaleSetup."Transport Item No.");   // validate bech yet3ada bel traitement el standard mta3 champ edheka par exemple kif bvech y3abi el article ywalli yjib directement les champs lies lih
    //             lSalesLine.Validate(Quantity, 1);
    //             lSalesLine.Insert();   //dima n3abiw les champs 9bal insert sauf table 37 ta3 facture n3abiw cle 9bal na3mlou insert ba3ed nkamlou n3abi b9yet les champ wna3ml modify
    //         end;


    //     end;


    //end;

    // pour refresh ne5dmou 3l page 
    procedure InsertTransportLine(var Rec: Record "Sales Line")
    var
        litem: record Item;
        lSaleSetup: record "Sales & Receivables Setup";
        lSalesLine: record "Sales Line";
    begin
        litem.get(rec."No.");
        if litem."Need Transport" = true THEN begin
            lSaleSetup.get();
            lSalesLine.init();
            lSalesLine."Document Type" := rec."Document Type";
            lSalesLine."Document No." := rec."Document No.";
            lSalesLine.setrange("Document Type", rec."Document Type");   // hy a el equal ( bech yselecti)
            lSalesLine.setrange("Document No.", rec."Document No.");
            lSalesLine.setrange("No.", lSaleSetup."Transport Item No.");
            if not lSalesLine.FindFirst() then begin
                lSalesLine."Line No." := GetLastLine(rec."Document Type", rec."Document No.") + 10000;
                lSalesLine.Type := lSalesLine.Type::item;
                lSaleSetup.TestField("Transport Item No.");
                lSalesLine.Validate("No.", lSaleSetup."Transport Item No.");   // validate bech yet3ada bel traitement el standard mta3 champ edheka par exemple kif bvech y3abi el article ywalli yjib directement les champs lies lih
                lSalesLine.Validate(Quantity, 1);
                lSalesLine.Insert();   //dima n3abiw les champs 9bal insert sauf table 37 ta3 facture n3abiw cle 9bal na3mlou insert ba3ed nkamlou n3abi b9yet les champ wna3ml modify
            end;


        end;
    end;

    procedure GetLastLine(pDocumentType: Enum "Sales Document Type"; pdocumentNo: code[20]): integer
    var
        lSalesLine: record "Sales Line";
    begin
        lSalesLine.reset();
        lSalesLine.SetCurrentKey("Document Type", "Document No.", "Line No."); // pour trier les lignes    obligatoire pour get line
        lSalesLine.setrange("Document Type", pDocumentType);   // hy a el equal ( bech yselecti)
        lSalesLine.setrange("Document No.", pdocumentNo);
        if lSalesLine.FindLast() then     // hya el select
            EXIT(lSalesLine."Line No.");

    end;
}

