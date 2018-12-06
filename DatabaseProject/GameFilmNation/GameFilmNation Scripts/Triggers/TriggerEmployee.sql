/******************************************************************************/


--------------------EMPLOYEE : FIELDS NULL--------------------------------------
CREATE OR REPLACE TRIGGER EMPTriggerAllFieldsEntered
BEFORE INSERT OR UPDATE ON EMPLOYEE

FOR EACH ROW
DECLARE
T_DOB "EMPLOYEE".DOB%type;
T_Name "EMPLOYEE".Name%type;
T_Role "EMPLOYEE".Role%type;
T_Nationality "EMPLOYEE".Nationality%type;

BEGIN
T_DOB := :new.DOB;
T_Name := :new.Name;
T_Role := :new.Role;
T_Nationality := :new.Nationality;

if (T_DOB is null) then
RAISE_APPLICATION_ERROR(-20000,'ERROR! No DOB Entered!!');

Elsif(T_Name is null) then
RAISE_APPLICATION_ERROR(-20001,'ERROR! No Name Entered!!');

Elsif(T_Role is null) then
RAISE_APPLICATION_ERROR(-20002,'ERROR! No Role Entered!!');

Elsif(T_Nationality is null) then
RAISE_APPLICATION_ERROR(-20003,'ERROR! No Nationality Entered!!');

END IF;
END;
/



--------------------EMPLOYEE : VALUE VALIDATED----------------------------------

CREATE OR REPLACE TRIGGER REGTriggerFieldValidation
BEFORE INSERT OR UPDATE ON Account

FOR EACH ROW
DECLARE
T_DOB "EMPLOYEE".DOB%type;
T_Name "EMPLOYEE".Name%type;
T_Role "EMPLOYEE".Role%type;
T_Nationality "EMPLOYEE".Nationality%type;

BEGIN
T_DOB := :new.DOB;
T_Name := :new.Name;
T_Role := :new.Role;
T_Nationality := :new.Nationality;

-----Lengths-----
 
    IF(LENGTH(T_Name) > 19) THEN
    RAISE_APPLICATION_ERROR(-20007,'Error - Name too long, must be less than 20 characters');
 ELSIF(LENGTH(T_Role) > 19 ) THEN
    RAISE_APPLICATION_ERROR(-20008,'Error - Role too long, must be less than 20 characters');
 ELSIF(LENGTH(T_Nationality) > 19) THEN
    RAISE_APPLICATION_ERROR(-20009,'Error Nationality too long, must be at least 20 characters');
    
    
-----REGEX-----

 ELSIF REGEXP_LIKE (T_Name, '^[a-zA-Z\s]+$') THEN
    RAISE_APPLICATION_ERROR(-20012,'Error - Invalid characters entered in Name, only letters allowed');
 ELSIF REGEXP_LIKE (T_DOB, '[0-9]{2}-[a-zA-Z]{3}-[0-9]{2}') THEN
    RAISE_APPLICATION_ERROR(-20012,'Error - Invalid characters and format entered in Date of Birth, (##-AAA-##');
 ELSIF REGEXP_LIKE (T_Role, '^[a-zA-Z\s]+$') THEN
    RAISE_APPLICATION_ERROR(-20012,'Error - Invalid characters entered in Role, only letters allowed');
 ELSIF REGEXP_LIKE (T_Nationality, '^[a-zA-Z\s]+$') THEN
    RAISE_APPLICATION_ERROR(-20012,'Error - Invalid characters entered in Nationality, only letters allowed');

  END IF;
END;

/