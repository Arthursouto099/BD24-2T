
Create table Cliente (
	ID_client int primary key,
	salario money not null
)


insert into Cliente (ID_client, salario) values(1, 1.200)
insert into Cliente (ID_client, salario) values(2, 5000)
select * from Cliente


update Cliente set salario = 7000 where id_client = 1


create table Historico_Salarial(
ID_HIstorico serial primary key,
ID_Client int references Cliente (ID_client),
Data_Alteracao Date,
salario money
) 

select * from Historico_Salarial

create or replace function atualiza_salario() returns 
trigger as $$ begin 
insert into historico_salarial(ID_client,  Data_Alteracao, salario)
values(New.ID_Client, NOW(), New.salario);
return null; end; $$LANGUAGE plpgsql

create or replace trigger trigger_salario 
after insert or update ON Cliente 
for each row
execute function atualiza_salario()


insert into Cliente (ID_client, salario) values (9, 23846293)



create table product (
ID_product int primary key,
name_product varchar(40) not null,
quantity int not null
)

alter table product add column price money 

select * from product

create table historic_products (
ID_historic serial primary key, 
ID_product int references product (ID_product),
UpdatedAndCreatedAt Date not null,
price money
)


drop table product
drop table historic_products

create or replace function updated_historic_products() returns
trigger as $$ begin 
insert into historic_products(ID_product, updatedAndCreatedAt, price) 
values (New.ID_product, NOW(), New.price);
return null; end; $$LANGUAGE plpgsql


create or replace trigger trigger_updated_created 
after insert or update ON product 
for each row execute function updated_historic_products()

insert into product values(2, 'Computer', 10, 8000)



select * from historic_products
