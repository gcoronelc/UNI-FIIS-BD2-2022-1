-- DICCIONARIO DE DATOS

SELECT * FROM INFORMATION_SCHEMA.TABLES;
GO

SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME='ALUMNO';
GO

SELECT * FROM sys.objects;
go


SELECT * FROM SYS.indexes
GO

sp_helpindex '[dbo].[ALUMNO]'
GO

-- BLOQUE ANONIMO

BEGIN
	PRINT 'HOLA TODOS.'; 
END;
GO


-- BLOQUES NOMBRADOS

-- Funciones
-- Procedimientos
-- Triggers 


create function fn_suma(@num1 int,@num2 int)
returns int
begin
	return (@num1 + @num2);
end;
go

select dbo.fn_suma(10,30);
go


