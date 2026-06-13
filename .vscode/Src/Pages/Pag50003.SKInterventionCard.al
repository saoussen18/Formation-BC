page 50003 "SK Intervention Card"
{
    // SK .....
    CaptionML = ENU = 'Intervention Card', FRA = 'Fiche intervention';
    PageType = Document;
    SourceTable = "SK Intervention Header";
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Consultant No."; Rec."Consultant No.")
                {
                    ApplicationArea = All;
                }
                field("Consultant Name"; Rec."Consultant Name")
                {
                    ApplicationArea = All;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                }
                field("Customer Adress"; Rec."Customer Adress")
                {
                    ApplicationArea = All;
                }
                field("Customer Email"; Rec."Customer Email")
                {
                    ApplicationArea = All;
                }
                field("Intervention Date"; Rec."Intervention Date")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = All;
                }

            }
            part("SK Intervention Line"; "SK Intervention Line")
            {
                ApplicationArea = All;
                SubPageLink = "Document No." = field("No.");
            }

        }

    }
    actions
    {
        area(Processing)
        {
            action(Released)
            {
                Image = ReleaseDoc;
                CaptionMl = ENU = 'Released', FRA = 'Lancer';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = all;
                trigger OnAction()
                var
                    lText001: TextConst ENU = 'Do you want to release this document?',
                                        FRA = 'Voulez-vous lancer ce document?';
                begin
                    Rec.TestField(Status, Rec.Status::Opened);
                    If Confirm(lText001) then begin
                        Rec.Status := Rec.Status::Released;
                        Rec.Modify();
                    end;
                end;
            }
        }
        area(Reporting)
        {
            action(Print)
            {

                ApplicationArea = All;
                CaptionML = ENU = 'Print', FRA = 'Imprimer';
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    lInterventionHeader: Record "SK Intervention Header";
                    lIntervention: Report "SK Intervention";
                begin
                    lInterventionHeader.Reset();
                    lInterventionHeader.SetRange("No.", Rec."No.");
                    If lInterventionHeader.FindSet() then begin
                        lIntervention.SetTableView(lInterventionHeader);
                        lIntervention.Run();
                    end;
                    //Report.Run(Report::"SK Intervention", true, true);  autre syntaxce sans passer par le filtrage de
                end;
            }
        }
    }
}
