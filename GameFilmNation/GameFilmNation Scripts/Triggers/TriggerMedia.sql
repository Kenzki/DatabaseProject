drop trigger MEDTriggerAllFieldsEntered;
drop trigger MEDTriggerFieldValidation;

/******************************************************************************/

--------------------MEDIA : FIELDS NULL-----------------------------------------
CREATE OR REPLACE TRIGGER MEDTriggerAllFieldsEntered
BEFORE INSERT OR UPDATE ON Media

FOR EACH ROW 
DECLARE
T_Name media.Name%type;
T_Description media.Description%type;
T_YEARRELEASED media.YearReleased%type;
T_AGERATING media.AgeRating%type;
T_BUDGET media.Budget%type;
T_PRIMARYGENRE media.PrimaryGenre%type;
T_SECONDARYGENRE media.SecondaryGenre%type;
T_MEDIATYPE media.MediaType%type;
T_PLATFORM media.Platform%type;
T_AVERAGERATING media.AverageRating%type;

BEGIN
T_Name := :new.Name;
T_Description := :new.Description;
T_YearReleased := :new.YearReleased;
T_AGERATING := :new.AgeRating;
T_BUDGET := :new.Budget;
T_PRIMARYGENRE := :new.PrimaryGenre;
T_SECONDARYGENRE := :new.SecondaryGenre;
T_MEDIATYPE := :new.MediaType;
T_PLATFORM := :new.Platform;
T_AVERAGERATING := :new.AverageRating;

  ---Check if empty value inputted and display appropriate error message
   IF(T_Name is null) then
    RAISE_APPLICATION_ERROR(-20000,'Error - No Name Entered');
   ELSIF(T_Description is null) then
    RAISE_APPLICATION_ERROR(-20000,'Error - No Description Entered');
   ELSIF(T_YearReleased is null) then
    RAISE_APPLICATION_ERROR(-20000,'Error - No Year Entered');
  ELSIF(T_AgeRating is null) then
    RAISE_APPLICATION_ERROR(-20000,'Error - No Age Rating entered');
   ELSIF(T_Budget is null) then
    RAISE_APPLICATION_ERROR(-20000,'Error - No Budget Entered');
   ELSIF(T_PrimaryGenre is null) then
    RAISE_APPLICATION_ERROR(-20000,'Error - No Primary Genre Entered');

--This checks if null and puts an auto value in   
   ELSIF(T_SecondaryGenre is null) then
    T_SecondaryGenre := 'None';
  
   ELSIF(T_mediatype is null) then
    RAISE_APPLICATION_ERROR(-20000,'Error - No media type entered');
   ELSIF(T_platform is null) then
    RAISE_APPLICATION_ERROR(-20000,'Error - No platform entered');
 end if;
 end;
 /




--------------------MEDIA : VALUE VALIDATED-------------------------------------

CREATE OR REPLACE TRIGGER MEDTriggerFieldValidation
BEFORE INSERT OR UPDATE ON Media

FOR EACH ROW 
DECLARE
T_Name media.Name%type;
T_Description media.Description%type;
T_YEARRELEASED media.YearReleased%type;
T_AGERATING media.AgeRating%type;
T_BUDGET media.Budget%type;
T_PRIMARYGENRE media.PrimaryGenre%type;
T_SECONDARYGENRE media.SecondaryGenre%type;
T_MEDIATYPE media.MediaType%type;
T_PLATFORM media.Platform%type;
T_AVERAGERATING media.AverageRating%type;

BEGIN 
T_Name := :new.Name;
T_Description := :new.Description;
T_YearReleased := :new.YearReleased;
T_AGERATING := :new.AgeRating;
T_BUDGET := :new.Budget;
T_PRIMARYGENRE := :new.PrimaryGenre;
T_SECONDARYGENRE := :new.SecondaryGenre;
T_MEDIATYPE := :new.MediaType;
T_PLATFORM := :new.Platform;
T_AVERAGERATING := :new.AverageRating;


----------LENGTHS----------
  IF(LENGTH(T_Name) > 40) THEN
    RAISE_APPLICATION_ERROR(-20000,'Error - Title too long, must be less than 40 characters');
  ELSIF(LENGTH(T_Description) > 200) THEN
    RAISE_APPLICATION_ERROR(-20000,'Error - Description too long, must be less than 200 characters');
  ELSIF(LENGTH(T_YearReleased) > 4 ) THEN
    RAISE_APPLICATION_ERROR(-20000,'Error - Year Released too long, must be less than 4 characters');
  ELSIF(LENGTH(T_AgeRating) > 5 ) THEN
    RAISE_APPLICATION_ERROR(-20000,'Error - AgeRating too long, must be less than 5 characters');
  ELSIF(LENGTH(T_Budget) > 10 ) THEN
    RAISE_APPLICATION_ERROR(-20000,'Error - Budget too long, must be less than 10 characters');
  ELSIF(LENGTH(T_PrimaryGenre) > 15) THEN
    RAISE_APPLICATION_ERROR(-20000, 'Error - Primary Genre too long, must be less than 15 characters');
  ELSIF(LENGTH(T_SecondaryGenre) > 15) THEN
    RAISE_APPLICATION_ERROR(-20000, 'Error - Secondary Genre too long, must be less than 15 characters');
  ELSIF(LENGTH(T_MediaType) > 1) THEN
    RAISE_APPLICATION_ERROR(-20000, 'Error - Media type too long, must be only 1 character');  
  ELSIF(LENGTH(T_Platform) > 15 ) THEN
    RAISE_APPLICATION_ERROR(-20000,'Error - Platform too long, must be less than 15 characters');
  

  
  
 ---------REGEX----------
   ELSIF NOT REGEXP_LIKE (T_YearReleased, '^[0-9]*$') THEN
    RAISE_APPLICATION_ERROR(-20000,'Error - Invalid characters entered in Year Released. Only numeric allowed');
  ELSIF not REGEXP_LIKE (T_Budget, '^[0-9]*$') THEN
    RAISE_APPLICATION_ERROR(-20000,'Error - Invalid characters entered in Budget, Only numeric allowed');
 
  
    
 END IF;
END;
