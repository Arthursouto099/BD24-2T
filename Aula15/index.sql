select nome_cliente, qtd_pedido from clientes, 
pedidos where clientes.id_cliente = pedidos.id_cliente
and qtd_pedido > 3

select * from clientes
select * from pedidos
select * from produtos

select nome_cliente, id_pedido  from clientes, pedidos 
where clientes.id_cliente = pedidos.id_cliente

select nome_produto, qtd_pedido from produtos, pedidos
where produtos.id_produto = pedidos.id_produto

select nome_cliente, id_pedido from  clientes, pedidos
where clientes.id_cliente = pedidos.id_cliente and qtd_pedido > 2



select nome_cliente, qtd_pedido, nome_produto,  preco * pedidos.qtd_pedido as preco_total from
clientes, pedidos, produtos where
clientes.id_cliente = pedidos.id_cliente and pedidos.id_produto = 
produtos.id_produto group by nome_cliente, qtd_pedido, nome_produto, preco_total

