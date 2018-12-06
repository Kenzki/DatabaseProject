DROP VIEW REVIEW;


Create VIEW MovieBasicView AS
SELECT Name,YearReleased,AverageRating
FROM MEDIA
WHERE MediaType = 'F';

Create VIEW GameBasicView AS
SELECT Name,YearReleased,Platform,AverageRating
FROM MEDIA
WHERE MediaType = 'G';

Create VIEW EmployeeBasicView AS
SELECT Name, Role 
From Employee;

--View for when a user makes a review--
CREATE OR REPLACE VIEW MediaReviewByUsers
AS SELECT a.UserName, a.MemberLevel, m.Name,r.Description, r.rating
FROM Account a, Media m, Review r
WHERE r.AccountId = a.AccountId
AND r.MediaID = m.MediaId;





--CREATE VIEW EMPLOYEEVIEW
--AS SELECT EMPLOYEEID, DOB, NAME, NATIONALITY
--FROM EMPLOYEE
--WHERE
