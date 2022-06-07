CREATE TABLE dbo.TablaPrueba2 ( 
	Campo1 int IDENTITY (1, 1) NOT NULL, 
	Campo2 int, 
	Campo3 int, 
	Campo4 int, 
	Campo5 char (30), 
	constraint pk_tabla2 primary key clustered(Campo1) 
); 
go



SELECT * FROM TablaPrueba2 WHERE Campo1 = 2; 
go

SELECT * FROM TablaPrueba2 WHERE Campo2 = 5; 
go


SET NOCOUNT ON; 
DECLARE @Top int; 
SET @Top = 0; 
WHILE ( @Top <= 1000 ) 
BEGIN 
	print 'Gustavo'
	INSERT INTO TablaPrueba2(Campo2, Campo3, Campo4, Campo5) 
	VALUES (convert(int,rand()*20000),convert(int,rand()*20000), convert(int,rand()*20000), 'P'); 
	SET @Top = @Top + 1; 
END; 
go 


SELECT * FROM TablaPrueba2
go

SELECT count(1) FROM TablaPrueba2 WHERE Campo2 = 5466; 
go



DROP INDEX IDX_TablaPrueba2_01 ON TablaPrueba2;
GO


CREATE INDEX IDX_TablaPrueba2_01 
ON dbo.TablaPrueba2(Campo2); 
go

SELECT count(1) FROM TablaPrueba2 
WHERE Campo2 = 5466; 
go


SELECT count(1) FROM TablaPrueba2 
WHERE Campo2 = 5466 AND Campo3=4567; 
go

DROP INDEX IDX_TablaPrueba2_01 ON TablaPrueba2;
GO


CREATE INDEX IDX_TablaPrueba2_01 
ON dbo.TablaPrueba2(Campo2,Campo3); 
go


SELECT count(1) FROM TablaPrueba2 
WHERE Campo2 = 5466 AND Campo3=4567; 
go


CREATE INDEX IDX_TablaPrueba2_02 
ON dbo.TablaPrueba2(Campo2); 
go


SELECT * FROM TablaPrueba2 
ORDER BY Campo2




