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

-- Dropa um item do usuário

CREATE OR REPLACE FUNCTION drop_item(id_player INTEGER, pos_item SMALLINT) RETURNS VOID AS $$
DECLARE
	invent_id INTEGER;

BEGIN
	SELECT tbl_heroi.idinventario INTO invent_id FROM tbl_heroi where id_heroi = id_player;
	UPDATE tbl_inventario_armazena_item SET tbl_instancia_Item=NULL WHERE idInventario = invent_id;
END;
$$ LANGUAGE plpgsql;

-- Adiciona item no quadrado

CREATE OR REPLACE FUNCTION add_item_to_quadrado(id_quadrado, x INT, y INT, area TEXT, terreno INT, item_description TEXT, item_type TEXT) RETURNS void AS $$
DECLARE
    item_id tbl_tipo_item.idItem%TYPE;
BEGIN
    IF (item_type = 'Utility') THEN
        SELECT tbl_utilitario.idUtilitario INTO item_id FROM tbl_utilitario WHERE tbl_utilitario.descricao = item_description;
    ELSIF (item_type = 'Weapon') THEN
        SELECT tbl_arma.idArma INTO item_id FROM tbl_arma WHERE tbl_arma.descricao = item_description;
    ELSIF (item_type = 'Armor') THEN
        SELECT tbl_armadura.idArmadura INTO item_id FROM tbl_armadura WHERE tbl_armadura.descricao = item_description;
    END IF;

    INSERT INTO tbl_quadrado (Quadrado_id,coordenada_x, coordenada_y, area, terreno) VALUES (id_quadrado, x, y, area, 0);
    INSERT INTO tbl_quadrado_localiza_item (id_instancia, coordenada_x, coordenada_y, area) VALUES (item_id, x, y, area);
END;
$$ LANGUAGE plpgsql;

-- pega um item do chão e coloca no inventário do heroi
CREATE OR REPLACE FUNCTION pega_item(terreno INT, area text, x INT, y INT, quadrado_id BIGINT) RETURNS void AS $$
DECLARE
    item_id BIGINT;
    tipo_item TEXT;
    heroi_id INT;
    not_null_count INT;
    inventario_id inventario.id%TYPE;
    rec record;
BEGIN
    -- pega o id do heroi
    SELECT tbl_heroi.id_heroi INTO heroi_id FROM tbl_heroi
        WHERE tbl_quadrado.Quadrado_id = quadrado_id;

    -- pega id do item
    SELECT tbl_quadrado_localiza_item.id_instancia INTO item_id FROM tbl_quadrado_localiza_item 
        WHERE tbl_quadrado_localiza_item.area = area 
        AND tbl_quadrado_localiza_item.coordenada_x = x AND tbl_quadrado_localiza_item.coordenada_y = y;

    SELECT tbl_tipo_item.tipoItem INTO tipo_item FROM tbl_tipo_item WHERE tbl_tipo_item.idItem = item_id;

    SELECT tbl_heroi.idinventario INTO inventario_id FROM tbl_heroi WHERE tbl_heroi.id_heroi = heroi_id;

    FOR rec IN SELECT * INTO rec FROM tbl_inventario_armazena_item WHERE idInventario = inventario_id
    LOOP
        IF (rec.idInstancia IS NULL) THEN
            UPDATE tbl_inventario_armazena_item SET idInstancia=item_id WHERE id_inventario = rec.idInventario;
                WHERE tbl_quadrado_localiza_item.area = area 
                AND tbl_quadrado_localiza_item.coordenada_x = x AND tbl_quadrado_localiza_item.coordenada_y = y; 
            RETURN;
        END IF;
    END LOOP;
END;
$$ LANGUAGE plpgsql;
