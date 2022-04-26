
select distinct idcargo
from rh..empleado;
go

CREATE TABLE demo(
    [Id] [int] NOT NULL PRIMARY KEY,
    [label] [nvarchar](max) NOT NULL,
)on data2;
GO

DECLARE @I INT;
SET @I = 1;
WHILE(@I>0)
BEGIN
  insert into demo(ID,label) values(@I,'SQL SERVER ES LO MAXIMO');
  SET @I = @I + 1;
END;
GO