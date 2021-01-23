-- Satış yapan prosedür

CREATE PROCEDURE SALES
@PRODUCTID INT,
@CUSTOMERID INT,
@DEALERID INT,
@PIECE INT,
--@DATE DATETIME,

@EMPLOYEEID INT
AS

-- ürün var mı yok mu kontrol etme
IF NOT EXISTS (SELECT * FROM PRODUCT_PRODUCT P WHERE P.ID=@PRODUCTID)

BEGIN
--PRINT 'Ürün bulunamadı'
RAISERROR(15600, -1, -1, 'Ürün bulunamadı');
return
END


IF NOT EXISTS (SELECT * FROM SALES_CUSTOMERS C WHERE C.ID=@CUSTOMERID)

BEGIN
--PRINT 'Ürün bulunamadı'
RAISERROR(15600, -1, -1, 'Böyle bir kullanıcı bulunamadı!!! Lütfen giriş yapınız');
return
END


IF NOT EXISTS (SELECT * FROM COMPANY_DEALERS D WHERE D.ID=@DEALERID)

BEGIN
--PRINT 'Ürün bulunamadı'
RAISERROR(15600, -1, -1, 'Böyle bir bayi bulunamadı!!!');
return
END

IF @PIECE<=0
BEGIN 
RAISERROR(15600, -1, -1, 'LÜTFEN GEÇERLİ ÜRÜN ADETİ GİRİNİZ!!!(Sıfırdan büyük olmalıdır.)');
RETURN
END


BEGIN
DECLARE @ISOK INT
DECLARE @UNITPRICE DECIMAL

SELECT @ISOK=STOCKPIECE FROM COMPANY_PRODUCTDEALER PD WHERE PD.PRODUCTID=@PRODUCTID AND PD.DEALERID=@DEALERID

SELECT TOP 1 @PRODUCTID=PRODUCTID, @UNITPRICE=P.UNITPRICE FROM COMPANY_PRODUCTDEALER CP
INNER JOIN PRODUCT_PRODUCT P ON P.ID=CP.PRODUCTID
WHERE (STOCKPIECE>0 AND STOCKPIECE>=@PIECE)AND [PRODUCTID]=@PRODUCTID AND DEALERID=@DEALERID

--BAYİDE İSTENEN ÜRÜN STOKTA VAR MI

IF @PRODUCTID IS NOT NULL AND @PIECE<=@ISOK

BEGIN

DECLARE @SALESID INT

INSERT INTO [dbo].[SALES_SALES]
           ([PRODUCTID]
           ,[CUSTOMERID]
           ,[DEALERID]
           ,[DATE_]
           ,[EMPLOYEEID])
     VALUES
           (@PRODUCTID
           ,@CUSTOMERID
           ,@DEALERID
           ,GETDATE()
           ,(SELECT @EMPLOYEEID FROM SALES_EMPLOYEES WHERE ID=@EMPLOYEEID AND JOBID=2))


		SELECT @SALESID=ID FROM SALES_SALES WHERE PRODUCTID=@PRODUCTID AND @CUSTOMERID=CUSTOMERID

INSERT INTO [dbo].[SALES_SALESDETAILS]
           ([SALESID]
           ,[PRODUCTID]
           ,[DATE_]
           ,[QUANTITY]
           ,[UNITPRICE])
     VALUES
           (@SALESID
           ,@PRODUCTID
           ,GETDATE()
           ,@PIECE
           ,@UNITPRICE)


INSERT INTO [dbo].[COMPANY_STOCKLOG]
           ([DATE_]
           ,[DECREASE]
		   ,[PRODUCTID])
     VALUES
           (GETDATE()
           ,@PIECE
	   ,@PRODUCTID)

DECLARE @message nvarchar(max)
declare @mail varchar(100)
DECLARE @fullname nvarchar(100)
DECLARE @PRODUCTNAME NVARCHAR(100)


SELECT @mail=EMAIL, @fullname=concat_ws(' ', FIRSTNAME, LASTNAME) FROM SALES_CUSTOMERS WHERE ID=@CUSTOMERID

SELECT @PRODUCTNAME=PRODUCTNAME FROM COMPANY_PRODUCTDEALER CP
	INNER JOIN PRODUCT_PRODUCT P ON P.ID=CP.PRODUCTID



set @message = concat('<html><head><style> body { font-size:18px; } .username{ color: red; font-size:18px;}</style></head><body> Sayın <strong class="username">', @fullname, ';</strong><br/><br/>',
'<b>Siparişiniz alınmıştır. </b>',  '</b><br><br/>',
'En kısa sürede kargoya verilecektir.<br><br>',
'Aldığınız ürünler aşağıdaki gibidir:<br><br>',
'<table border="1" style="width:100%; text-align:center;"><thead><tr><th>Ürün Adı</th><th>Adet</th><th>Birim Fiyat</th><th>Toplam Fiyat</th></tr></thead>',
'<tbody><tr><td>',@PRODUCTNAME,'</td><td>', @PIECE, '</td><td>', @UNITPRICE ,'</td><td>', @PIECE, ' x ', @UNITPRICE, ' = ', @UNITPRICE*@PIECE, ' TL</td></tbody></table><br><br>',

'<a href="http://medium.com/@mervekucukdogru" target="_blank"><center><img src="https://www.bosch-home.com.tr/store/medias/sys_master/root/h15/h35/9828799512606/Turkish-165px.jpg" alt="Torku" title="Torku" width="300px" style="margin:auto; margin-top:50px; left:15px;"></center></a>'
)

exec msdb.dbo.sp_send_dbmail
		@profile_name = 'Genel Mail',
		@recipients=@mail,
		@body=@message,
		@subject='Sipariş Bilgilendirme',
		@body_format = 'HTML'


END

ELSE 
BEGIN

--STOKTA YOKSA

SELECT @mail=EMAIL, @fullname=concat_ws(' ', FIRSTNAME, LASTNAME) FROM SALES_CUSTOMERS WHERE ID=@CUSTOMERID



set @message = concat('<html><head><style> body { font-size:18px; } .username{ color: red; font-size:18px;}</style></head><body> Sayın <strong class="username">', @fullname, ';</strong><br/><br/>',
'<b>Almak istediğiniz ürün stokta yoktur <b>',  '</b><br><br/>',
'Ürün geldiğinde size haber verilecektir.!!!<br><br><br><br>',
'<a href="http://medium.com/@mervekucukdogru" target="_blank"><center><img src="https://www.bosch-home.com.tr/store/medias/sys_master/root/h15/h35/9828799512606/Turkish-165px.jpg" alt="Torku" title="Torku" width="300px" style="margin:auto; margin-top:50px; left:15px;"></center></a>'
)

exec msdb.dbo.sp_send_dbmail
		@profile_name = 'Genel Mail',
		@recipients=@mail,
		@body=@message,
		@subject='Stok Bilgilendirme',
		@body_format = 'HTML'


END

END