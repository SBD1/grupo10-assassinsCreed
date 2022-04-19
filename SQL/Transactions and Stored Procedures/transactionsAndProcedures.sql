CREATE OR REPLACE FUNCTION insert_area() RETURNS trigger AS $insert_area$
BEGIN
    PERFORM * FROM tbl_area WHERE nome = new.nome;
    IF FOUND THEN
        RAISE EXCEPTION 'this area already exists';
    END IF;
    RETURN NEW;
END;
$insert_area$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION insert_quadrado() RETURNS trigger AS $insert_quadrado$
BEGIN
    PERFORM * FROM tbl_quadrado WHERE Quadrado_id = new.Quadrado_id AND coordenada_x = new.coordenada_x AND coordenada_y = new.coordenada_y AND area = new.area;
    IF FOUND THEN
        RAISE EXCEPTION 'this quadrado already exists';
    END IF;
    RETURN NEW;
END;
$insert_quadrado$ LANGUAGE plpgsql;
