INSERT INTO tbl_area VALUES('Castelo', 5, 4, 'Uma área repleta de perigosos soldados da realeza', 'Taiga', 'Frio');

INSERT INTO tbl_quadrado (Quadrado_id,coordenada_x, coordenada_y, area, terreno) VALUES 
(1, 1, 1, 'Castelo', 1),
(2, 1, 2, 'Castelo', 1),
(3, 1, 3, 'Castelo', 1),
(4, 1, 4, 'Castelo', 1),
(5, 2, 1, 'Castelo', 2),
(6, 2, 2, 'Castelo', 2),
(7, 2, 3, 'Castelo', 2),
(8, 2, 4, 'Castelo', 2),
(9, 3, 1, 'Castelo', 1),
(10, 3, 2, 'Castelo', 1),
(11, 3, 3, 'Castelo', 1),
(12, 3, 4, 'Castelo', 1),
(13, 4, 1, 'Castelo', 3),
(14, 4, 2, 'Castelo', 3),
(15, 4, 3, 'Castelo', 3),
(16, 4, 4, 'Castelo', 3),
(17, 5, 1, 'Castelo', 1),
(18, 5, 2, 'Castelo', 1),
(19, 5, 3, 'Castelo', 1),
(20, 5, 4, 'Castelo', 1);

INSERT INTO tbl_civil (id, nomeCompleto, coordenada_x, coordenada_y, area) VALUES
(1, 'Eduardo Gurgel', 1, 1, 'Castelo'),
(2, 'Arthur Sousa', 1, 2, 'Castelo');

INSERT INTO tbl_inimigo (id, nomeCompleto, tamanho, raca, velocidade, vida, ataque, coordenada_x, coordenada_y, area) VALUES 
(1, 'Vinicius Silva', 3, 'Warrior', 2, 100, 15, 2, 1, 'Castelo'),
(2, 'Wesley Santos', 2, 'Warrior', 3, 80, 12, 2, 2, 'Castelo');

INSERTO INTO tbl_aliado(id, nomeCompleto, tamanho, velocidade, vida, ataque, coordenada_x, coordenada_y, area) VALUES
(1, 'Mauricio', 3, 3, 100, 15, 3, 1, 'Castelo'),
(2, 'Maria', 1, 4, 90, 15, 3, 2, 'Castelo');

INSERT INTO tbl_heroi_ajuda_aliado VALUES(2, 3);

INSERT INTO tbl_heroi  VALUES(1, Alexios, 4, 150, 3, 0, 50, 9, 5, 1, 5, 5, 'Castelo');

INSERT INTO tbl_evolucao VALUES('Assassin', 1, 100, 60);

INSERT INTO tbl_missao (nome, idHeroi, objetivo, dificuldade) VALUES
('O salvador', 1, 'Salve os aliados dos ladroes', 'facil'),
('A vingança', 1, 'Vingue a morte de seu aliado', 'medio'),
('A joia rara', 1, 'Roube a joia rara do castelo sem ser visto', 'dificil');

INSERT INTO tbl_recompensas (missao, recompensa) VALUES
('O salvador', '100 XP'),
('O salvador', 'Espada romana'),
('A vingança', '150 XP'),
('A joia rara', 'Joia dos Assassinos'),
('A joia rara', '300 XP');

INSERT INTO tbl_utilitario (idUtilitario, descricao, valor, efeito, categoria, local) VALUES
(1, 'Remedio', 5, '+20 de vida', 'R', 'S'),
(2, 'Flor do campo', 1, '+5 de vida', 'R', 'M'),
(3, 'Bomba de fumaça', 10, 'Lança uma cortina de fumaça', 'S', 'E'),
(4, 'Bomba de veneno', 10, '-10 de vida', 'P', 'E');

INSERT INTO tbl_arma (idArma, descricao, valor, dano, categoria, local) VALUES
(5, 'Espada romana', 50, 25, 'S', 'E'),
(6, 'Machado', 65, 40, 'A', 'M'),
(7, 'Arco', 50, 15, 'B', 'E'),
(8, 'Lança', 55, 40, 'L', 'M');

INSERT INTO tbl_armadura VALUES (9, 'Armadura de assassino', '80', '45', 'I');

INSERT INTO tbl_vantagens (Armadura, vantagem) VALUES
(1, '+20% de defesa contra machados'),
(1, 'Ganho de furtividade');

INSERT INTO tbl_tipo_item (idItem, tipoItem) VALUES 
(1, 'Utility'),
(2, 'Utility'),
(3, 'Utility'),
(4, 'Utility'),
(5, 'Weapon'),
(6, 'Weapon'),
(7, 'Weapon'),
(8, 'Weapon'),
(9, 'Armor');

INSERT INTO tbl_mercado VALUES(1, 4, 3, 'Castelo');

INSERT INTO tbl_inventario VALUES(1, 20);

INSERT INTO tbl_instancia_Item (idInstanciaItem, idItem) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2),
(5, 3),
(6, 4),
(7, 5),
(8, 5),
(9, 6),
(10, 6),
(11, 7),
(12, 7),
(13, 8),
(14, 8),
(15, 9);

INSERT INTO tbl_instancia_inimigo (idInstanciaInimigo, idInimigo) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 2),
(5, 2),
(6, 2);

INSERT INTO tbl_instancia_aliado (idInstanciaAliado, idAliado) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 2),
(5, 2),
(6, 2);

INSERT INTO tbl_instancia_civil (idInstanciaCivil, idCivil) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 2),
(5, 2),
(6, 2);

