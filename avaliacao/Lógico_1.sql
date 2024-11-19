/* Lógico_1: */

CREATE TABLE Usuario (
    ID_Usuario INT(9) PRIMARY KEY,
    Nome_Usuario VARCHAR(40),
    Senha INT(6),
    fk_Endereco_Endereco_PK INT(9)
);

CREATE TABLE Exclusiva (
    Criacao_De_Playlist_Ilimitada BOOLEAN,
    Sem_Anuncios BOOLEAN,
    fk_Usuario_ID_Usuario INT(9) PRIMARY KEY
);

CREATE TABLE Padrao (
    Anuncios_Entre_Musicas BOOLEAN,
    Criacao_De_Playlist_Limitada BOOLEAN,
    fk_Usuario_ID_Usuario INT(9) PRIMARY KEY
);

CREATE TABLE Conteudo (
    ID_Conteudo INT(9) PRIMARY KEY,
    Nome_Conteudo VARCHAR(40),
    Duracao TIME,
    Classificacao VARCHAR(40)
);

CREATE TABLE Podcast (
    Convidado VARCHAR(40),
    Genero_Podcast VARCHAR(40),
    Ao_Vivo BOOLEAN,
    Data_Transmissao DATE,
    fk_Conteudo_ID_Conteudo INT(9) PRIMARY KEY,
    fk_Apresentador_ID_Apresentador INT(9),
    fk_Serie_ID_Serie INT(9)
);

CREATE TABLE Musica (
    Album VARCHAR(40),
    Genero_Musical VARCHAR(40),
    Data_Lancamento_Musica DATE,
    fk_Conteudo_ID_Conteudo INT(9) PRIMARY KEY,
    fk_Artista_ID_Artista INT(9),
    fk_Album_ID_Album INT(9)
);

CREATE TABLE Artista (
    ID_Artista INT(9) PRIMARY KEY,
    Nome_Artista VARCHAR(40),
    Nome_Musical VARCHAR(40),
    Genero_Primario VARCHAR(40)
);

CREATE TABLE Apresentador (
    ID_Apresentador INT(9) PRIMARY KEY,
    Nome_Apresentador VARCHAR(40)
);

CREATE TABLE Playlist_Escuta_Novamente (
    ID_Playlist INT(9) PRIMARY KEY,
    Quantidade_Conteudo INT(6),
    fk_Usuario_ID_Usuario INT(9),
    fk_Conteudo_ID_Conteudo INT(9)
);

CREATE TABLE Audicao_Escuta (
    ID_Audicao INT(9) PRIMARY KEY,
    Data DATE,
    Hora TIME,
    fk_Usuario_ID_Usuario INT(9),
    fk_Conteudo_ID_Conteudo INT(9)
);

CREATE TABLE Album (
    ID_Album INT(9) PRIMARY KEY,
    Genero_Primario_Album VARCHAR(40),
    Quantidade_Musica INT(9),
    Data_Lancamento_Album DATE,
    fk_Artista_ID_Artista INT(9)
);

CREATE TABLE Serie (
    ID_Serie INT(9) PRIMARY KEY,
    Genero_Primario_Serie VARCHAR(40),
    Quantidade_Episodio INT(6),
    fk_Apresentador_ID_Apresentador INT(9)
);

CREATE TABLE Endereco (
    Endereco_PK INT(9) NOT NULL PRIMARY KEY,
    Rua VARCHAR(40),
    Cidade VARCHAR(40)
);
 
ALTER TABLE Usuario ADD CONSTRAINT FK_Usuario_2
    FOREIGN KEY (fk_Endereco_Endereco_PK)
    REFERENCES Endereco (Endereco_PK)
    ON DELETE SET NULL;
 
ALTER TABLE Exclusiva ADD CONSTRAINT FK_Exclusiva_2
    FOREIGN KEY (fk_Usuario_ID_Usuario)
    REFERENCES Usuario (ID_Usuario)
    ON DELETE CASCADE;
 
ALTER TABLE Padrao ADD CONSTRAINT FK_Padrao_2
    FOREIGN KEY (fk_Usuario_ID_Usuario)
    REFERENCES Usuario (ID_Usuario)
    ON DELETE CASCADE;
 
ALTER TABLE Podcast ADD CONSTRAINT FK_Podcast_2
    FOREIGN KEY (fk_Conteudo_ID_Conteudo)
    REFERENCES Conteudo (ID_Conteudo)
    ON DELETE CASCADE;
 
ALTER TABLE Podcast ADD CONSTRAINT FK_Podcast_3
    FOREIGN KEY (fk_Apresentador_ID_Apresentador)
    REFERENCES Apresentador (ID_Apresentador)
    ON DELETE RESTRICT;
 
ALTER TABLE Podcast ADD CONSTRAINT FK_Podcast_4
    FOREIGN KEY (fk_Serie_ID_Serie)
    REFERENCES Serie (ID_Serie)
    ON DELETE RESTRICT;
 
ALTER TABLE Musica ADD CONSTRAINT FK_Musica_2
    FOREIGN KEY (fk_Conteudo_ID_Conteudo)
    REFERENCES Conteudo (ID_Conteudo)
    ON DELETE CASCADE;
 
ALTER TABLE Musica ADD CONSTRAINT FK_Musica_3
    FOREIGN KEY (fk_Artista_ID_Artista)
    REFERENCES Artista (ID_Artista)
    ON DELETE RESTRICT;
 
ALTER TABLE Musica ADD CONSTRAINT FK_Musica_4
    FOREIGN KEY (fk_Album_ID_Album)
    REFERENCES Album (ID_Album)
    ON DELETE RESTRICT;
 
ALTER TABLE Playlist_Escuta_Novamente ADD CONSTRAINT FK_Playlist_Escuta_Novamente_2
    FOREIGN KEY (fk_Usuario_ID_Usuario)
    REFERENCES Usuario (ID_Usuario);
 
ALTER TABLE Playlist_Escuta_Novamente ADD CONSTRAINT FK_Playlist_Escuta_Novamente_3
    FOREIGN KEY (fk_Conteudo_ID_Conteudo)
    REFERENCES Conteudo (ID_Conteudo);
 
ALTER TABLE Audicao_Escuta ADD CONSTRAINT FK_Audicao_Escuta_2
    FOREIGN KEY (fk_Usuario_ID_Usuario)
    REFERENCES Usuario (ID_Usuario);
 
ALTER TABLE Audicao_Escuta ADD CONSTRAINT FK_Audicao_Escuta_3
    FOREIGN KEY (fk_Conteudo_ID_Conteudo)
    REFERENCES Conteudo (ID_Conteudo);
 
ALTER TABLE Album ADD CONSTRAINT FK_Album_2
    FOREIGN KEY (fk_Artista_ID_Artista)
    REFERENCES Artista (ID_Artista)
    ON DELETE CASCADE;
 
ALTER TABLE Serie ADD CONSTRAINT FK_Serie_2
    FOREIGN KEY (fk_Apresentador_ID_Apresentador)
    REFERENCES Apresentador (ID_Apresentador)
    ON DELETE CASCADE;