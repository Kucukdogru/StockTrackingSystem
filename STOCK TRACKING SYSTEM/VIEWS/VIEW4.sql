﻿--ÇALIŞANLAR TOPLAM NE KADAR SATIŞ YAPMIŞ

CREATE VIEW V_EMPLOYEESTOTALSALES
AS
SELECT S.EMPLOYEEID, E.FIRSTNAME + ' ' + E.LASTNAME EMPLOYEE, COUNT(*) TOTALSALES, SUM(UNITPRICE) SALESTOTALPRICE FROM SALES_SALES S
	INNER JOIN SALES_EMPLOYEES E ON E.ID=S.EMPLOYEEID
	INNER JOIN SALES_SALESDETAILS SD  ON SD.SALESID=S.ID
	GROUP BY S.EMPLOYEEID, E.FIRSTNAME, E.LASTNAME

	


