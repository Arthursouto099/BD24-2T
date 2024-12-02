alter table clientes add column genero varchar(20) 

select * from clientes

alter table clientes add column Salario numeric

select * from clientes


alter table clientes add column cpf varchar(40) 

update clientes set genero = 'masculino'
update clientes set salario = 1000
update clientes set cpf = '100.111.222-33'

update clientes set genero = 'feminino' where id_cliente  = 1
update clientes set salario = 9000 where id_cliente  = 1
update clientes set cpf = '100.000.190.99' where id_cliente = 1


update clientes set genero = 'feminino' where id_cliente = 12
update clientes set genero = 'feminino' where id_cliente = 9
update clientes set genero = 'feminino' where id_cliente = 3
update clientes set genero = 'feminino' where id_cliente = 2

select * from clientes

select distinct nome_cliente from clientes
select nome_cliente, cpf from clientes
select nome_cliente, cpf from clientes where genero = 'feminino'
select id_cliente, nome_cliente, genero from clientes order by id_cliente Desc

select nome_cliente, salario, genero from clientes where genero = 'masculino' and salario < 3000