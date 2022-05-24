
sp_who;
go

kill 58;
go


begin tran;
go

select * from matricula;
go

update matricula
set mat_nota=20;
go



