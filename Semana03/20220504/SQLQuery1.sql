

ALTER FUNCTION dbo.fn_meses ( @anio int ) 
RETURNS @tabla TABLE ( 
	anio int not null, 
	nromes int not null,
	nombmes varchar(30) not null, 
	dias int not null ) 
AS 
BEGIN 
	DECLARE @diasFebrero int;
	set @diasFebrero = iif(@anio%4 = 0,29,28);
	INSERT INTO @tabla values(@anio,1,'Enero',31);
	INSERT INTO @tabla values(@anio,2,'Febrero',@diasFebrero);
	INSERT INTO @tabla values(@anio,3,'Marzo',31);
	INSERT INTO @tabla values(@anio,4,'Abril',30);
	INSERT INTO @tabla values(@anio,5,'Mayo',31);
	INSERT INTO @tabla values(@anio,6,'Junio',30);
	INSERT INTO @tabla values(@anio,7,'Julio',31);
	INSERT INTO @tabla values(@anio,8,'Agosto',31);
	INSERT INTO @tabla values(@anio,9,'Setiembre',30);
	INSERT INTO @tabla values(@anio,10,'Octubre',31);
	INSERT INTO @tabla values(@anio,11,'Noviembre',30);
	INSERT INTO @tabla values(@anio,12,'Diciembre',31);
	return;
END;
GO


select * from dbo.fn_meses ( 2020 );
go


CREATE FUNCTION dbo.fn_mayor( @num1 int, @num2 int, @num3 int ) 
RETURNS int 
AS 
BEGIN 
	DECLARE @mayor int;
	set @mayor = @num1; -- Punto de partida
	set @mayor = iif(@num2>@mayor,@num2,@mayor);
	set @mayor = iif(@num3>@mayor,@num3,@mayor);
	RETURN @mayor; 
END; 
GO


select dbo.fn_mayor(130,45,912);
go


CREATE PROCEDURE dbo.usp_suma ( @num1 int, @num2 int ) 
AS 
BEGIN 
	DECLARE @suma int; 
	SET @suma = @num1 + @num2; 
	SELECT @num1 NUM1, @num2 NUM2, @suma SUMA;
END; 
GO

EXEC dbo.usp_suma 54, 76; 
GO


CREATE PROCEDURE dbo.usp_suma2 
( @num1 int, @num2 int, @suma int out ) 
AS 
BEGIN 
	SET @suma = @num1 + @num2; 
END; 
GO

declare @suma int;
exec dbo.usp_suma2 45, 78, @suma out;
print concat('Suma: ',@suma);
go



CREATE FUNCTION dbo.fnGetPrecio ( @p_idcurso int )
RETURNS MONEY
AS 
BEGIN
	DECLARE @PRECIO MONEY;
	SELECT @PRECIO = cur_precio 
	FROM dbo.CURSO 
	WHERE cur_id = @p_idcurso; 
	RETURN @PRECIO;
END; 
GO

SELECT  dbo.fnGetPrecio(1) PRECIO;
GO

DECLARE @PRECIO MONEY;
SET @PRECIO = dbo.fnGetPrecio(1);
PRINT CONCAT('Precio: ',@PRECIO);
GO


CREATE PROCEDURE DBO.USP_PROC_LOCO
AS
BEGIN
	SELECT * FROM CURSO;
	SELECT * FROM ALUMNO;
END;
GO


EXEC DBO.USP_PROC_LOCO
GO







