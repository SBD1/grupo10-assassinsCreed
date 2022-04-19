CREATE PROCEDURE insert_quadrado(quadrado_id integer, coordenada_x integer, coordenada_y integer, area TEXT, terreno integer)
LANGUAGE SQL
BEGIN ATOMIC
    INSERT INTO tbl_quadrado VALUES (quadrado_id, coordenada_x, coordenada_y, area, terreno);
END;

CREATE PROCEDURE insert_area(nome TEXT, tamanho_x integer, tamanho_y integer, descricao TEXT, bioma TEXT, clima TEXT)
LANGUAGE SQL
BEGIN ATOMIC
    INSERT INTO tbl_area VALUES (nome, tamanho_x, tamanho_y, descricao, bioma, clima);
END;

CREATE PROCEDURE insert_recompesas(missao TEXT, recompensa TEXT, idheroi integer)
LANGUAGE SQL
BEGIN ATOMIC
    INSERT INTO tbl_recompensas VALUES (missao, recompensa, idheroi);
END;

CREATE PROCEDURE insert_kill(idhorei integer, idinstanciainimigo integer, vecender integer)
LANGUAGE SQL
BEGIN ATOMIC
    INSERT INTO tbl_kill VALUES (idhorei, idinstanciainimigo, vecender);
END;

CREATE OR REPLACE FUNCTION inserir_area() RETURNS trigger AS $inserir_area$
BEGIN
    PERFORM * FROM tbl_area WHERE nome = new.nome;
    IF FOUND THEN
        RAISE EXCEPTION 'Esta área já existe';
    END IF;
    RETURN NEW;
END;
$inserir_area$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION inserir_quadrado() RETURNS trigger AS $inserir_quadrado$
BEGIN
    PERFORM * FROM tbl_quadrado WHERE Quadrado_id = new.Quadrado_id AND coordenada_x = new.coordenada_x AND coordenada_y = new.coordenada_y AND area = new.area;
    IF FOUND THEN
        RAISE EXCEPTION 'Este quadrado já existe';
    END IF;
    RETURN NEW;
END;
$inserir_quadrado$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION inserir_quadrado_localiza_item() RETURNS trigger AS $inserir_quadrado_localiza_item$
BEGIN
    PERFORM * FROM tbl_quadrado_localiza_item WHERE id_instancia = new.id_instancia;
    IF FOUND THEN
        RAISE EXCEPTION 'Este quadrado já possui um item';
    END IF;
    RETURN NEW;
END;
$inserir_quadrado_localiza_item$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION inserir_item_no_mercado() RETURNS trigger AS $inserir_item_no_mercado$
BEGIN
    PERFORM * FROM tbl_mercado_possui_item WHERE id_instancia = new.id_instancia AND id_mercado = new.id_mercado;
    IF FOUND THEN
        RAISE EXCEPTION 'Este item já está neste mercado';
    END IF;
    RETURN NEW;
END;
$inserir_item_no_mercado$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION deletar_item_no_mercado() RETURNS trigger AS $deletar_mercado_possui_item$
BEGIN
    DELETE FROM tbl_mercado_possui_item WHERE id_instancia = old.id_instancia AND id_mercado = old.id_mercado;
    RETURN NULL;
END;
$deletar_mercado_possui_item$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION inserir_heroi() RETURNS trigger AS $inserir_heroi$
BEGIN
    PERFORM * FROM tbl_heroi WHERE id_heroi = new.id_heroi;
    IF FOUND THEN
        RAISE EXCEPTION 'Heroi já existente';
    END IF;
    RETURN NEW;
END;
$inserir_heroi$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION inserir_aliado() RETURNS trigger AS $inserir_aliado$
BEGIN
    PERFORM * FROM tbl_aliado WHERE id = new.id;
    IF FOUND THEN
        RAISE EXCEPTION 'Aliado já existente';
    END IF;
    RETURN NEW;
END;
$inserir_aliado$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION inserir_inimigo() RETURNS trigger AS $inserir_inimigo$
BEGIN
    PERFORM * FROM tbl_inimigo WHERE id = new.id;
    IF FOUND THEN
        RAISE EXCEPTION 'Inimigo já existente';
    END IF;
    RETURN NEW;
END;
$inserir_inimigo$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION inserir_civil() RETURNS trigger AS $inserir_civil$
BEGIN
    PERFORM * FROM tbl_civil WHERE id = new.id;
    IF FOUND THEN
        RAISE EXCEPTION 'Civil já existente';
    END IF;
    RETURN NEW;
END;
$inserir_civil$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION inserir_utilitario() RETURNS trigger AS $inserir_utilitario$
BEGIN
    PERFORM * FROM tbl_utilitario WHERE idUtilitario = new.idUtilitario;
    IF FOUND THEN
        RAISE EXCEPTION 'Utilitario já existente';
    END IF;
    RETURN NEW;
END;
$inserir_utilitario$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION inserir_arma() RETURNS trigger AS $inserir_arma$
BEGIN
    PERFORM * FROM tbl_arma WHERE idArma = new.idArma;
    IF FOUND THEN
        RAISE EXCEPTION 'Arma já existente';
    END IF;
    RETURN NEW;
END;
$inserir_arma$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION inserir_armadura() RETURNS trigger AS $inserir_armadura$
BEGIN
    PERFORM * FROM tbl_armadura WHERE idArmadura = new.idArmadura;
    IF FOUND THEN
        RAISE EXCEPTION 'Armadura já existente';
    END IF;
    RETURN NEW;
END;
$inserir_armadura$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION inserir_vantagens() RETURNS trigger AS $inserir_vantagens$
BEGIN
    PERFORM * FROM tbl_vantagens WHERE id_vantagem = new.id_vantagem;
    IF FOUND THEN
        RAISE EXCEPTION 'Vantagem já existente';
    END IF;
    RETURN NEW;
END;
$inserir_vantagens$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION deletar_aliado() RETURNS trigger AS $deletar_aliado$
BEGIN
    DELETE FROM tbl_instancia_aliado WHERE idInstanciaAliado = old.idInstanciaAliado;
    RETURN NULL;
END;
$deletar_aliado$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION deletar_inimigo() RETURNS trigger AS $deletar_inimigo$
BEGIN
    DELETE FROM tbl_instancia_inimigo WHERE idInstanciaInimigo = old.idInstanciaInimigo;
    RETURN NULL;
END;
$deletar_inimigo$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION deletar_civil() RETURNS trigger AS $deletar_civil$
BEGIN
    DELETE FROM tbl_instancia_civil WHERE idInstanciaCivil = old.idInstanciaCivil;
    RETURN NULL;
END;
$deletar_civil$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION deletar_item() RETURNS trigger AS $deletar_item$
BEGIN
    DELETE FROM tbl_instancia_item WHERE id_instancia_item = old.id_instancia_item;
    RETURN NULL;
END;
$deletar_item$ LANGUAGE plpgsql;