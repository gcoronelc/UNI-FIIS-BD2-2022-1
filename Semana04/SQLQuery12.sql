/*
Se necesita hacer búsquedas de empleados por apellido y nombre, 
se le pide diseñar la mejor solución, justifique su respuesta.
Implementar su propuesta y verificarla recogiendo las evidencias del caso.
*/

/*
1. Analizar del requerimiento.

Normalmente en las aplicaciones la busqueda de datos se realiza por
varios campos, no solamente por un campo.

Por ejemplo por los cambos apellido y nombre.

Para tener un mejor rendimiento de las consultas se deben diseñas indices.

*/

-- Tabla de trabajo

select * into empleado2
from empleado;

select * from empleado2;
go

/*
2. Diseñar una solución.

select * from empleado2
where apellido like '%RO%' and nombre like '%ta%';
go


create index empleado2_idx1
on empleado2(apellido,nombre);
go

*/

/*
3. Implementar la solución.
*/

-- Ejecutar 20 veces minimo
insert into empleado2 
select * from empleado;
go

select * from empleado2;
go

select * from empleado2
where apellido like '%RO%' and nombre like '%ta%';
go

create index empleado2_idx1
on empleado2(apellido,nombre);
go

select * from empleado2
where apellido like '%RO%' and nombre like '%ta%';
go

select * from empleado2
where apellido like 'RO%' and nombre like 'ta%';
go

select * from empleado2
where contains(apellido,'RO') and contains(nombre,'ta');
go


/*
4. Verificar su funcionamiento.
5. Recoger evidencias.
6. Elaborar informe que incluya conclusiones y recomendaciones.

*/