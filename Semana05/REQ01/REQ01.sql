/*
Se necesita saber la cantidad de cursos que ha dictado 
cada profesor en cada trimestre del año 2021, 
también de incluir el importe que se le debe pagar 
por sus horas dictadas.
*/

/*
1. Analizar cada requerimiento.

En EduTec se programan 12 ciclos por años, un ciclo cada mes,
un curso se puede programar varias veces en un ciclo, y no 
necesariamente se asigna al mismo profresor, incluso se 
pueden programar en diferentes horarios.

Lo mas usual es que se programen en diferentes horarios
y con diferentes profesores.

Cada tipo de curso (Tabla tarifa) tiene su cantidad de horas
de dictado y el precio por hora que se le debe pagar al profesor.
*/

/*
2. Identificar los datos que debe tener el reporte.

CODIGO    NOMBRE                  CANTIDAD            IMPORTE     PORCENTAJE
PROFESOR  PROFESOR    TRIMESTRE   CURSOS      HORAS   PAGAR       TOTAL
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
*/


/*
3. Identificar las tablas de donde obtendrá los datos.
*/

/*
4. Crear la vista en la base de datos.
*/

-- Paso 1: Insumos

select 
	IdProfesor, IdCurso, IdCiclo,
	IIF(RIGHT(IdCiclo,2)>=10,4,IIF(RIGHT(IdCiclo,2)>=7,3,
	IIF(RIGHT(IdCiclo,2)>=4,2,1))) Trimestre
from CursoProgramado
where IdCiclo like '2021%';
GO

-- Paso 2: Calculo de ingresos por profesor

WITH
DATA1 AS (
	select 
		IdProfesor, IdCurso, IdCiclo,
		IIF(RIGHT(IdCiclo,2)>=10,4,IIF(RIGHT(IdCiclo,2)>=7,3,
		IIF(RIGHT(IdCiclo,2)>=4,2,1))) Trimestre
	from CursoProgramado
	where IdCiclo like '2021%'
)
SELECT 
	D1.IdProfesor, D1.Trimestre,
	COUNT(1) CantCursos,
	SUM(T.Horas) CantHoras,
	SUM(T.Horas*T.PagoHora) ImportePagar
FROM DATA1 D1
JOIN CURSO C ON D1.IdCurso=C.IdCurso
JOIN TARIFA T ON C.IdTarifa=T.IdTarifa
GROUP BY D1.IdProfesor, D1.Trimestre;
GO


-- Paso 3: El importe total

WITH
DATA1 AS (
	select 
		IdProfesor, IdCurso, IdCiclo,
		IIF(RIGHT(IdCiclo,2)>=10,4,IIF(RIGHT(IdCiclo,2)>=7,3,
		IIF(RIGHT(IdCiclo,2)>=4,2,1))) Trimestre
	from CursoProgramado
	where IdCiclo like '2021%'
),
DATA2 AS (
	SELECT 
		D1.IdProfesor, D1.Trimestre,
		COUNT(1) CantCursos,
		SUM(T.Horas) CantHoras,
		SUM(T.Horas*T.PagoHora) ImportePagar
	FROM DATA1 D1
	JOIN CURSO C ON D1.IdCurso=C.IdCurso
	JOIN TARIFA T ON C.IdTarifa=T.IdTarifa
	GROUP BY D1.IdProfesor, D1.Trimestre
)
SELECT SUM(ImportePagar) TOTAL FROM DATA2
GO


-- Paso 4: Agregar el porcentaje y el nombre del profesor
WITH
DATA1 AS (
	select 
		IdProfesor, IdCurso, IdCiclo,
		IIF(RIGHT(IdCiclo,2)>=10,4,IIF(RIGHT(IdCiclo,2)>=7,3,
		IIF(RIGHT(IdCiclo,2)>=4,2,1))) Trimestre
	from CursoProgramado
	where IdCiclo like '2021%'
),
DATA2 AS (
	SELECT 
		D1.IdProfesor, D1.Trimestre,
		COUNT(1) CantCursos,
		SUM(T.Horas) CantHoras,
		SUM(T.Horas*T.PagoHora) ImportePagar
	FROM DATA1 D1
	JOIN CURSO C ON D1.IdCurso=C.IdCurso
	JOIN TARIFA T ON C.IdTarifa=T.IdTarifa
	GROUP BY D1.IdProfesor, D1.Trimestre
),
DATA3 AS (
SELECT SUM(ImportePagar) TOTAL FROM DATA2
)
SELECT 
	P.IdProfesor, P.ApeProfesor, P.NomProfesor,
	D2.Trimestre, D2.CantCursos, D2.CantHoras, D2.ImportePagar,
	CAST(D2.ImportePagar*100.0/D3.TOTAL AS NUMERIC(8,4)) PORCENTAJE
FROM DATA2 D2 
JOIN Profesor P ON D2.IdProfesor=P.IdProfesor
CROSS JOIN DATA3 D3
GO



-- Paso 5: Crear la vista
CREATE VIEW V_REQ1
AS
WITH
DATA1 AS (
	select 
		IdProfesor, IdCurso, IdCiclo,
		IIF(RIGHT(IdCiclo,2)>=10,4,IIF(RIGHT(IdCiclo,2)>=7,3,
		IIF(RIGHT(IdCiclo,2)>=4,2,1))) Trimestre
	from CursoProgramado
	where IdCiclo like '2021%'
),
DATA2 AS (
	SELECT 
		D1.IdProfesor, D1.Trimestre,
		COUNT(1) CantCursos,
		SUM(T.Horas) CantHoras,
		SUM(T.Horas*T.PagoHora) ImportePagar
	FROM DATA1 D1
	JOIN CURSO C ON D1.IdCurso=C.IdCurso
	JOIN TARIFA T ON C.IdTarifa=T.IdTarifa
	GROUP BY D1.IdProfesor, D1.Trimestre
),
DATA3 AS (
SELECT SUM(ImportePagar) TOTAL FROM DATA2
)
SELECT 
	P.IdProfesor, P.ApeProfesor, P.NomProfesor,
	D2.Trimestre, D2.CantCursos, D2.CantHoras, D2.ImportePagar,
	CAST(D2.ImportePagar*100.0/D3.TOTAL AS NUMERIC(8,4)) PORCENTAJE
FROM DATA2 D2 
JOIN Profesor P ON D2.IdProfesor=P.IdProfesor
CROSS JOIN DATA3 D3
GO


SELECT * FROM V_REQ1;
GO

/*
5. Verificar su resultado.
6. Consultar la vista desde Microsoft Excel
*/