/* aula8_excpt2: */

CREATE TABLE Player (
    fk_Level_Level_PK INT,
    Id_Player INT PRIMARY KEY,
    fk_Team_Id_Team INT
);

CREATE TABLE Team (
    Id_Team INT PRIMARY KEY,
    fk_Match_ID_Match INT,
    Name CHAR
);

CREATE TABLE Champion (
    Id_Champion INT PRIMARY KEY,
    fk_Player_Id_Player INT,
    Name CHAR,
    Ability CHAR,
    Damage_Type INT,
    Function INT
);

CREATE TABLE Player_Match_Game (
    fk_Player_Id_Player INT,
    fk_Match_ID_Match INT,
    Player_Points INT,
    Team_Points INT
);

CREATE TABLE Match (
    ID_Match INT PRIMARY KEY,
    fk_Champion_Id_Champion INT,
    Results CHAR,
    Duration TIME,
    Date_Time DATE
);

CREATE TABLE Item (
    Id_Item INT PRIMARY KEY,
    fk_Match_ID_Match INT,
    Cost MONEY,
    Description CHAR,
    Effect CHAR,
    Name CHAR
);

CREATE TABLE Defensive_Item (
    Armour INT,
    Res_Magic INT,
    fk_Item_Id_Item INT PRIMARY KEY
);

CREATE TABLE Consumable (
    fk_Item_Id_Item INT PRIMARY KEY,
    Hp INT
);

CREATE TABLE Offensive_Item (
    fk_Item_Id_Item INT PRIMARY KEY,
    Physic_Damage INT,
    Magic_Damage INT
);

CREATE TABLE Level (
    Level_PK INT NOT NULL PRIMARY KEY,
    Score INT,
    Region CHAR,
    User_name CHAR
);
 
ALTER TABLE Player ADD CONSTRAINT FK_Player_2
    FOREIGN KEY (fk_Level_Level_PK)
    REFERENCES Level (Level_PK)
    ON DELETE SET NULL;
 
ALTER TABLE Player ADD CONSTRAINT FK_Player_3
    FOREIGN KEY (fk_Team_Id_Team)
    REFERENCES Team (Id_Team)
    ON DELETE RESTRICT;
 
ALTER TABLE Team ADD CONSTRAINT FK_Team_2
    FOREIGN KEY (fk_Match_ID_Match)
    REFERENCES Match (ID_Match)
    ON DELETE RESTRICT;
 
ALTER TABLE Champion ADD CONSTRAINT FK_Champion_2
    FOREIGN KEY (fk_Player_Id_Player)
    REFERENCES Player (Id_Player)
    ON DELETE RESTRICT;
 
ALTER TABLE Player_Match_Game ADD CONSTRAINT FK_Player_Match_Game_1
    FOREIGN KEY (fk_Player_Id_Player)
    REFERENCES Player (Id_Player);
 
ALTER TABLE Player_Match_Game ADD CONSTRAINT FK_Player_Match_Game_2
    FOREIGN KEY (fk_Match_ID_Match)
    REFERENCES Match (ID_Match);
 
ALTER TABLE Match ADD CONSTRAINT FK_Match_2
    FOREIGN KEY (fk_Champion_Id_Champion)
    REFERENCES Champion (Id_Champion)
    ON DELETE RESTRICT;
 
ALTER TABLE Item ADD CONSTRAINT FK_Item_2
    FOREIGN KEY (fk_Match_ID_Match)
    REFERENCES Match (ID_Match)
    ON DELETE RESTRICT;
 
ALTER TABLE Defensive_Item ADD CONSTRAINT FK_Defensive_Item_2
    FOREIGN KEY (fk_Item_Id_Item)
    REFERENCES Item (Id_Item)
    ON DELETE CASCADE;
 
ALTER TABLE Consumable ADD CONSTRAINT FK_Consumable_2
    FOREIGN KEY (fk_Item_Id_Item)
    REFERENCES Item (Id_Item)
    ON DELETE CASCADE;
 
ALTER TABLE Offensive_Item ADD CONSTRAINT FK_Offensive_Item_2
    FOREIGN KEY (fk_Item_Id_Item)
    REFERENCES Item (Id_Item)
    ON DELETE CASCADE;