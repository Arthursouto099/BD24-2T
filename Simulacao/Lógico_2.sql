/* L�gico_2: */

CREATE TABLE User (
    ID_User INT(9) PRIMARY KEY,
    User_Name CHAR(40),
    e_mail CHAR(40),
    _Signature_date DATE,
    Signature_type CHAR(40),
    _Viewing_history CHAR(40)
);

CREATE TABLE Movie (
    Durantion_Filme TIME,
    fk_Content_Cast_ID_Content INT(9) PRIMARY KEY
);

CREATE TABLE Genre (
    ID_Genre INT(9) PRIMARY KEY,
    Genre_Name CHAR(40)
);

CREATE TABLE Actor (
    ID_Actor INT(9) PRIMARY KEY,
    Actor_Name CHAR(40),
    Date_of_birth DATE,
    Nacionality CHAR(40),
    fk_Content_Cast_ID_Content INT(9)
);

CREATE TABLE Director (
    Date_of_birth DATE,
    Director_Name CHAR(40),
    Nacionality CHAR(40),
    ID_Director INT(9) PRIMARY KEY
);

CREATE TABLE Rating_See (
    ID_Rating INT(9) PRIMARY KEY,
     fk_User_ID_User INT(9),
    fk_Content_Cast_ID_Content INT(9),
    Score INT(9),
    Creation_date DATE
   
);

CREATE TABLE Premium (
    fk_User_ID_User INT(9) PRIMARY KEY,
    Exclusive_content CHAR(40),
    Unlimited_playlist BOOLEAN
);

CREATE TABLE Basic (
    fk_User_ID_User INT(9) PRIMARY KEY,
    _Limited_access_to_the_catalog BOOLEAN,
    _Advertisements_between_films BOOLEAN
);

CREATE TABLE Series (
    fk_Content_Cast_ID_Content INT(9) PRIMARY KEY,
    Seasons INT(9),
    Quantity_Seasons INT(9),
    Quantity_Episodes INT(9)
 
);

CREATE TABLE Content_Cast (
    ID_Content INT(9) PRIMARY KEY,
    Title CHAR(40),
    Classification CHAR(40),
    fk_Genre_ID_Genre INT(9),
    fk_Director_ID_Director INT(9)
);

CREATE TABLE Episode (
    ID_Episode INT(9) PRIMARY KEY,
    fk_Series_fk_Content_Cast_ID_Content INT(9),
    Episode_Title CHAR(40),
    Duration_Episode TIME

);

CREATE TABLE Wish_List_Has (
    ID_Wish_List INT(9) PRIMARY KEY,
    fk_Content_Cast_ID_Content INT(9),
    fk_User_ID_User INT(9),
    List_Name CHAR(40),
    Creation_date DATE
 
);
 
ALTER TABLE Movie ADD CONSTRAINT FK_Movie_2
    FOREIGN KEY (fk_Content_Cast_ID_Content)
    REFERENCES Content_Cast (ID_Content)
    ON DELETE CASCADE;
 
ALTER TABLE Actor ADD CONSTRAINT FK_Actor_2
    FOREIGN KEY (fk_Content_Cast_ID_Content)
    REFERENCES Content_Cast (ID_Content)
    ON DELETE RESTRICT;
 
ALTER TABLE Rating_See ADD CONSTRAINT FK_Rating_See_2
    FOREIGN KEY (fk_User_ID_User)
    REFERENCES User (ID_User);
 
ALTER TABLE Rating_See ADD CONSTRAINT FK_Rating_See_3
    FOREIGN KEY (fk_Content_Cast_ID_Content)
    REFERENCES Content_Cast (ID_Content);
 
ALTER TABLE Premium ADD CONSTRAINT FK_Premium_2
    FOREIGN KEY (fk_User_ID_User)
    REFERENCES User (ID_User)
    ON DELETE CASCADE;
 
ALTER TABLE Basic ADD CONSTRAINT FK_Basic_2
    FOREIGN KEY (fk_User_ID_User)
    REFERENCES User (ID_User)
    ON DELETE CASCADE;
 
ALTER TABLE Series ADD CONSTRAINT FK_Series_2
    FOREIGN KEY (fk_Content_Cast_ID_Content)
    REFERENCES Content_Cast (ID_Content)
    ON DELETE CASCADE;
 
ALTER TABLE Content_Cast ADD CONSTRAINT FK_Content_Cast_2
    FOREIGN KEY (fk_Genre_ID_Genre)
    REFERENCES Genre (ID_Genre)
    ON DELETE RESTRICT;
 
ALTER TABLE Content_Cast ADD CONSTRAINT FK_Content_Cast_3
    FOREIGN KEY (fk_Director_ID_Director)
    REFERENCES Director (ID_Director)
    ON DELETE RESTRICT;
 
ALTER TABLE Episode ADD CONSTRAINT FK_Episode_2
    FOREIGN KEY (fk_Series_fk_Content_Cast_ID_Content)
    REFERENCES Series (fk_Content_Cast_ID_Content)
    ON DELETE RESTRICT;
 
ALTER TABLE Wish_List_Has ADD CONSTRAINT FK_Wish_List_Has_2
    FOREIGN KEY (fk_Content_Cast_ID_Content)
    REFERENCES Content_Cast (ID_Content);
 
ALTER TABLE Wish_List_Has ADD CONSTRAINT FK_Wish_List_Has_3
    FOREIGN KEY (fk_User_ID_User)
    REFERENCES User (ID_User);