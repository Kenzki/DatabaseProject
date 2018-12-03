drop trigger REGTriggerAllFieldsEntered;
drop trigger REGTriggerEmailExists;
drop trigger REGTriggerUsernameExists;
drop trigger REGTriggerFieldValidation;
drop trigger REGTriggerCheckAge;

/******************************************************************************/


--------------------REGISTER : FIELDS NULL--------------------------------------
CREATE OR REPLACE TRIGGER REGTriggerAllFieldsEntered
BEFORE INSERT OR UPDATE ON Account

FOR EACH ROW
DECLARE
T_Name "ACCOUNT".Name%type;
T_Email "ACCOUNT".Email%type;
T_Username "ACCOUNT".Username%type;
T_Password "ACCOUNT".Password%type;

BEGIN
T_Name := :new.Name;
T_Email := :new.Email;
T_Username := :new.Username;
T_Password := :new.Password;

if (T_Name is null) then
RAISE_APPLICATION_ERROR(-20000,'ERROR! No Name Entered!!');

Elsif(T_Email is null) then
RAISE_APPLICATION_ERROR(-20001,'ERROR! No Email Entered!!');

Elsif(T_Username is null) then
RAISE_APPLICATION_ERROR(-20002,'ERROR! No Username Entered!!');

Elsif(T_Password is null) then
RAISE_APPLICATION_ERROR(-20003,'ERROR! No Password Entered!!');

END IF;

END;
/




--------------------REGISTER : EMAIL EXISTS-------------------------------------
CREATE OR REPLACE TRIGGER REGTriggerEmailExists
BEFORE INSERT OR UPDATE ON Account

FOR EACH ROW
DECLARE
T_EmailEntered varchar2(30);
T_EmailExisting varchar2(30);


BEGIN
T_EmailEntered :=(:New.Email);

SELECT EMAIL INTO T_EmailExisting FROM ACCOUNT
  WHERE EMAIL = T_EmailEntered;
  
  EXCEPTION
  WHEN NO_DATA_FOUND THEN 
  T_EmailExisting := NULL;  
  
  IF T_EmailEntered = T_EmailExisting
    THEN
      RAISE_APPLICATION_ERROR(-20004,'ERROR! Email Already exists in Database!!');
    ELSE
     DBMS_output.Put_LINE('Succesfully added');
  END IF;
END;
/


--------------------REGISTER : USERNAME EXISTS----------------------------------
CREATE OR REPLACE TRIGGER REGTriggerUsernameExists
BEFORE INSERT OR UPDATE ON Account
FOR EACH ROW
DECLARE
T_UsernameEntered varchar2(30);
T_UsernameExisting varchar2(30);

BEGIN
T_UsernameEntered :=(:New.Username);

SELECT USERNAME INTO T_UsernameExisting FROM Account
WHERE USERNAME = T_UsernameEntered;

EXCEPTION
WHEN NO_DATA_FOUND THEN
T_UsernameExisting := NULL;

IF T_UsernameEntered = T_UsernameExisting
THEN 
  RAISE_APPLICATION_ERROR(-20004, 'Error - Username already exists');
ELSE
  DBMS_OUTPUT.PUT_LINE('Successfully added');
END IF;
END;
/


--------------------REGISTER : VALUE VALIDATED----------------------------------
CREATE OR REPLACE TRIGGER REGTriggerFieldValidation
BEFORE INSERT OR UPDATE ON Account

FOR EACH ROW 
DECLARE
T_Name "ACCOUNT".Name%type;
T_Email "ACCOUNT".Email%type;
T_Username "ACCOUNT".Username%type;
T_Password "ACCOUNT".Password%type;

BEGIN 
T_Name := :new.Name;
T_Email := :new.Email;
T_Username := :new.Username;
T_Password := :new.Password;

 -- Lengths
 IF(LENGTH(T_Name) > 29)THEN
    RAISE_APPLICATION_ERROR(-20006,'Error - Name too long, must be less than 30 characters');
 ELSIF(LENGTH(T_Username) > 29) THEN
    RAISE_APPLICATION_ERROR(-20007,'Error - Username too long, must be less than 30 characters');
 ELSIF(LENGTH(T_Password) > 14 ) THEN
    RAISE_APPLICATION_ERROR(-20008,'Error - Password too long, must be less than 15 characters');
 ELSIF(LENGTH(T_Password) < 5) THEN
    RAISE_APPLICATION_ERROR(-20009,'Error Password too short, must be at least 5 characters');
    
    
  --Regex
 ELSIF REGEXP_LIKE (T_Email, '[A-Z0-9._%-]+@[A-Z0-9._%-]+\.[A-Z]{2,4}') THEN
    RAISE_APPLICATION_ERROR(-20010,'Error - Invalid characters entered in Email Address, only @ and . allowed');
 ELSIF NOT REGEXP_LIKE (T_Username, '^[a-zA-Z0-9]+$') THEN
    RAISE_APPLICATION_ERROR(-20011,'Error - Invalid characters entered in Username, only letters and numbers allowed');
 ELSIF REGEXP_LIKE (T_Name, '^[a-zA-Z\s]+$') THEN
    RAISE_APPLICATION_ERROR(-20012,'Error - Invalid characters entered in Name, only letters allowed');
 
--Password regex - must contain one number and one uppercase letter and one lowercase letter  
 ELSIF REGEXP_LIKE(T_Password, '^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{5,15}$') THEN 
    RAISE_APPLICATION_ERROR(-20014,'Error - Password must contain One Uppercase letter, one Lowercase letter, One Number. It may not contain an special characters.');
  END IF;
END;

/

------------ Trigger ensures user is at least 18--------------
CREATE TRIGGER REGTriggerCheckAge
BEFORE INSERT OR UPDATE ON Account
FOR EACH ROW
BEGIN
    IF :NEW.DOB >  add_months(sysdate , -12*18)  then
       RAISE_APPLICATION_ERROR(-20001, 'YOU ARE UNDER 18 - Access Denied');
    END IF;
END;

