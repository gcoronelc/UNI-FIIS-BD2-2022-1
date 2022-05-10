USE EDUCA;
GO


ALTER PROCEDURE dbo.usp_precio ( @p_idcurso int, @p_estado int OUT, @p_precio money OUT ) 
AS 
BEGIN 
	SELECT @p_precio = cur_precio 
	FROM dbo.CURSO 
	WHERE cur_id = @p_idcurso; 
	SELECT @p_estado = @@ROWCOUNT;
END;
GO


BEGIN 
	DECLARE @estado int,  @precio money; 
	EXEC dbo.usp_precio 20, @estado OUT, @precio OUT; 
	IF (@estado=1)
		PRINT CONCAT( 'PRECIO: ', @precio );
	ELSE
		PRINT 'ERROR: curso no existe.';
END;
GO


SELECT * FROM CURSO;
GO





