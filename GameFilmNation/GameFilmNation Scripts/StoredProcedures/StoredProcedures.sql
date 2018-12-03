create or replace PROCEDURE SearchByActor(
cursorParam OUT SYS_REFCURSOR, CastMemberName IN VARCHAR2)
AS
m_name Media.Name%Type;
m_Averagerating MEDIA.AVERAGERATING%Type;
m_PrimaryGenre  MEDIA.PRIMARYGENRE%Type;
e_name EMPLOYEE.NAME%Type;
--COMPILES with these abscent, only here to allow for the into clause to put data.

BEGIN

  OPEN cursorParam FOR
  SELECT
  MEDIA.Name,
  MEDIA.AVERAGERATING,
  MEDIA.PRIMARYGENRE,
  EMPLOYEE.NAME 
  INTO m_name,m_AverageRating, m_PrimaryGenre, e_name
  --Keep Getting an issue where an INTO clause is required, it compiles 'With an error', Adding into clause on my only select, issue still happens.... CANNOT COMPREHEND WHY.
FROM
  EMPLOYEE
INNER JOIN CAST
ON
  EMPLOYEE.EMPLOYEEID = CAST.EMPLOYEEID
INNER JOIN MEDIA
ON
  MEDIA.MEDIAID = CAST.MEDIAID
  Where Employee.name = CastMemberName;

END;

/





create or replace PROCEDURE SearchByGenre(
cursorParam OUT SYS_REFCURSOR, genre IN VARCHAR2)
AS
m_name Media.Name%Type;
m_Averagerating MEDIA.AVERAGERATING%Type;
m_PrimaryGenre  MEDIA.PRIMARYGENRE%Type;


BEGIN

  OPEN cursorParam FOR
  SELECT
  MEDIA.Name,
  MEDIA.AVERAGERATING,
  MEDIA.PRIMARYGENRE, 
  INTO m_name,m_AverageRating, m_PrimaryGenre 
FROM Media
  Where PrimaryGenre = genre;
END;





-- Running Procedure to find all films with 'Paul' as an actor
/
DECLARE 
MediaCursor SYS_REFCURSOR;
m_name Media.Name%Type;
m_Averagerating MEDIA.AVERAGERATING%Type;
m_PrimaryGenre  MEDIA.PRIMARYGENRE%Type;
e_name EMPLOYEE.NAME%Type;

BEGIN SearchByActor(MediaCursor, 'Paul');

LOOP 

FETCH MediaCursor INTO m_name,m_AverageRating, m_PrimaryGenre, e_name;

EXIT WHEN MediaCursor%NOTFOUND;
dbms_output.put_line(m_name || ',' || m_AverageRating || ',' ||  m_PrimaryGenre || ',' ||  e_name);

END LOOP;

CLOSE MediaCursor;

END;


