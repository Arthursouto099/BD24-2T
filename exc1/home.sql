create database Sorveteria;

create table Clientes {
    Id_do_cliente int primary key,
    Nome_do_Cliente varchar(50),
    Endereço varchar(50),
    Telefone int
};

create table Sorvetes {
    Id_do_sorvete int primary key,
    Sabor varchar(100),
    Tipo varchar(255)
}


create table Pedidos {
    Id_pedido int primary key,
    Id_cliente int,
    foreign key(Id_cliente) references Clientes(Id_do_cliente),
    Id_sorvete int,
    foreign key(Id_sorvete) references Sorvetes(Id_do_sorvete)
}
