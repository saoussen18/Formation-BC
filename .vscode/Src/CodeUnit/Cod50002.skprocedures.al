codeunit 50002 "sk Import Managment"
{
    procedure importConsultant(SKConsultant: Record "SK Consultant")
    var
        lconsultant: record "SK Consultant";
    begin

        lconsultant.init();
        lconsultant."No." := SKConsultant."No.";
        lconsultant.Name := SKConsultant.Name;
        lconsultant.Adress := SKConsultant.Adress;
        lconsultant.Department := SKConsultant.Department;
        lconsultant.Email := SKConsultant.Email;
        lconsultant."Phone No." := SKConsultant."Phone No.";
        lconsultant.Insert();
    end;
}
