set statistics time on


CREATE INDEX EMPLEADO_IDXN ON EMPLEADO(NOMBRE)



select * 
from edutec..CursoProgramado cp
where cp.IdCiclo='2021-01';
go


CREATE INDEX MATRICULA_IDALUMNO ON MATRICULA(IDALUMNO);
GO



select * 
from edutec..Matricula m
where m.IdAlumno='A0022';
go

CREATE INDEX ORDER_SHIPCITY ON ORDERS(SHIPCITY);
GO


SELECT * FROM Northwind..Orders
WHERE ShipCity='Lisboa';
GO



