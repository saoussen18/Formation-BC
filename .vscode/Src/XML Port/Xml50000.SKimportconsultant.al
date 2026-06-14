xmlport 50000 "SK import consultant"
{
    DIRECTION = import;
    Format = VariableText;
    TextEncoding = UTF8;
    FieldDelimiter = '"';
    FieldSeparator = ';';
    UseRequestPage = false;
    Caption = 'SK import consultant';
    schema
    {
        textelement(RootNodeName)
        {
            tableelement(SKConsultant; "SK Consultant")
            {
                AutoReplace = false;
                AutoSave = false;
                AutoUpdate = false;
                XmlName = 'Consultant';
                fieldelement(No; SKConsultant."No.")
                {
                }
                fieldelement(Name; SKConsultant.Name)
                {
                }
                fieldelement(Email; SKConsultant.Email)
                {
                }
                fieldelement(Adress; SKConsultant.Adress)
                {
                }
                fieldelement(Department; SKConsultant.Department)
                {
                }
                fieldelement(PhoneNo; SKConsultant."Phone No.")
                {
                }
                trigger OnBeforeInsertRecord()
                var
                    //lconsultant : record "SK Consultant" ;
                    lImportManagment: codeunit "sk Import Managment";
                begin
                    // lconsultant.init();
                    // lconsultant."No.":=SKConsultant."No.";
                    // lconsultant.Name:=SKConsultant.Name;
                    // lconsultant.Adress:=SKConsultant.Adress;
                    // lconsultant.Department:=SKConsultant.Department;
                    // lconsultant.Email:=SKConsultant.Email;
                    // lconsultant."Phone No.":=SKConsultant."Phone No.";
                    // lconsultant.Insert();
                    lImportManagment.importConsultant(SKConsultant);
                end;
            }

        }
    }

}
