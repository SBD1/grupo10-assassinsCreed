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
    FOREIGN KEY (area) REFERENCES tbl_area (nome),
	CONSTRAINT coordenadaXY PRIMARY KEY(coordenada_x, coordenada_y)
);

CREATE TABLE tbl_civil (
    id ID NOT NULL,
    nomeCompleto nome NOT NULL,
    coordenada_x INTEGER NOT NULL,
    coordenada_y INTEGER NOT NULL,
    area VARCHAR(20),
    CONSTRAINT idDoCivil PRIMARY KEY(id),
    CONSTRAINT nomeCivil UNIQUE(nomeCompleto),
    FOREIGN KEY (area) REFERENCES tbl_area (nome),
    FOREIGN KEY (coordenada_x, coordenada_y) REFERENCES tbl_quadrado (coordenada_x, coordenada_y)
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
    FOREIGN KEY (coordenada_x, coordenada_y) REFERENCES tbl_quadrado (coordenada_x, coordenada_y)
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
    id_vantagem ID NOT NULL,
    vantagem VARCHAR(20) NOT NULL,
    CONSTRAINT idVantagem PRIMARY KEY(id_vantagem),
    FOREIGN KEY (id_vantagem) REFERENCES tbl_Armadura (idArmadura)
);

CREATE TABLE tbl_inventario(
    idInventario ID NOT NULL,
    tamanho INTEGER,
    CONSTRAINT idDoInventario PRIMARY KEY(idInventario)
);

CREATE TABLE tbl_tipo_item(
    id_item ID NOT NULL,
    tipo_item VARCHAR(15),
    CONSTRAINT idItem PRIMARY KEY(id_item),
    FOREIGN KEY (id_item) REFERENCES tbl_Utilitario (idUtilitario),
    FOREIGN KEY (id_item) REFERENCES tbl_Arma (idArma),
    FOREIGN KEY (id_item) REFERENCES tbl_Armadura (idArmadura)
);

CREATE TABLE tbl_instancia_item(
    id_instancia_item ID NOT NULL,
    id_item ID,
    CONSTRAINT idDaInstanciaItem PRIMARY KEY(id_instancia_item),
    FOREIGN KEY (id_item) REFERENCES tbl_tipo_item (id_item)
);

CREATE TABLE tbl_item_localiza_quadrado(
    id_instancia ID NOT NULL,
    coordenada_x INTEGER,
    coordenada_y INTEGER,
    area VARCHAR(20),
    CONSTRAINT idDaInstancia PRIMARY KEY(id_instancia),
    FOREIGN KEY (id_instancia) REFERENCES tbl_instancia_item (id_instancia_item),
    FOREIGN KEY (area) REFERENCES tbl_area (nome),
    FOREIGN KEY (coordenada_x, coordenada_y) REFERENCES tbl_quadrado (coordenada_x, coordenada_y)
);

CREATE TABLE tbl_mercado(
    id_mercado ID NOT NULL,
    coordenada_x INTEGER,
    coordenada_y INTEGER,
    area VARCHAR(20),
    CONSTRAINT idDoMercado PRIMARY KEY(id_mercado),
    FOREIGN KEY (area) REFERENCES tbl_area (nome),
    FOREIGN KEY (coordenada_x, coordenada_y) REFERENCES tbl_quadrado (coordenada_x, coordenada_y)
);

CREATE TABLE tbl_mercado_possui_item(
    id_mercado ID NOT NULL,
    id_instancia ID NOT NULL,
    CONSTRAINT idDoMercadoPossuiItem PRIMARY KEY(id_mercado, id_instancia),
    FOREIGN KEY (id_mercado) REFERENCES tbl_mercado (id_mercado),
    FOREIGN KEY (id_instancia) REFERENCES tbl_instancia_item (id_instancia_item)
);

CREATE TABLE tbl_inventario_armazena_item(
    idInventario ID NOT NULL,
    idInstancia ID NOT NULL,
    CONSTRAINT chavesPrimariaInvArmItem PRIMARY KEY(idInventario, idInstancia),
    FOREIGN KEY (idInstancia) REFERENCES tbl_instancia_item (id_instancia_item)
);

CREATE TABLE tbl_heroi (
    id_heroi ID NOT NULL,
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
    CONSTRAINT idDoHeroi PRIMARY KEY(id_heroi),
    CONSTRAINT nomeHeroi UNIQUE(nomeCompleto),
    FOREIGN KEY (area) REFERENCES tbl_area (nome),
    FOREIGN KEY (coordenada_x, coordenada_y) REFERENCES tbl_quadrado (coordenada_x, coordenada_y),
    FOREIGN KEY (idArmadura) REFERENCES tbl_Armadura (idArmadura),
    FOREIGN KEY (idArma) REFERENCES tbl_Arma(idArma),
    FOREIGN KEY (idInventario) REFERENCES tbl_Inventario(idInventario)
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
	idHeroi ID,
    CONSTRAINT idDoAliado PRIMARY KEY(id),
    CONSTRAINT nomeAliado UNIQUE(nomeCompleto),
    FOREIGN KEY (area) REFERENCES tbl_area (nome),
    FOREIGN KEY (coordenada_x, coordenada_y) REFERENCES tbl_quadrado (coordenada_x, coordenada_y),
    FOREIGN KEY (idHeroi) REFERENCES tbl_Heroi (id_heroi)
);

CREATE TABLE tbl_tipo_personagem (
    id_tipo_personagem ID NOT NULL,
    tipoPersonagem VARCHAR(20),
    CONSTRAINT idDoPersonagem PRIMARY KEY(id_tipo_personagem),
    FOREIGN KEY (id_tipo_personagem) REFERENCES tbl_civil (id),
    FOREIGN KEY (id_tipo_personagem) REFERENCES tbl_inimigo (id),
    FOREIGN KEY (id_tipo_personagem) REFERENCES tbl_aliado (id),
    FOREIGN KEY (id_tipo_personagem) REFERENCES tbl_heroi (id_heroi)
);

CREATE TABLE tbl_instancia_civil (
    idInstanciaCivil ID NOT NULL,
    idCivil ID,
    CONSTRAINT idDaInstanciaCivil PRIMARY KEY(idInstanciaCivil),
    FOREIGN KEY (idCivil) REFERENCES tbl_tipo_personagem (id_tipo_personagem)
);

CREATE TABLE tbl_instancia_inimigo(
    idInstanciaInimigo ID NOT NULL,
    idInimigo ID,
    CONSTRAINT idDaInstanciaInimigo PRIMARY KEY(idInstanciaInimigo),
    FOREIGN KEY (idInimigo) REFERENCES tbl_tipo_personagem (id_tipo_personagem)
);

CREATE TABLE tbl_instancia_aliado(
    idInstanciaAliado ID NOT NULL,
    idAliado ID,
    CONSTRAINT idDaInstanciaAliado PRIMARY KEY(idInstanciaAliado),
    FOREIGN KEY (idAliado) REFERENCES tbl_tipo_personagem (id_tipo_personagem)
);

CREATE TABLE tbl_heroi_ajuda_aliado(
    idInstanciaAliado ID NOT NULL,
    idHeroi ID,
    CONSTRAINT idDeHeroiAjudaAliado PRIMARY KEY(idInstanciaAliado),
    FOREIGN KEY (idHeroi) REFERENCES tbl_Heroi (id_heroi)
);

CREATE TABLE tbl_evolucao(
    categoria varchar(15) NOT NULL,
    idHeroi ID NOT NULL,
    XPMinimo INTEGER,
    ganho INTEGER,
    CONSTRAINT evolucao PRIMARY KEY(categoria, idHeroi),
    FOREIGN KEY (idHeroi) REFERENCES tbl_heroi (id_heroi)
);

CREATE TABLE tbl_kill(
    idHeroi ID NOT NULL,
    idInstanciaInimigo ID Not NULL,
    vencedor nome,
    CONSTRAINT chavesPrimarias PRIMARY KEY(idHeroi, idInstanciaInimigo),
    FOREIGN KEY (idHeroi) REFERENCES tbl_heroi (id_heroi),
    FOREIGN KEY (idInstanciaInimigo) REFERENCES tbl_instancia_inimigo (idInstanciaInimigo)
);

CREATE TABLE tbl_missao(
    nome nome NOT NULL,
    idHeroi ID NOT NULL,
    objetivo VARCHAR(200), 
    dificuldade VARCHAR (10),
    CONSTRAINT chavesPrimariasMissao PRIMARY KEY(nome, idHeroi),
    FOREIGN KEY (idHeroi) REFERENCES tbl_Heroi (id_heroi)
);

CREATE TABLE tbl_recompensas(
    missao nome NOT NULL,
    recompensa VARCHAR(20) NOT NULL, 
	idHeroi ID NOT NULL,
    CONSTRAINT chavesPrimariasRecompensas PRIMARY KEY(missao, recompensa),
	FOREIGN KEY (idHeroi) REFERENCES tbl_Heroi (id_heroi),
    FOREIGN KEY (missao, idHeroi) REFERENCES tbl_missao (nome, idHeroi)
);

CREATE TABLE tbl_inimigo_possui_utilitario(
    idUtilitario ID NOT NULL,
    idInstanciaInimigo ID NOT NULL,
    CONSTRAINT chavesPrimariasInimPossuiUtil PRIMARY KEY(idUtilitario, idInstanciaInimigo),
    FOREIGN KEY (idUtilitario) REFERENCES tbl_utilitario (idUtilitario),
    FOREIGN KEY (idInstanciaInimigo) REFERENCES tbl_instancia_inimigo (idInstanciaInimigo)
);