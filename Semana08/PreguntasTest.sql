
-- Caso 1
BEGIN
	DECLARE @N INT;
	SET @N = 10;
	WHILE(@N>=1)
		PRINT 'SOY UN GANADOR';
		SET @N = @N - 1;
END;
GO

-- Caso 2
BEGIN
	DECLARE @N INT;
	SET @N = 10;
	WHILE(@N>=1)
		PRINT 'SOY UN GANADOR';
	SET @N = @N - 1;
END;
GO

-- Caso 3
BEGIN
	DECLARE @N INT;
	SET @N = 10;
	WHILE(@N>=1)
	BEGIN
		PRINT 'SOY UN GANADOR';
	END
	SET @N = @N - 1;
END;
GO


-- Caso 4
BEGIN
	DECLARE @N INT;
	SET @N = 10;
	WHILE(@N>=1)
	BEGIN
		PRINT 'SOY UN GANADOR';
		SET @N = @N - 1;
	END
END;
GO



declare @rpta decimal(12,2), @num1 int, @num2 int;
set @num1 = 20;
set @num2 = 6;
set @rpta = @num1 / @num2;
print @rpta;
go


select 20/3 Valor;
go


declare @dato numeric(5,2), @mensaje varchar(50);
set @dato = 1.5;
set @mensaje = case @dato when 1 then 'Hola' when 2 then 'Chau' else 'Todo igual' end;
print @mensaje;
go
