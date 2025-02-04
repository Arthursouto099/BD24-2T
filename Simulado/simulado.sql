CREATE TABLE House (
    ID_house Serial PRIMARY KEY,
    house_name varchar(40) NOT NULL
)

CREATE TABLE Character (
    ID_character Serial PRIMARY KEY,
    name_character varchar(40) NOT NULL,
    FK_house int NOT NULL,
    FOREIGN KEY (FK_house) REFERENCES house (ID_house)
)


CREATE TABLE Spell (
    ID_spell Serial PRIMARY KEY,
    name_spell varchar(40)
)

CREATE TABLE Character_Spell (
    FK_character int NOT NULL,
    FOREIGN KEY (FK_character) REFERENCES Character (ID_character),
    FK_spell int NOT NULL,
    FOREIGN KEY (FK_spell) REFERENCES Spell (ID_spell)
)


CREATE TABLE Student (
    ID_student Serial PRIMARY KEY, 
    FK_character int not null,
	Foreign key (FK_character) references Character(ID_character)
)



CREATE TABLE Teacher (
    ID_teacher Serial PRIMARY KEY,
    FK_character int not null, 
    FOREIGN KEY (FK_character) REFERENCES Character (ID_character),
    FK_class int not null,
    FOREIGN KEY (FK_class) REFERENCES Class (ID_class)
)



CREATE TABLE Class (
    ID_class Serial PRIMARY KEY,
    class_name varchar(40) 
)




insert into House (house_name) values 
('Grifinoria'),
('Sonserina'),
('Corvinal'),
('Lufa-Lufa')


insert into Character(name_character, FK_house) values
('Harry Potter', 1),
('Lucios Malfoi', 2),
('Luna Lovegood', 3),
('Cedrico Diggory', 4),
('Dumbledore', 1),
('Snape', 2),
('Flitwick', 3),
('Lockhart', 4)


select * from Character inner join House on 
Character.FK_house = House.ID_house



insert into Student(FK_character) values 
(1),
(2),
(3),
(4)

insert into Class (class_name) values 
('Transfiguração'), 
('Poções'),
('Feitiçaria'),
('Defesa contra as artes das Trevas')


insert into Teacher(FK_character, Fk_class) 
values(5, 1),
values(6, 2),
values(7, 3),
values(8, 4)

select Character.name_character, House.house_name
from Character inner join House  on Character.FK_house = House.ID_house


select Character.name_character from Student inner join Character on
Student.FK_character = Character.ID_character inner join House on Character.FK_house = 
House.ID_house where House.house_name = 'Grifinoria'

alter table Character add column date_of_birth Date

select * from character

update Character set date_of_birth = '1980-07-31' where
ID_character = 1
update Character set date_of_birth = '1954-06-12' where
ID_character = 2
update Character set date_of_birth = '1981-02-13' where
ID_character = 3
update Character set date_of_birth = '1977-07-31' where
ID_character = 4
update Character set date_of_birth = '1881-07-31' where
ID_character = 5
update Character set date_of_birth = '1960-07-31' where
ID_character = 6
update Character set date_of_birth = '1780-07-31' where
ID_character = 7
update Character set date_of_birth = '1964-07-31' where
ID_character = 8

Create view personagens_grifinoria as select 
Character.name_character, character.date_of_birth, House.house_name from Character inner
join House on Character.FK_house = House.ID_house where 
house_name = 'Grifinoria'

select * from personagens_grifinoria

Create Index on Character (name_character)


select character.name_character from Character 
