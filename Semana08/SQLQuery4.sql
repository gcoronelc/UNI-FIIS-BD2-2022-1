

select * 
from rh..empleado;
go

select distinct idcargo 
from rh..empleado;
go

select distinct iddepartamento 
from rh..empleado;
go


select * from rh..empleado
where idcargo='C04';
go


select * from rh..empleado
where idempleado='E0013';
go



create table algo(
	id int not null,
	dato varchar(50) not null,
	constraint pk_dato primary key(id)
);
go

