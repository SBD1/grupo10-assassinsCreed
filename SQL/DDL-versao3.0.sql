CREATE DATABASE assassins_creed;

CREATE DOMAIN ID AS INT NOT NULL CHECK(VALUE > 0);

CREATE DOMAIN nome AS VARCHAR(30) NOT NULL;

CREATE TABLE IF NOT EXISTS tbl_area (
    nome nome NOT NULL,
    coordenada_x integer NOT NULL,
    coordenada_y integer NOT NULL,
    descricao varchar(50) NOT NULL,
    bioma varchar(10) NOT NULL,
    clima varchar(10) NOT NULL,
    CONSTRAINT nomeArea PRIMARY KEY(nome)
);

CREATE TABLE IF NOT EXISTS tbl_quadrado (
	Quadrado_id integer unique,
    coordenada_x integer NOT NULL,
    coordenada_y integer NOT NULL,
    area varchar(20) NOT NULL,
    terreno integer NOT NULL,
    FOREIGN KEY (area) REFERENCES tbl_area (nome)
);

CREATE TABLE tbl_civil (
    id ID NOT NULL,
    nomeCompleto nome NOT NULL,
    coordenada_x integer NOT NULL,
    coordenada_y integer NOT NULL,
    area varchar(20) NOT NULL,
    CONSTRAINT idDoCivil PRIMARY KEY(id),
    CONSTRAINT nomeCivil UNIQUE(nomeCompleto),
    FOREIGN KEY (area) REFERENCES tbl_area (nome),
    FOREIGN KEY (coordenada_x, coordenada_y) REFERENCES tbl_quadrado (coordenada_x, coordenada_y, area)
);

CREATE TABLE tbl_tipo_personagem (
    id ID NOT NULL,
    tipoPersonagem varchar(20) NOT NULL,
    CONSTRAINT idDoPersonagem PRIMARY KEY(id),
    FOREIGN KEY (idDoPersonagem) REFERENCES tbl_civil (id),
    FOREIGN KEY (idDoPersonagem) REFERENCES tbl_inimigo (id),
    FOREIGN KEY (idDoPersonagem) REFERENCES tbl_aliado (id),
    FOREIGN KEY (idDoPersonagem) REFERENCES tbl_heroi (id)
);

CREATE TABLE tbl_inimigo (
    id ID NOT NULL,
    nomeCompleto nome NOT NULL,
    tamanho integer NOT NULL,
    raca varchar(15) NOT NULL,
    velocidade integer NOT NULL,
    vida integer NOT NULL,
    ataque integer NOT NULL,
    coordenada_x integer NOT NULL,
    coordenada_y integer NOT NULL,
    area varchar(20) NOT NULL,
    CONSTRAINT idDoInimigo PRIMARY KEY(id),
    CONSTRAINT nomeInimigo UNIQUE(nomeCompleto),
    FOREIGN KEY (area) REFERENCES tbl_area (nome),
    FOREIGN KEY (coordenada_x, coordenada_y) REFERENCES tbl_quadrado (coordenada_x, coordenada_y, area)
);

CREATE TABLE tbl_aliado (
    id ID NOT NULL,
    nomeCompleto nome NOT NULL,
    tamanho integer NOT NULL,
    velocidade integer NOT NULL,
    vida integer NOT NULL,
    ataque integer NOT NULL,
    idHeroi ID NOT NULL,
    coordenada_x integer NOT NULL,
    coordenada_y integer NOT NULL,
    area varchar(20) NOT NULL,
    CONSTRAINT idDoAliado PRIMARY KEY(id),
    CONSTRAINT nomeAliado UNIQUE(nomeCompleto),
    FOREIGN KEY (area) REFERENCES tbl_area (nome),
    FOREIGN KEY (coordenada_x, coordeenada_y) REFERENCES tbl_quadrado (coordenada_x, coordenada_y, area),
    FOREIGN KEY (idHeroi) REFERENCES tbl_Heroi (id)
);

CREATE TABLE tbl_heroi (
    id ID NOT NULL,
    nomeCompleto nome NOT NULL,
    velocidade integer NOT NULL,
    vida integer NOT NULL,
    forca integer NOT NULL,
    XP integer NOT NULL,
    moedas integer NOT NULL,
    idArmadura id NOT NULL,
    idArma id NOT NULL,
    idInventario id NOT NULL,
    coordenada_x integer NOT NULL,
    coordenada_y integer NOT NULL,
    area varchar(20) NOT NULL,
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
    idCivil ID NOT NULL,
    CONSTRAINT idDaInstanciaCivil PRIMARY KEY(idInstanciaCivil),
    FOREIGN KEY (idCivil) REFERENCES tbl_TipoDePersonagem (idPersonagem)
);

CREATE TABLE tbl_instancia_inimigo(
    idInstanciaInimigo ID NOT NULL,
    idInimigo ID NOT NULL,
    CONSTRAINT idDaInstanciaInimigo PRIMARY KEY(idInstanciaInimigo),
    FOREIGN KEY (idInimigo) REFERENCES tbl_TipoDePersonagem (idPersonagem)
);

CREATE TABLE tbl_instancia_aliado(
    idInstanciaAliado ID NOT NULL,
    idAliado ID NOT NULL,
    CONSTRAINT idDaInstanciaAliado PRIMARY KEY(idInstanciaAliado),
    FOREIGN KEY (idAliado) REFERENCES tbl_TipoDePersonagem (idPersonagem)
);

CREATE TABLE tbl_heroi_ajuda_aliado(
    idInstanciaAliado ID NOT NULL,
    idHeroi ID NOT NULL,
    CONSTRAINT idDeHeroiAjudaAliado PRIMARY KEY(idInstanciaAliado),
    FOREIGN KEY (idHeroi) REFERENCES tbl_Heroi (id)
);

CREATE TABLE tbl_evolucao(
    categoria varchar(15),
    idHeroi ID NOT NULL,
    XPMinimo interger NOT NULL,
    ganho interger CHECK (Value >= 0),
    CONSTRAINT evolucao PRIMARY KEY(Categoria, idHeroi),
    FOREIGN KEY (idHeroi) REFERENCES tbl_Heroi (id)
);

CREATE TABLE tbl_kill(
    idHeroi ID NOT NULL,
    idInstanciaInimigo ID Not NULL,
    vencedor nome NOT NULL,
    CONSTRAINT chavesPrimarias PRIMARY KEY(idHeroi, idInstanciaInimigo),
    FOREIGN KEY (idHeroi) REFERENCES tbl_Heroi (id),
    FOREIGN KEY (idInstanciaInimigo) REFERENCES tbl_InstanciaDeInimigo (idInstanciaInimigo)
);

CREATE TABLE tbl_missao(
    nome nome NOT NULL,
    idHeroi ID NOT NULL,
    objetivo varchar(200), 
    dificuldade varchar (10) CHECK (VALUE IN ('facil', 'medio', 'dificil')),
    CONSTRAINT chavesPrimariasMissao PRIMARY KEY(nome, idHeroi),
    FOREIGN KEY (idHeroi) REFERENCES tbl_Heroi (id)
);

CREATE TABLE tbl_recompensas(
    missao nome NOT NULL,
    recompensa varchar(20) NOT NULL, 
    CONSTRAINT chavesPrimariasRecompensas PRIMARY KEY(misssao, recompensa),
    FOREIGN KEY (missao) REFERENCES tbl_Missao (nome, idHeroi)
);

CREATE TABLE tbl_inimigo_possui_utilitario(
    idUtilitario id NOT NULL,
    idInstanciaInimigo id NOT NULL,
    CONSTRAINT chavesPrimariasInimPossuiUtil PRIMARY KEY(idUtilitario, idInstanciaInimigo),
    FOREIGN KEY (idUtilitario) REFERENCES tbl_Utilitario (id),
    FOREIGN KEY (idInstanciaInimigo) REFERENCES tbl_InstanciaDeInimigo (idInstanciaInimigo)
);

CREATE TABLE tbl_utilitario(
    idUtilitario id NOT NULL,
    descricao varchar(50) NOT NULL,
    valor interger NOT NULL,
    efeito varchar(20) NOT NULL,
    categoria varchar(20) NOT NULL,
    local char(2),
    CONSTRAINT chavesPrimariasUtilitario PRIMARY KEY(idUtilitario)
);

CREATE TABLE tbl_arma(
    idArma id NOT NULL,
    descricao varchar(50) NOT NULL,
    valor interger NOT NULL,
    efeito varchar(20) NOT NULL,
    categoria varchar(20) NOT NULL,
    local char(2),
    CONSTRAINT chavesPrimariasArma PRIMARY KEY(idArma)
);

CREATE TABLE tbl_armadura(
    idArmadura id NOT NULL,
    descricao varchar(50) NOT NULL,
    valor interger NOT NULL,
    efeito varchar(20) NOT NULL,
    categoria varchar(20) NOT NULL,
    local char(2),
    CONSTRAINT chavesPrimariasArmadura PRIMARY KEY(idArmadura)
);

CREATE TABLE tbl_vantagens(
    Armadura id NOT NULL,
    vantagem varchar(20) NOT NULL,
    CONSTRAINT chavesPrimariasArmadura PRIMARY KEY(Armadura, vantagem),
    FOREIGN KEY (Armadura) REFERENCES tbl_Armadura (idArmadura)
);

CREATE TABLE tbl_tipo_item(
    idItem id NOT NULL,
    tipoItem varchar(15) NOT NULL,
    CONSTRAINT chavesPrimariasArmadura PRIMARY KEY(idItem),
    FOREIGN KEY (idItem) REFERENCES tbl_Utilitario (idUtilitario),
    FOREIGN KEY (idItem) REFERENCES tbl_Arma (idArma),
    FOREIGN KEY (idItem) REFERENCES tbl_Armadura (idArmadura)
);

CREATE TABLE tbl_item_localiza_quadrado(
    idInstancia id NOT NULL,
    coordenada_x integer NOT NULL,
    coordenada_y integer NOT NULL,
    area varchar(20) NOT NULL,
    CONSTRAINT idDaInstancia PRIMARY KEY(idInstancia),
    FOREIGN KEY (idInstancia) REFERENCES tbl_InstanciaDeItem (idInstanciaItem),
    FOREIGN KEY (area) REFERENCES tbl_area (nome),
    FOREIGN KEY (coordenada_x, coordeenada_y) REFERENCES tbl_quadrado (coordenada_x, coordenada_y, area)
);

CREATE TABLE tbl_mercado(
    idMercado id NOT NULL,
    coordenada_x integer NOT NULL,
    coordenada_y integer NOT NULL,
    area varchar(20) NOT NULL,
    CONSTRAINT idDoMercado PRIMARY KEY(idMercado),
    FOREIGN KEY (area) REFERENCES tbl_area (nome),
    FOREIGN KEY (coordenada_x, coordeenada_y) REFERENCES tbl_quadrado (coordenada_x, coordenada_y, area)
);

CREATE TABLE tbl_MercadoPossuiItem(
    idMercado id NOT NULL,
    idInstancia id NOT NULL,
    CONSTRAINT idDoMercadoPossuiItem PRIMARY KEY(idMercado, idInstancia),
    FOREIGN KEY (idMercado) REFERENCES tbl_Mercado (idMercado),
    FOREIGN KEY (idInstancia) REFERENCES tbl_InstanciaDeItem (idInstanciaItem)
);

CREATE TABLE tbl_mercado_possui_item(
    idMercado id NOT NULL,
    idInstancia id NOT NULL,
    CONSTRAINT idDoMercadoPossuiItem PRIMARY KEY(idMercado, idInstancia),
    FOREIGN KEY (idMercado) REFERENCES tbl_Mercado (idMercado),
    FOREIGN KEY (idInstancia) REFERENCES tbl_InstanciaDeItem (idInstanciaItem)
);

CREATE TABLE tbl_instancia_Item(
    idInstanciaItem id NOT NULL,
    idItem id NOT NULL,
    CONSTRAINT idDaInstanciaItem PRIMARY KEY(idInstanciaItem),
    FOREIGN KEY (idItem) REFERENCES tbl_tipoDeItem (idItem)
);

CREATE TABLE tbl_inventario(
    idInventario id NOT NULL,
    tamanho interger NOT NULL,
    CONSTRAINT idDoInventario PRIMARY KEY(idInventario)
);

CREATE TABLE tbl_inventario_armazena_item(
    idInventario id NOT NULL,
    idInstancia id NOT NULL,
    CONSTRAINT chavesPrimariaInvArmItem PRIMARY KEY(idInventario, idInstancia),
    FOREIGN KEY (idInstancia) REFERENCES tbl_InstanciaDeItem (idInstanciaItem)
);
