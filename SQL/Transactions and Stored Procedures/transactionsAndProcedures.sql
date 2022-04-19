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
