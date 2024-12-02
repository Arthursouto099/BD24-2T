create table cliente (
id_cliente serial primary key,
nome_cliente varchar(40) not null,
sobrenome_cliente varchar(40) not null
)

create table produto (
id_produto serial primary key,
nome_produto varchar(20) not null,
descricao text not null,
preco numeric check(preco > 0) not null,
qtd_estoque smallint default 0 
)

alter table produto rename to produtos
alter table cliente rename to clientes

create table pedidos (
id_pedido serial primary key,
id_cliente int references clientes(id_cliente),
id_produto int references produtos(id_produto),
qtd_pedido smallint check(qtd_pedido > 0) not null
)

alter table pedidos alter column qtd_pedido type smallint

insert into produtos(nome_produto, descricao, preco, qtd_estoque) values 
('ps5', 'videogame bacana', 5000.99, 5),
('iphone 13', 'telefone de rico', 4000.78, 7),
('Lava Roupas', 'Lava roupas', 6000, 19)

select * from produtos

insert into clientes(nome_cliente, sobrenome_cliente) values ('Vitor', 'Reis'),
('Vitoria', 'Bier'), ('Arthur', 'Tavares')

select * from clientes

insert into pedidos(id_cliente, id_produto, qtd_pedido) values (1, 3, 5),
(2, 1, 4), (3, 2, 10)

select * from pedidos


insert into produtos(nome_produto, descricao, preco, qtd_estoque) values
('iphone', 'cell', 500.00, 5),
('iphone8', 'cell', 500.00, 52),
('iphone9', 'cell', 500.00, 23),
('iphone11', 'cell', 500.00, 42),
('iphone12', 'cell', 500.00, 13),
('iphone15', 'cell', 500.00, 13),
('iphone19', 'cell', 500.00, 56),
('iphone32', 'cell', 500.00, 97),
('iphone6', 'cell', 500.00, 79),
('iphone5', 'cell', 500.00, 20)

insert into pedidos(id_cliente, id_produto, qtd_pedido) values
('1', '2', '3'),
('3', '2', '3'),
('2', '3', '3'),
('4', '4', '3'),
('6', '5', '3'),
('5', '5', '3'),
('7', '7', '3'),
('9', '7', '3'),
('8', '9', '3'),
('10', '1', '3')


insert into clientes(nome_cliente, sobrenome_cliente) values
('izadora', 'tavares'),
('karol', 'tavares')
-- foi adicionado mais 10 mas o cabeção aqui apagou sem querer

select * from produtos

update produtos set qtd_estoque = 0 where id_produto = 2
update produtos set qtd_estoque = 15 where id_produto = 4
update produtos set qtd_estoque = 3 where id_produto = 5
update produtos set qtd_estoque = 10 where id_produto = 10
update produtos set qtd_estoque = 4 where id_produto = 3

select * from pedidos

delete from pedidos where id_pedido = 1 or id_pedido = 3

select * from produtos
