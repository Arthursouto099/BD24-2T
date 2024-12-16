create or replace view categorias_de_produtos as select 
nome_produto as nome_do_produto, nome_categoria as categoria
from produtos inner join categoria on categoria.id_categoria =
produtos.id_categoria 

create or replace view pedidos_dos_clientes as select 
id_pedido as numero_do_pedido, nome_cliente as nome_do_cliente from 
clientes right join pedidos  on pedidos.id_cliente = clientes.id_cliente

select * from produtos
select * from categoria
select * from pedidos
select * from clientes

select * from categorias_de_produtos
select * from pedidos_dos_clientes

create or replace view Usuarios_Cliente as 
select nome_cliente as Nome_Do_CLiente, id_pedido as
Numero_do_Pedido, nome_produto as Nome_Do_Produto, descricao
from clientes left join pedidos on pedidos.id_cliente = clientes.id_cliente join 
produtos on produtos.id_produto = pedidos.id_pedido

select * from Usuarios_Cliente



create index on clientes(id_cliente)
create index on produtos using hash(id_produto)
create index on pedidos using hash(id_pedido)