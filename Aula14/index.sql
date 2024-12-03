select count(id_cliente) as clientes_total from clientes where salario > 1000
select * from clientes
update clientes set salario = 7000 where genero = 'feminino'
select avg(salario) as salario_medio, count(clientes) as cliente_femininos from clientes where genero = 'feminino'

select count(produtos) as produtos_qtd from produtos
select * from pedidos


select count(qtd_pedido) as pedidos_feitos from pedidos where id_cliente = 2
select count(id_produto) as pedido_1 from pedidos where id_produto = 1

select count(distinct id_cliente) from pedidos 

select count(id_cliente), nome_cliente from clientes group by nome_cliente
select* from clientes

select avg(salario::numeric) from clientes where genero = 'masculino'

select * from produtos

select avg(preco) from produtos

-- select nome_cliente, id_pedido from clientes  right join pedidos on 
-- clientes.id_cliente = pedidos.id_cliente

select avg(qtd_pedido) from pedidos

select avg(numero_pedidos) from (
select count(*) as numero_pedidos, id_cliente 
from pedidos 
group by id_cliente) 
as quantidade_cliente

select avg(numero_pedidos) from (select count(*) as numero_pedidos, 
id_cliente from pedidos
group by id_cliente) as consult



select avg(salario) from clientes

select sum(salario::money/3) as total_salary from clientes


select genero, avg(salario) as total from clientes group by genero
select genero, count(genero) as genero_contagem from clientes
group by genero

select sum(preco * 0.9) from produtos