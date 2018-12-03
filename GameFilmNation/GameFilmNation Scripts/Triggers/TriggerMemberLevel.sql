/*CREATE PROCEDURE ProcedureMemberLevel
AS

BEGIN
SELECT REVIEWCOUNT INTO P_REVIEWCOUNT FROM ACCOUNT

IF P_REVIEWCOUNT = 0  
UPDATE ACCOUNT 
SET MEMBERLEVEL = 'COPPER'
-------------------------------------------
IF P_REVIEWCOUNT = 1  
UPDATE ACCOUNT 
SET MEMBERLEVEL = 'BRONZE'
-------------------------------------------
IF P_REVIEWCOUNT = 2
UPDATE ACCOUNT 
SET MEMBERLEVEL = 'SILVER'
-------------------------------------------
IF P_REVIEWCOUNT = 3 
UPDATE ACCOUNT 
SET MEMBERLEVEL = 'GOLD'
-------------------------------------------
IF P_REVIEWCOUNT = 4  
UPDATE ACCOUNT 
SET MEMBERLEVEL = 'PLATINUM'
-------------------------------------------
IF P_REVIEWCOUNT = 5 
UPDATE ACCOUNT 
SET MEMBERLEVEL = 'DIAMOND'
END  
-------------------------------------------
************************************************************

DROP TRIGGER TriggerSetMemberLevel;

CREATE OR REPLACE TRIGGER TriggerSetMemberLevel
before INSERT OR UPDATE ON Account

FOR EACH ROW
DECLARE
T_MemberLevel "ACCOUNT".MemberLevel%type;
T_ReviewCount "ACCOUNT".ReviewCount%type;
T_TempReviewCount  account.reviewCount%type;
 --pragma autonomous_transaction;

BEGIN

SELECT ReviewCount INTO T_ReviewCount FROM ACCOUNT;

--------------------------------------------------------------------------------
IF (T_ReviewCount = 0)
THEN 
T_TempReviewCount := 'copper';

--UPDATE ACCOUNT SET MEMBERLEVEL = 'COPPER';

--------------------------------------------------------------------------------
ELSIF (T_ReviewCount = 1)
THEN
UPDATE ACCOUNT SET MEMBERLEVEL = 'BRONZE';
--------------------------------------------------------------------------------
ELSIF (T_ReviewCount = 2)
THEN
UPDATE ACCOUNT SET MEMBERLEVEL = 'SILVER';
--------------------------------------------------------------------------------
ELSIF (T_ReviewCount = 3)
THEN
UPDATE ACCOUNT SET MEMBERLEVEL = 'GOLD';
--------------------------------------------------------------------------------
ELSIF (T_ReviewCount = 4)
THEN
UPDATE ACCOUNT SET MEMBERLEVEL = 'PLATINUM';
--------------------------------------------------------------------------------
ELSIF (T_ReviewCount = 5)
THEN
UPDATE ACCOUNT SET MEMBERLEVEL = 'DIAMOND';
--------------------------------------------------------------------------------


END IF;


UPDATE ACCOUNT SET MEMBERLEVEL = T_TempReviewCount;

END;
*/





CREATE OR REPLACE TRIGGER TriggerSetMemberLevel
before INSERT OR UPDATE ON Review

FOR EACH ROW
DECLARE
T_MemberLevel "ACCOUNT".MemberLevel%type;
T_ReviewCount "REVIEW".ReviewCount%type;
T_AccountAccountID account.accountid%type;
T_ReviewAccountID review.accountid%type;

BEGIN
if inserting then
SELECT ReviewCount INTO T_ReviewCount FROM Review
JOIN Account ON Review.accountID = Account.accountID;

SELECT a.accountId into T_AccountAccountID From account a join review r on a.accountid = r.accountid;
Select r.accountID into T_reviewaccountid from review r join account a on T_AccountAccountID = r.accountid;

IF (T_ReviewCount = 0)
THEN 
T_MemberLevel := 'copper';

ELSIF (T_ReviewCount = 1)
THEN 
T_MemberLevel := 'SILVER';

ELSIF (T_ReviewCount = 2)
THEN 
T_MemberLevel := 'GOLD';


END if;
end if;

UPDATE Account a SET MemberLevel = T_MemberLevel where review.AccountID = a.AccountID;
--Try to join review?



END;


