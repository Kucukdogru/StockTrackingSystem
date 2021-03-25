DECLARE @i INT=1000
DECLARE @NAME NVARCHAR(50)
DECLARE @SURNAME NVARCHAR(50)
DECLARE @PHONENUMBER CHAR(11)
DECLARE @EMAIL VARCHAR(65)
DECLARE @JOB NVARCHAR(50)

while @i>0
begin 
select top 1 @NAME= Name from Names$ order by NEWID()
SELECT @NAME
select top 1 @SURNAME= Surname from Surnames$ order by NEWID()
SELECT @SURNAME

set @PHONENUMBER = dbo.IdentityNumber()
select @PHONENUMBER

set @EMAIL = CONCAT(TRIM(LOWER(@NAME+@SURNAME)),'@gmail.com')
select @EMAIL

select top 1 @JOB= Job from Jobs$ order by NEWID()
select @JOB


INSERT INTO [dbo].[SALES_CUSTOMERS]
           ([FIRSTNAME]
           ,[LASTNAME]
           ,[PHONENUMBER]
           ,[EMAIL]
           ,[JOB])
     VALUES
           (@NAME
           ,@SURNAME
           ,@PHONENUMBER
           ,@EMAIL
           ,@JOB)


set @i = @i - 1
END
