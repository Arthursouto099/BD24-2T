create table personagem(
id_personagem serial primary key,
nome_personagem varchar(40) not null,
)

create table Goron (
id_personagem int references personagem(id_personagem),
Habilidade_Goron text not null
)

create table Hyllian (
id_personagem int references personagem(id_personagem),
Habilidade_Hyllian text not null
)

create table item (
id_item serial primary key,
nome_item varchar(20) not null,
efeito text not null,
raridade varchar(20) not null,
tipo varchar(20) not null
)

create table local (
id_local serial primary key,
local_nome varchar(20) not null,
descricao_local text not null,
tipo varchar(20) not null
)

create table associado (
id_local int references local(id_local) not null,
id_personagem int references  personagem(id_personagem) not null
) 

create table relacao (
id_personagem_relaciona int references personagem(id_personagem) not null,
id_personagem_relacionado int references personagem(id_personagem) not null
)

create table inventario (
id_personagem int references personagem(id_personagem) not null,
id_item int references item(id_item) not null,
quantidade smallint check (quantidade > 0) not null
)
