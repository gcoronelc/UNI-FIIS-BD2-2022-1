

-- Paso 1
select EmployeeID, COUNT(1) CantPedidos
from Orders
group by EmployeeID;
go

-- Paso 2

select 
	o.EmployeeID, COUNT(DISTINCT o.OrderID) CantPedidos,
	sum(d.Quantity) CantProductos
from Orders o
join [Order Details] d on o.OrderID=d.OrderID
group by o.EmployeeID
order by 1;
go





