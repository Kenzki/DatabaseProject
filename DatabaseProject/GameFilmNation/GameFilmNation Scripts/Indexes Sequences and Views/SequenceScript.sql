DROP SEQUENCE ACCOUNTSEQ;
DROP SEQUENCE CASTSEQ;
DROP SEQUENCE EMPLOYEESEQ;
DROP SEQUENCE MEDIASEQ;
DROP SEQUENCE MEDIACASTSEQ;
DROP SEQUENCE REVIEWSEQ;

--ACCOUNT SEQUENCE--
CREATE SEQUENCE ACCOUNTSEQ
INCREMENT BY 1
START WITH 1
MAXVALUE 99999
MINVALUE 1
CACHE 40;

--CAST SEQUENCE--
CREATE SEQUENCE CASTSEQ
INCREMENT BY 1
START WITH 1
MAXVALUE 99999
MINVALUE 1
CACHE 40;

--EMPLOYEE SEQUENCE--
CREATE SEQUENCE EMPLOYEESEQ
INCREMENT BY 1
START WITH 1
MAXVALUE 99999
MINVALUE 1
CACHE 40;

--MEDIA SEQUENCE--
CREATE SEQUENCE MEDIASEQ
INCREMENT BY 1
START WITH 1
MAXVALUE 99999
MINVALUE 1
CACHE 40;

--MEDIACAST SEQUENCE--
CREATE SEQUENCE MEDIACASTSEQ
INCREMENT BY 1
START WITH 1
MAXVALUE 99999
MINVALUE 1
CACHE 40;

--REVIEW SEQUENCE--
CREATE SEQUENCE REVIEWSEQ
INCREMENT BY 1
START WITH 1
MAXVALUE 99999
MINVALUE 1
CACHE 40;