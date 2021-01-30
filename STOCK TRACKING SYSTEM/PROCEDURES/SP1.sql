---Add new product with procedure

CREATE PROCEDURE ADDNEWPRODUCT
	
	@CATEGORYID int null = 16,
	@PRODUCTCODE char(11),
	@PRODUCTNAME nvarchar(100),
	@COLOR NVARCHAR(50),
	@ENERGYLEVEL VARCHAR(50),
	@POWER_ INT,
	@DESCRIPTION NVARCHAR(200),
	@UNITPRICE DECIMAL

AS
BEGIN
	

INSERT INTO [dbo].[PRODUCT_PRODUCT]
           ([CATEGORYID]
           ,[PRODUCTCODE]
           ,[PRODUCTNAME]
           ,[COLOR]
           ,[ENERGYLEVEL]
           ,[POWER_]
           ,[DESCRIPTION_]
           ,[UNITPRICE])
     VALUES
           (@CATEGORYID
           ,@PRODUCTCODE
           ,@PRODUCTNAME
           ,@COLOR
           ,@ENERGYLEVEL
           ,@POWER_
           ,@DESCRIPTION
           ,@UNITPRICE)

END