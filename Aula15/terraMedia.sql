select * from coletado
select * from personagem
select * from item
select * from cenario

update coletado set id_item = 5 where id_coletado = 6
update coletado set id_item = 6 where id_coletado = 5

select nome_personagem as personagem, nome_item as item_coletado
from personagem, item, coletado where personagem.id_personagem = 
coletado.id_personagem and coletado.id_item = item.id_item and nome_personagem = 'Aragorn'

select nome_personagem, nome_item from 
personagem inner join coletado on personagem.id_personagem = coletado.id_personagem
inner join item on  item.id_item = coletado.id_item where nome_personagem = 'Aragorn'


select nome_personagem, nome_cenario from personagem, cenario, coletado
where personagem.id_personagem = coletado.id_personagem and 
cenario.id_cenario = coletado.id_cenario and nome_personagem = 'Legolas'

select nome_personagem, nome_cenario from
personagem join coletado on personagem.id_personagem = coletado.id_personagem
join cenario on cenario.id_cenario = coletado.id_cenario where nome_personagem = 'Legolas'

select nome_personagem, nome_cenario, nome_item from
personagem, cenario, item, coletado where personagem.id_personagem =
coletado.id_personagem and cenario.id_cenario = coletado.id_cenario and 
item.id_item = coletado.id_item and nome_personagem = 'Gimli' 

select nome_personagem, nome_cenario, nome_item from
personagem join coletado on personagem.id_personagem = coletado.id_personagem
join cenario on cenario.id_cenario = coletado.id_cenario 
join item on item.id_item = coletado.id_item where nome_cenario = 'Campo de Batalha de Helm' and 
nome_personagem = 'Gimli'

select sum(valor_uni) as valor_toral from (select nome_item, valor as valor_uni, nome_cenario  from
item, cenario, coletado where item.id_item = 
coletado.id_item and cenario.id_cenario = 
coletado.id_cenario and nome_cenario = 'Floresta de Lothlórien')as  pt

select sum(valor_uni) as valor_total from(select valor as valor_uni, nome_cenario from 
item inner join coletado on item.id_item = coletado.id_item 
inner join cenario on cenario.id_cenario = coletado.id_cenario
where nome_cenario = 'Floresta de Lothlórien')as pt