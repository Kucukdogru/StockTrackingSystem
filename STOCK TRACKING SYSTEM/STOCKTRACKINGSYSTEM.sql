CREATE DATABASE STOCKTRACKINGSYSTEM

USE STOCKTRACKINGSYSTEM


CREATE TABLE PRODUCT_PRODUCTCATEGORIES(
ID INT IDENTITY(1,1) PRIMARY KEY,
CATEGORYNAME NVARCHAR(100)
)


CREATE TABLE PRODUCT_PRODUCTSUBCATEGORIES(
ID	INT IDENTITY(1,1) PRIMARY KEY,
CATEGORYID	INT,
SUBCATEGORYNAME	NVARCHAR(100),

CONSTRAINT FK_PRODUCTSUBCATEGORIES_CATEGORY FOREIGN KEY(CATEGORYID) REFERENCES PRODUCT_PRODUCTCATEGORIES(ID)
)



CREATE TABLE PRODUCT_PRODUCT(
ID INT IDENTITY(1,1) PRIMARY KEY,
CATEGORYID INT,
PRODUCTCODE	CHAR(11),
PRODUCTNAME	NVARCHAR(100),
COLOR NVARCHAR(50),
ENERGYLEVEL	VARCHAR(50),
POWER_ INT,
DESCRIPTION_ NVARCHAR(200),
UNITPRICE DECIMAL,

CONSTRAINT FK_PRODUCT_CATEGORY FOREIGN KEY(CATEGORYID) REFERENCES PRODUCT_PRODUCTCATEGORIES(ID)
)	

		

CREATE TABLE SALES_SALES(
ID	INT IDENTITY(1,1) PRIMARY KEY,
PRODUCTID INT,
CUSTOMERID	INT,
DEALERID INT,
DATE_	DATETIME,
EMPLOYEEID INT,

CONSTRAINT FK_SALES_PRODUCT FOREIGN KEY(PRODUCTID) REFERENCES PRODUCT_PRODUCT(ID),
CONSTRAINT FK_SALES_CUSTOMER FOREIGN KEY(CUSTOMERID) REFERENCES CUSTOMER(ID),
CONSTRAINT FK_SALES_DEALER FOREIGN KEY(DEALERID) REFERENCES DEALERS(ID),
CONSTRAINT FK_SALES_EMPLOYEE FOREIGN KEY(EMPLOYEEID) REFERENCES SALES_EMPLOYEE(ID)
)

		
		
		
CREATE TABLE SALES_SALESDETAILS(
ID	INT IDENTITY(1,1) PRIMARY KEY,
SALESID	INT,
PRODUCTID	INT,
DATE_	DATETIME,
QUANTITY INT,
UNITPRICE	DECIMAL,

CONSTRAINT FK_SALESDETAILS FOREIGN KEY(SALESID) REFERENCES SALES_SALES(ID),
CONSTRAINT FK_SALESDETAILS FOREIGN KEY(PRODUCTID) REFERENCES PRODUCT_PRODUCT(ID)

)


CREATE TABLE SALES_EMPLOYEES(	
ID	INT IDENTITY(1,1) PRIMARY KEY,
FIRSTNAME NVARCHAR(50),
LASTNAME NVARCHAR(50),
PHONENUMBER	CHAR(11),
EMAIL VARCHAR(65) UNIQUE,
JOB NVARCHAR(50)

)



CREATE TABLE SALES_CUSTOMERS(		
ID	INT IDENTITY(1,1) PRIMARY KEY,
FIRSTNAME	NVARCHAR(50),
LASTNAME NVARCHAR(50),
PHONENUMBER	CHAR(11),
EMAIL VARCHAR(65) UNIQUE,
JOB	NVARCHAR(50)
)


		
		
CREATE TABLE ADDRESS_CITIES(
ID TINYINT IDENTITY(1,1) PRIMARY KEY,
CITYNAME NVARCHAR(30)
)
		
		
		
CREATE TABLE ADDRESS_TOWNS(	
ID	SMALLINT IDENTITY(1,1) PRIMARY KEY,
CITYID	TINYINT,
TOWNNAME NVARCHAR(50),

CONSTRAINT FK_TOWNS_CITY FOREIGN KEY(CITYID) REFERENCES ADDRESS_CITIES(ID)
)
		
		
		
CREATE TABLE ADDRESS_ADRESS(
ID	INT IDENTITY(1,1),
CITYID	TINYINT,
TOWNID	SMALLINT,
CUSTOMERID	INT,
ADDRESSTEXT NVARCHAR(100),

CONSTRAINT FK_ADRESSS_CITY FOREIGN KEY(CITYID) REFERENCES ADDRESS_CITIES(ID),
CONSTRAINT FK_ADRESSS_TOWN FOREIGN KEY(TOWNID) REFERENCES ADDRESS_TOWNS(ID),
CONSTRAINT FK_ADDRESS_CUSTOMER FOREIGN KEY(CUSTOMERID) REFERENCES SALES_CUSTOMERS(ID)
)



CREATE TABLE COMPANY_DEALERS(
ID	INT IDENTITY(1,1) PRIMARY KEY,
CITYID	TINYINT,
TOWNID	SMALLINT,
DEALERNAME	NVARCHAR(100),
ADDRESSTEXT	NVARCHAR(100),
PHONENUMBER1	CHAR(11),
PHONENUMBER2	CHAR(11),
EMAIL VARCHAR(65),
FAX	VARCHAR(65),

CONSTRAINT FK_DEALER_CITY FOREIGN KEY(CITYID) REFERENCES ADDRESS_CITIES(ID),
CONSTRAINT FK_DEALER_TOWN FOREIGN KEY(TOWNID) REFERENCES ADDRESS_TOWNS(ID),
)
		
		
		
CREATE TABLE COMPANY_PRODUCTDEALER(	
ID	INT   IDENTITY(1,1) PRIMARY KEY,
DEALERID	INT,
PRODUCTID	INT,
STOCKPIECE	INT,

CONSTRAINT FK_PRODUCTDEALER_DEALER FOREIGN KEY(DEALERID) REFERENCES COMPANY_DEALERS(ID),
CONSTRAINT FK_PRODUCTDEALER_PRODUCT FOREIGN KEY(PRODUCTID) REFERENCES PRODUCT_PRODUCT(ID)
)
		
		
		
		
CREATE TABLE COMPANY_AUTHORIZEDSERVICE(
ID	INT IDENTITY(1,1) PRIMARY KEY,
CITYID	TINYINT,
TOWNID	SMALLINT,
SERVICENAME	NVARCHAR(100),
ADDRESSTEXT	NVARCHAR(100),
PHONENUMBER1	CHAR(11),
PHONENUMBER2	CHAR(11),
EMAIL	VARCHAR(65),
FAX	VARCHAR(65),

CONSTRAINT FK_AUTHORIZEDSERVICE_CITY FOREIGN KEY(CITYID) REFERENCES ADDRESS_CITIES(ID),
CONSTRAINT FK_AUTHORIZEDSERVICE_TOWN FOREIGN KEY(TOWNID) REFERENCES ADDRESS_TOWNS(ID),		
)
		
		
		
		
		
		
CREATE TABLE COMPANY_AUTHORIZEDSERVICEDETAILS(	
ID	INT IDENTITY(1,1) PRIMARY KEY,
CUSTOMERID	INT,
PRODUCTID INT,
ADDRESSID INT,
SERVICE_	NVARCHAR(50),
EMPLOYEEID	INT,

CONSTRAINT FK_AUTHORIZEDSERVICEDETAILS_CUSTOMER FOREIGN KEY(CUSTOMERID) REFERENCES SALES_CUSTOMERS(ID),
CONSTRAINT FK_AUTHORIZEDSERVICEDETAILS_PRODUCT FOREIGN KEY(PRODUCTID) REFERENCES PRODUCT_PRODUCT(ID),
CONSTRAINT FK_AUTHORIZEDSERVICEDETAILS_ADDRESS FOREIGN KEY(ADDRESSID) REFERENCES ADDRESS_ADDRESS(ID),
CONSTRAINT FK_AUTHORIZEDSERVICEDETAILS_EMPLOYEE FOREIGN KEY(EMPLOYEEID) REFERENCES SALES_EMPLOYEE(ID)
)


CREATE TABLE COMPANY_CAMPAIGN(	
ID	INT IDENTITY(1,1) PRIMARY KEY,
PRODUCTID	INT,
STARTINGDATE DATE,
FINISHDATE DATE,
DISCOUNTRATE FLOAT,

CONSTRAINT FK_CAMPAIGN_PRODUCT FOREIGN KEY(PRODUCTID) REFERENCES PRODUCT_PRODUCT(ID)
)



CREATE TABLE SALES_COMPLAINTS(
ID	INT IDENTITY(1,1),
CUSTOMERID INT,
PRODUCTID	INT,
DESCRIPTION NVARCHAR(500),
DATE DATETIME DEFAULT GETDATE(),

CONSTRAINT FK_COMPLAINTS_CUSTOMER FOREIGN KEY(CUSTOMERID) REFERENCES SALES_CUSTOMERS(ID),
CONSTRAINT FK_COMPLAINTS_PRODUCT FOREIGN KEY(PRODUCTID) REFERENCES PRODUCT_PRODUCT(ID)
)
		
		
		
		
CREATE TABLE SALES_COMMENTS	(
ID	INT IDENTITY(1,1),
CUSTOMERID	INT,
DESCRIPTION_ NVARCHAR(500),
DATE DATETIME DEFAULT GETDATE(),
		
CONSTRAINT FK_COMMENTS_CUSTOMER FOREIGN KEY(CUSTOMERID) REFERENCES SALES_CUSTOMERS(ID)
)
		
CREATE TABLE SALES_POINTS(	
ID	INT IDENTITY(1,1),
CUSTOMERID INT,
EMPLOYEEID	INT,
POINT INT NOT NULL,
DESCRIPTION_ NVARCHAR(100),



CONSTRAINT FK_COMMENTS_CUSTOMER FOREIGN KEY(CUSTOMERID) REFERENCES SALES_CUSTOMERS(ID),
CONSTRAINT FK_COMMENTS_EMPLOYEE FOREIGN KEY(EMPLOYEEID) REFERENCES SALES_EMPLOYEES(ID)
)


CREATE TABLE STOCKLOG(
ID INT IDENTITY(1,1) PRIMARY KEY,
DATE_ DATETIME NOT NULL DEFAULT GETDATE(),
INCREASE INT,
DECREASE INT
)
