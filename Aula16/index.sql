create table categoria (
id_categoria serial primary key,
nome_categoria varchar(80) not null
)


insert into categoria (nome_categoria) values 
('Brinquedo'),
('Telefone'),
('EletroDomestico')

select * from produtos
select * from pedidos

insert into pedidos (id_cliente, id_produto, qtd_pedido) 
values(null, 3, 2)

update produtos set id_categoria = 2 
update produtos set id_categoria = 1 where nome_produto = 'Bola' 
update produtos set id_categoria = 3 where nome_produto = 'Lava Roupas' 
alter table produtos add column id_categoria int references categoria(id_categoria)
insert into categoria(nome_categoria) values('Brinquedo Picante')

select produtos from 
produtos join pedidos on produtos.id_produto = pedidos.id_produto 
join clientes on clientes.id_cliente = pedidos.id_cliente where clientes.id_cliente = 1

select nome_categoria, count(nome_produto) as produtos_cadastrados from
categoria left join produtos on categoria.id_categoria =
produtos.id_categoria group by  nome_categoria

select  nome_cliente, id_pedido  from 
clientes right join pedidos on clientes.id_cliente = 
pedidos.id_cliente


select nome_produto, nome_categoria from 
produtos cross join categoria where categoria.nome_categoria ='Brinquedo'

select nome_produto, nome_categoria, id_pedido from
produtos join categoria on produtos.id_categoria = 
categoria.id_categoria 
full outer join pedidos on pedidos.id_produto = 
produtos.id_produto