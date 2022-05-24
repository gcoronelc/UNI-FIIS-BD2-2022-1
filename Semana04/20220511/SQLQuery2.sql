select * from CursoProgramado;
go

create procedure dbo.usp_matricula
(@p_IdCursoProg int, @p_IdAlumno int, @p_Estado int out)
as
begin
	declare @contador int;
	BEGIN TRY 
		-- Averiguar si existe el curso programado y si esta activo
		select @contador = count(1) from CursoProgramado
		where IdCursoProg = @p_IdCursoProg and Activo=1;
		if(@contador=0)
		begin
			set @p_Estado = -2;
			return;
		end;
		-- Averiguar si el curso programado esta vigente



		--BEGIN TRANSACTION;

		--COMMIT TRANSACTION; 
	END TRY 
	BEGIN CATCH 
		--ROLLBACK TRANSACTION;
		set @p_Estado = -1
		
	END CATCH;
end;
go

declare @estado int;
exec dbo.usp_matricula 9999999, 5678, @estado out 
print concat('estado: ', @estado);
go

