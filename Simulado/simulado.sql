CREATE DATABASE Hogwarts;

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
)



CREATE TABLE Teacher (
    ID_teacher Serial PRIMARY KEY,
    FK_character int not null, 
    FOREIGN KEY (FK_character) REFERENCES Character (ID_character),
    FK_class int not null,
    FOREIGN KEY (FK_class) REFERENCES Character (ID_class)
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


-- Alunos and Teachers --> characters
insert into Character(name_character, FK_house) values

-- Alunoss 
('Harry Potter', 1),
('Lucios Malfoi', 2),
('Luna Lovegood', 3),
('Cedrico Diggory', 4),
-- Professores 
('Dumbledore', 1),
('Snape', 2),
('Flitwick', 3),
('Lockhart', 4)




insert into Student(FK_character) values 
(1),
(2),
(3),
(4)

insert into Class (class_name) values 
('Transfiguração')



-- select * from Student inner join Character 
-- on Student.FK_Character = Character.ID_character 
-- inner join House  on Character.FK_house = House.ID_house
--  where House.name = "pika roliça"