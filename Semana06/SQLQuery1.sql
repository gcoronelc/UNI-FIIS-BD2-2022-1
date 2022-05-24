
use educa;
go

-- Tx

begin tran;
go

select @@TRANCOUNT;
go


select * from CURSO;
go

update curso 
set cur_precio=3000;
go

commit tran;
go

rollback;
go

