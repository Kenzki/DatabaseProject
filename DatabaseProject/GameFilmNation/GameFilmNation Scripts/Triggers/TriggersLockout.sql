
--Login Lockout
CREATE OR REPLACE TRIGGER TriggerLockout
BEFORE INSERT OR UPDATE OF Status ON Account

DECLARE
  InsertedEmail VARCHAR2(30);
  InsertedPassword VARCHAR2(15);
  ExistingEmail VARCHAR2(30);
  ExistingPassword VARCHAR2(15);
  CurSysTime TIMESTAMP;
  BlockTime TIMESTAMP;
  WrongAttempts NUMERIC(1);

BEGIN
  InsertedEmail := :new.Email;
  InsertedPassword := :new.Password;
  WrongAttempts := 0;
  
  SELECT Email INTO ExistingEmail FROM Account WHERE Email = ExistingEmail;
  SELECT Password INTO ExistingPassword FROM Account WHERE Email = ExistingEmail;
  SELECT SavedSYSTime into BlockTime FROM Account WHERE Email = ExistingEmail;
  
  IF (ExistingEmail = InsertedEmail) THEN
  
    IF (ExistingPassword = InsertedPassword AND BlockTime <= SYSDATE-1) THEN
      --Logged in Successfully, Reset Status and BlockTime in Account table. 
      UPDATE ACCOUNT SET Status = 'A', SavedSYSTime = null WHERE InsertedEmail = ExistingEmail;
    ELSIF WrongAttempts <4 THEN
      IF WrongAttempts + 1 = 1 THEN RAISE_APPLICATION_ERROR('Incorrect Password you have 4 attempts remaining.');
        ELSIF WrongAttempts + 1 = 2 THEN RAISE_APPLICATION_ERROR('Incorrect Password you have 3 attempts remaining.');
        ELSIF WrongAttempts + 1 = 3 THEN RAISE_APPLICATION_ERROR('Incorrect Password you have 2 attempts remaining.');
        ELSIF WrongAttempts + 1 = 4 THEN RAISE_APPLICATION_ERROR('Incorrect Password you have 1 attempts remaining.');
      END IF;
    ELSE
      UPDATE Account SET SavedSYSTime WHERE Email = ExistingEmail; 
      UPDATE ACCOUNT SET Status = 'D' WHERE Email = ExistingEmail;
    END IF;
    




