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