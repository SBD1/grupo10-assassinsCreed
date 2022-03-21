CREATE DATABASE assassins_creed;

CREATE TABLE [IF NOT EXISTS] tbl_area (
    id_nome integer CONSTRAINT pk_nome_area PRIMARY KEY 
    nome VARCHAR(20) NOT NULL,
    tamanho_x integer NOT NULL,
    tamanho_y integer NOT NULL,
    descricao varchar(50) NOT NULL,
    bioma varchar(10) NOT NULL,
    clima varchar(10) NOT NULL
);

CREATE TABLE [IF NOT EXISTS] tbl_quadrado (
    terreno integer NOT NULL;
    tamanho_x integer NOT NULL,
    tamanho_y integer NOT NULL,
    area integer NOT NULL,
    FOREIGN KEY (terreno) REFERENCES tbl_area (id_nome)
);
