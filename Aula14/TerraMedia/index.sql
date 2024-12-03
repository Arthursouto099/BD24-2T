create table Personagem (
id_personagem serial primary key,
nome_personagem varchar(20) not null
)

insert into personagem (nome_personagem) values 
('Aragorn'),
('Legolas'),
('Gimli'),
('Gandalf'),
-- valores novos
('Galadriel'),
('Elrond'),
('Frodo')



create table Item (
id_item serial primary key,
nome_item varchar(20) not null,
valor money not null
)


insert into Item (nome_item, valor) values
('Espada Elfica', 10000),
('Arco Longo', 1777),
('Machado de Batalha', 3000),
('Varinha magica', 8000),
('Anel Elfico', 10000),
('O Anel', 50000)

create table Cenario (
id_cenario serial primary key,
nome_cenario varchar(40)
)

insert into cenario (nome_cenario) values 
('Floresta de Lothlórien'),
('Montanhas de Moria'),
('Campo de Batalha de Helm'),
('Gondor'),
('Condado')

create table Coletado(
id_coletado serial primary key,
id_personagem int references personagem(id_personagem),
id_item int references item(id_item),
id_cenario int  references cenario(id_cenario)
)

insert into coletado (id_personagem, id_item, id_cenario) values
(1,1,1),
(2,2,2),
(3,3,3),
(4,4,1),
(1,3,3),
(2,1,1)