CREATE DATABASE assassins_creed;

CREATE DOMAIN ID AS INT NOT NULL CHECK(VALUE > 0);

CREATE DOMAIN nome AS VARCHAR(30) NOT NULL;

CREATE TABLE IF NOT EXISTS tbl_area (
    nome nome NOT NULL,
    tamanho_x INTEGER,
    tamanho_y INTEGER,
    descricao VARCHAR(50),
    bioma VARCHAR(10),
    clima VARCHAR(10),
    CONSTRAINT nomeArea PRIMARY KEY(nome)
);

CREATE TABLE IF NOT EXISTS tbl_quadrado (
	Quadrado_id INTEGER unique,
    coordenada_x INTEGER NOT NULL,
    coordenada_y INTEGER NOT NULL,
    area VARCHAR(20) NOT NULL,
    terreno INTEGER,
    FOREIGN KEY (area) REFERENCES tbl_area (nome)
);

CREATE TABLE tbl_civil (
    id ID NOT NULL,
    nomeCompleto nome NOT NULL,
    coordenada_x INTEGER,
    coordenada_y INTEGER,
    area VARCHAR(20),
    CONSTRAINT idDoCivil PRIMARY KEY(id),
    CONSTRAINT nomeCivil UNIQUE(nomeCompleto),
    FOREIGN KEY (area) REFERENCES tbl_area (nome),
    FOREIGN KEY (coordenada_x, coordenada_y) REFERENCES tbl_quadrado (coordenada_x, coordenada_y, area)
);

CREATE TABLE tbl_tipo_personagem (
    id ID NOT NULL,
    tipoPersonagem VARCHAR(20),
    CONSTRAINT idDoPersonagem PRIMARY KEY(id),
    FOREIGN KEY (idDoPersonagem) REFERENCES tbl_civil (id),
    FOREIGN KEY (idDoPersonagem) REFERENCES tbl_inimigo (id),
    FOREIGN KEY (idDoPersonagem) REFERENCES tbl_aliado (id),
    FOREIGN KEY (idDoPersonagem) REFERENCES tbl_heroi (id)
);

CREATE TABLE tbl_inimigo (
    id ID NOT NULL,
    nomeCompleto nome NOT NULL,
    tamanho INTEGER,
    raca VARCHAR(15),
    velocidade INTEGER,
    vida INTEGER,
    ataque INTEGER,
    coordenada_x INTEGER,
    coordenada_y INTEGER,
    area VARCHAR(20),
    CONSTRAINT idDoInimigo PRIMARY KEY(id),
    CONSTRAINT nomeInimigo UNIQUE(nomeCompleto),
    FOREIGN KEY (area) REFERENCES tbl_area (nome),
    FOREIGN KEY (coordenada_x, coordenada_y) REFERENCES tbl_quadrado (coordenada_x, coordenada_y, area)
);

CREATE TABLE tbl_aliado (
    id ID NOT NULL,
    nomeCompleto nome NOT NULL,
    tamanho INTEGER,
    velocidade INTEGER,
    vida INTEGER,
    ataque INTEGER,
    coordenada_x INTEGER,
    coordenada_y INTEGER,
    area VARCHAR(20),
    CONSTRAINT idDoAliado PRIMARY KEY(id),
    CONSTRAINT nomeAliado UNIQUE(nomeCompleto),
    FOREIGN KEY (area) REFERENCES tbl_area (nome),
    FOREIGN KEY (coordenada_x, coordeenada_y) REFERENCES tbl_quadrado (coordenada_x, coordenada_y, area),
    FOREIGN KEY (idHeroi) REFERENCES tbl_Heroi (id)
);

CREATE TABLE tbl_heroi (
    id ID NOT NULL,
    nomeCompleto nome NOT NULL,
    velocidade INTEGER,
    vida INTEGER,
    forca INTEGER,
    XP INTEGER,
    moedas INTEGER,
    idArmadura ID,
    idArma ID,
    idInventario ID,
    coordenada_x INTEGER,
    coordenada_y INTEGER,
    area VARCHAR(20),
    CONSTRAINT idDoHeroi PRIMARY KEY(id),
    CONSTRAINT nomeHeroi UNIQUE(nomeCompleto),
    FOREIGN KEY (area) REFERENCES tbl_area (nome),
    FOREIGN KEY (coordenada_x, coordeenada_y) REFERENCES tbl_quadrado (coordenada_x, coordenada_y, area),
    FOREIGN KEY (idArmadura) REFERENCES tbl_Armadura (id),
    FOREIGN KEY (idArma) REFERENCES tbl_Arma(id),
    FOREIGN KEY (idInventario) REFERENCES tbl_Inventario(idIventario)
);

CREATE TABLE tbl_instancia_civil (
    idInstanciaCivil ID NOT NULL,
    idCivil ID,
    CONSTRAINT idDaInstanciaCivil PRIMARY KEY(idInstanciaCivil),
    FOREIGN KEY (idCivil) REFERENCES tbl_TipoDePersonagem (idPersonagem)
);

CREATE TABLE tbl_instancia_inimigo(
    idInstanciaInimigo ID NOT NULL,
    idInimigo ID,
    CONSTRAINT idDaInstanciaInimigo PRIMARY KEY(idInstanciaInimigo),
    FOREIGN KEY (idInimigo) REFERENCES tbl_TipoDePersonagem (idPersonagem)
);

CREATE TABLE tbl_instancia_aliado(
    idInstanciaAliado ID NOT NULL,
    idAliado ID,
    CONSTRAINT idDaInstanciaAliado PRIMARY KEY(idInstanciaAliado),
    FOREIGN KEY (idAliado) REFERENCES tbl_TipoDePersonagem (idPersonagem)
);

CREATE TABLE tbl_heroi_ajuda_aliado(
    idInstanciaAliado ID NOT NULL,
    idHeroi ID,
    CONSTRAINT idDeHeroiAjudaAliado PRIMARY KEY(idInstanciaAliado),
    FOREIGN KEY (idHeroi) REFERENCES tbl_Heroi (id)
);

CREATE TABLE tbl_evolucao(
    categoria varchar(15) NOT NULL,
    idHeroi ID NOT NULL,
    XPMinimo INTEGER,
    ganho INTEGER CHECK (Value >= 0),
    CONSTRAINT evolucao PRIMARY KEY(Categoria, idHeroi),
    FOREIGN KEY (idHeroi) REFERENCES tbl_Heroi (id)
);

CREATE TABLE tbl_kill(
    idHeroi ID NOT NULL,
    idInstanciaInimigo ID Not NULL,
    vencedor nome,
    CONSTRAINT chavesPrimarias PRIMARY KEY(idHeroi, idInstanciaInimigo),
    FOREIGN KEY (idHeroi) REFERENCES tbl_Heroi (id),
    FOREIGN KEY (idInstanciaInimigo) REFERENCES tbl_InstanciaDeInimigo (idInstanciaInimigo)
);

CREATE TABLE tbl_missao(
    nome nome NOT NULL,
    idHeroi ID NOT NULL,
    objetivo VARCHAR(200), 
    dificuldade VARCHAR (10) CHECK (VALUE IN ('facil', 'medio', 'dificil')),
    CONSTRAINT chavesPrimariasMissao PRIMARY KEY(nome, idHeroi),
    FOREIGN KEY (idHeroi) REFERENCES tbl_Heroi (id)
);

CREATE TABLE tbl_recompensas(
    missao nome NOT NULL,
    recompensa VARCHAR(20) NOT NULL, 
    CONSTRAINT chavesPrimariasRecompensas PRIMARY KEY(misssao, recompensa),
    FOREIGN KEY (missao) REFERENCES tbl_Missao (nome, idHeroi)
);

CREATE TABLE tbl_inimigo_possui_utilitario(
    idUtilitario ID NOT NULL,
    idInstanciaInimigo ID NOT NULL,
    CONSTRAINT chavesPrimariasInimPossuiUtil PRIMARY KEY(idUtilitario, idInstanciaInimigo),
    FOREIGN KEY (idUtilitario) REFERENCES tbl_Utilitario (id),
    FOREIGN KEY (idInstanciaInimigo) REFERENCES tbl_InstanciaDeInimigo (idInstanciaInimigo)
);

CREATE TABLE tbl_utilitario(
    idUtilitario ID NOT NULL,
    descricao VARCHAR(50),
    valor INTEGER,
    efeito VARCHAR(20),
    categoria VARCHAR(20),
    local CHAR(2),
    CONSTRAINT chavesPrimariasUtilitario PRIMARY KEY(idUtilitario)
);

CREATE TABLE tbl_arma(
    idArma ID NOT NULL,
    descricao VARCHAR(50),
    valor INTEGER,
    dano VARCHAR(20),
    categoria VARCHAR(20),
    local CHAR(2),
    CONSTRAINT chavesPrimariasArma PRIMARY KEY(idArma)
);

CREATE TABLE tbl_armadura(
    idArmadura ID NOT NULL,
    descricao VARCHAR(50),
    valor INTEGER,
    defesa VARCHAR(20),
    categoria VARCHAR(20),
    local CHAR(2),
    CONSTRAINT chavesPrimariasArmadura PRIMARY KEY(idArmadura)
);

CREATE TABLE tbl_vantagens(
    Armadura ID NOT NULL,
    vantagem VARCHAR(20) NOT NULL,
    CONSTRAINT chavesPrimariasArmadura PRIMARY KEY(Armadura, vantagem),
    FOREIGN KEY (Armadura) REFERENCES tbl_Armadura (idArmadura)
);

CREATE TABLE tbl_tipo_item(
    idItem ID NOT NULL,
    tipoItem VARCHAR(15),
    CONSTRAINT chavesPrimariasArmadura PRIMARY KEY(idItem),
    FOREIGN KEY (idItem) REFERENCES tbl_Utilitario (idUtilitario),
    FOREIGN KEY (idItem) REFERENCES tbl_Arma (idArma),
    FOREIGN KEY (idItem) REFERENCES tbl_Armadura (idArmadura)
);

CREATE TABLE tbl_item_localiza_quadrado(
    idInstancia ID NOT NULL,
    coordenada_x INTEGER,
    coordenada_y INTEGER,
    area VARCHAR(20),
    CONSTRAINT idDaInstancia PRIMARY KEY(idInstancia),
    FOREIGN KEY (idInstancia) REFERENCES tbl_InstanciaDeItem (idInstanciaItem),
    FOREIGN KEY (area) REFERENCES tbl_area (nome),
    FOREIGN KEY (coordenada_x, coordeenada_y) REFERENCES tbl_quadrado (coordenada_x, coordenada_y, area)
);

CREATE TABLE tbl_mercado(
    idMercado ID NOT NULL,
    coordenada_x INTEGER,
    coordenada_y INTEGER,
    area VARCHAR(20),
    CONSTRAINT idDoMercado PRIMARY KEY(idMercado),
    FOREIGN KEY (area) REFERENCES tbl_area (nome),
    FOREIGN KEY (coordenada_x, coordeenada_y) REFERENCES tbl_quadrado (coordenada_x, coordenada_y, area)
);

CREATE TABLE tbl_mercado_possui_item(
    idMercado ID NOT NULL,
    idInstancia ID NOT NULL,
    CONSTRAINT idDoMercadoPossuiItem PRIMARY KEY(idMercado, idInstancia),
    FOREIGN KEY (idMercado) REFERENCES tbl_Mercado (idMercado),
    FOREIGN KEY (idInstancia) REFERENCES tbl_InstanciaDeItem (idInstanciaItem)
);

CREATE TABLE tbl_instancia_Item(
    idInstanciaItem ID NOT NULL,
    idItem ID,
    CONSTRAINT idDaInstanciaItem PRIMARY KEY(idInstanciaItem),
    FOREIGN KEY (idItem) REFERENCES tbl_tipoDeItem (idItem)
);

CREATE TABLE tbl_inventario(
    idInventario ID NOT NULL,
    tamanho INTEGER,
    CONSTRAINT idDoInventario PRIMARY KEY(idInventario)
);

CREATE TABLE tbl_inventario_armazena_item(
    idInventario ID NOT NULL,
    idInstancia ID NOT NULL,
    CONSTRAINT chavesPrimariaInvArmItem PRIMARY KEY(idInventario, idInstancia),
    FOREIGN KEY (idInstancia) REFERENCES tbl_InstanciaDeItem (idInstanciaItem)
);
