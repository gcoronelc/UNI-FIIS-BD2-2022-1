
sp_help Ciclo
go

select top 1 * from Ciclo
order by 1 desc;

alter procedure dbo.usp_genera_ciclo
(@p_ciclo char(7) out, @p_estado int out)
as
begin
	declare @ultimo_ciclo char(7), @anio int, @mes int;
	declare @fecha_inicio date, @fecha_fin date;
	BEGIN TRY 
		BEGIN TRANSACTION; 
		select top 1 @ultimo_ciclo = IdCiclo 
		from Ciclo order by 1 desc; 
		set @anio = cast(LEFT(@ultimo_ciclo,4) as int);
		set @mes = cast(RIGHT(@ultimo_ciclo,2) as int)
		IF(@mes=12)
		begin
			set @mes = 1;
			set @anio = @anio + 1;
		end
		else
		begin
			set @mes = @mes + 1
		end;
		set @fecha_inicio = cast(@anio as varchar(5)) 
							+ right(concat('00',@mes),2) + '01';
		set @fecha_fin = EOMONTH ( @fecha_inicio );
		set @p_ciclo = cast(@anio as varchar(5)) + '-' + right(concat('00',@mes),2);
		insert into Ciclo(IdCiclo,FecInicio,FecTermino)
		values(@p_ciclo,@fecha_inicio,@fecha_fin);
		COMMIT TRANSACTION; 
		set @p_estado = 1;
	END TRY 
	BEGIN CATCH 
		ROLLBACK TRANSACTION; 
		set @p_estado = -1;
	END CATCH;
end;
go


begin
	declare @ciclo char(7), @estado int;
	exec dbo.usp_genera_ciclo @ciclo out, @estado out
	print concat(@estado, @ciclo);
end;


select cast(right('2021-01',2) as int)


declare @fecha date;
set @fecha = '20220112';
select @fecha; 
go

DECLARE @date DATETIME = '12/1/2011';  
SELECT EOMONTH ( @date ) AS Result;  
GO  