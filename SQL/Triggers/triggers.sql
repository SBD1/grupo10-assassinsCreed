CREATE TRIGGER inserirArea
BEFORE INSERT ON tbl_area
FOR EACH ROW EXECUTE PROCEDURE inserir_area();

CREATE TRIGGER inserirQuadrado
BEFORE INSERT ON tbl_quadrado
FOR EACH ROW EXECUTE PROCEDURE inserir_quadrado();

CREATE TRIGGER inserirQuadradoItem
BEFORE INSERT ON tbl_quadrado_localiza_item
FOR EACH ROW EXECUTE PROCEDURE inserir_quadrado_localiza_item();

CREATE TRIGGER inserirItemMercado
BEFORE INSERT ON tbl_mercado_possui_item
FOR EACH ROW EXECUTE PROCEDURE inserir_item_no_mercado();

CREATE TRIGGER deletarItemMercado
AFTER DELETE ON tbl_mercado_possui_item
FOR EACH ROW EXECUTE PROCEDURE deletar_item_no_mercado();

CREATE TRIGGER inserirHeroi
BEFORE INSERT ON tbl_heroi
FOR EACH ROW EXECUTE PROCEDURE inserir_heroi();

CREATE TRIGGER inserirAliado
BEFORE INSERT ON tbl_aliado
FOR EACH ROW EXECUTE PROCEDURE inserir_aliado();

CREATE TRIGGER inserirInimigo
BEFORE INSERT ON tbl_inimigo
FOR EACH ROW EXECUTE PROCEDURE inserir_inimigo();

CREATE TRIGGER inserirCivil
BEFORE INSERT ON tbl_civil
FOR EACH ROW EXECUTE PROCEDURE inserir_civil();

CREATE TRIGGER inserirUtilitario
BEFORE INSERT ON tbl_utilitario
FOR EACH ROW EXECUTE PROCEDURE inserir_utilitario();

CREATE TRIGGER inserirArma
BEFORE INSERT ON tbl_arma
FOR EACH ROW EXECUTE PROCEDURE inserir_arma();

CREATE TRIGGER inserirArmadura
BEFORE INSERT ON tbl_armadura
FOR EACH ROW EXECUTE PROCEDURE inserir_armadura();

CREATE TRIGGER deletarCivil
AFTER DELETE ON tbl_instancia_civil
FOR EACH ROW EXECUTE PROCEDURE deletar_civil();

CREATE TRIGGER deletarAliado
AFTER DELETE ON tbl_instancia_aliado
FOR EACH ROW EXECUTE PROCEDURE deletar_aliado();

CREATE TRIGGER deletarInimigo
AFTER DELETE ON tbl_instancia_inimigo
FOR EACH ROW EXECUTE PROCEDURE deletar_inimigo();

CREATE TRIGGER deletarItem
AFTER DELETE ON tbl_instancia_item
FOR EACH ROW EXECUTE PROCEDURE deletar_item();
