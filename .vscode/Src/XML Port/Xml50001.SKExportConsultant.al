xmlport 50001 "SK Export Consultant"
{
    DIRECTION = export;
    Format = VariableText;
    TextEncoding = UTF8;
    FieldDelimiter = '"';
    FieldSeparator = ';';
    UseRequestPage = false;
    Caption = 'SK Export Consultant';
    schema
    {
        textelement(RootNodeName)
        {
            tableelement(SKConsultant; "SK Consultant")
            {

                fieldelement(No; SKConsultant."No.")
                {
                }
                fieldelement(Name; SKConsultant.Name)
                {
                }
                fieldelement(Adress; SKConsultant.Adress)
                {
                }
                fieldelement(Department; SKConsultant.Department)
                {
                }
                fieldelement(Email; SKConsultant.Email)
                {
                }
                fieldelement(PhoneNo; SKConsultant."Phone No.")
                {
                }
                fieldelement(SystemModifiedAt; SKConsultant.SystemModifiedAt)
                {
                }
                fieldelement(SystemCreatedBy; SKConsultant.SystemCreatedBy)
                {
                }
                fieldelement(SystemId; SKConsultant.SystemId)
                {
                }
                fieldelement(SystemModifiedBy; SKConsultant.SystemModifiedBy)
                {
                }
                fieldelement(SystemCreatedAt; SKConsultant.SystemCreatedAt)
                {
                }
                textelement(test)
                {
                }
                trigger OnAfterGetRecord()
                begin
                    test := SKConsultant."No." + '-' + SKConsultant.Name;
                end;
            }

        }
    }


}
