INSERT INTO tbl_heroi  VALUES(1, Alexios, 4, 150, 3, 0, 50, 9, 5, 1, 5, 5, 'Vila');

INSERT INTO tbl_civil (id, nomeCompleto, coordenada_x, coordenada_y, area) VALUES
(2, 'Eduardo Gurgel', 1, 1, 'Vila'),
(3, 'Arthur Sousa', 1, 2, 'Vila');

INSERT INTO tbl_inimigo (id, nomeCompleto, tamanho, raca, velocidade, vida, ataque, coordenada_x, coordenada_y, area) VALUES 
(4, 'Vinicius Silva', 3, 'Warrior', 2, 100, 15, 2, 1, 'Castelo'),
(5, 'Wesley Santos', 2, 'Warrior', 3, 80, 12, 2, 2, 'Castelo');

INSERTO INTO tbl_aliado(id, nomeCompleto, tamanho, velocidade, vida, ataque, coordenada_x, coordenada_y, area) VALUES
(6, 'Mauricio', 3, 3, 100, 15, 3, 1, 'Castelo'),
(7, 'Maria', 1, 4, 90, 15, 3, 2, 'Vila');

INSERT INTO tbl_heroi_ajuda_aliado VALUES(2, 1);

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

INSERT INTO tbl_utilitario (idUtilitario, descricao, valor, efeito, categoria, localidade) VALUES
(1, 'Remedio', 5, '+20 de vida', 'R', 'S'),
(2, 'Flor do campo', 1, '+5 de vida', 'R', 'M'),
(3, 'Bomba de fumaça', 10, 'Lança uma cortina de fumaça', 'S', 'E'),
(4, 'Bomba de veneno', 10, '-10 de vida', 'P', 'E'),
(14, 'Minério da força', 15, '+20 de força por 1 minuto', 'F', 'M');

INSERT INTO tbl_arma (idArma, descricao, valor, dano, categoria, localidade) VALUES
(5, 'Espada romana', 50, 25, 'S', 'E'),
(6, 'Machado', 65, 40, 'A', 'M'),
(7, 'Arco', 50, 15, 'B', 'E'),
(8, 'Lança', 55, 40, 'L', 'M'),
(10, 'Peixeira', 25, 20, 'S', 'S'),
(12, 'Lamina de assassino', 70, 25, 'S', 'I');

INSERT INTO tbl_armadura (idArmadura, descricao, valor, defesa, localidade) VALUES
(9, 'Armadura de assassino', 80, 45, 'I'),
(11, 'Armadura de couro', 30, 25, 'S'),
(13, 'Armadura ancestral', 150, 80, 'M');


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
(15, 9),
(16, 10),
(17, 10),
(18, 11),
(19, 11),
(20, 13),
(21, 14),
(22, 14),
(23, 14);


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

INSERT INTO tbl_mercado_possui_item (id_mercado, id_instancia) VALUES
(1, 1),
(1, 2),
(1, 16),
(1, 17),
(1, 18),
(1, 19);

INSERT INTO tbl_inventario_armazena_item (idInventario, idInstancia) VALUES
(1, 12),
(1, 9);

INSERT INTO tbl_inimigo_possui_utilitario (idUtilitario, idInstanciaInimigo) VALUES
(5, 1),
(7, 2),
(8, 3),
(11, 4),
(12, 5);

INSERT INTO tbl_tipo_personagem (id_tipo_personagem, tipoPersonagem) VALUES
(2, 'C'),
(3, 'C'),
(4, 'E'),
(5, 'E'),
(6, 'A'),
(7, 'A');

INSERT INTO tbl_quadrado_localiza_item (id_instancia, coordenada_x, coordenada_y, area) VALUES
(3, 4, 5, 'Floresta'),
(4, 3, 3, 'Floresta'),
(9, 2, 4, 'Castelo'),
(10, 3, 2, 'Vila'),
(13, 2, 5, 'Castelo'),
(14, 3, 3, 'Vila'),
(20, 2, 5, 'Floresta'),
(21, 2, 4, 'Floresta'),
(22, 2, 4, 'Castelo'),
(23, 1, 2, 'Vila');

INSERT INTO tbl_area (nome, tamanho_x, tamanho_y, descricao, bioma, clima) VALUES
('Castelo', 5, 4, 'Uma área repleta de perigosos soldados da realeza', 'Taiga', 'Frio'),
('Vila', 3, 6, 'A vila onde existem vários civis, mas cuidado, também há ladrões e rebeldes', 'Campo', 'Tropical'),
('Floresta', 5, 5, 'Uma floresta com altas árvores e alguns itens raros', 'Floresta tropical', 'Quente');

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
(20, 5, 4, 'Castelo', 1),
(21, 1, 1, 'Vila', 1),
(22, 1, 2, 'Vila', 1),
(23, 1, 3, 'Vila', 1),
(24, 1, 4, 'Vila', 1),
(25, 1, 5, 'Vila', 1),
(26, 1, 6, 'Vila', 1),
(27, 2, 1, 'Vila', 2),
(28, 2, 2, 'Vila', 2),
(29, 2, 3, 'Vila', 2),
(30, 2, 4, 'Vila', 1),
(31, 2, 5, 'Vila', 1),
(31, 2, 6, 'Vila', 1),
(33, 3, 1, 'Vila', 3),
(34, 3, 2, 'Vila', 3),
(35, 3, 3, 'Vila', 3),
(36, 3, 4, 'Vila', 1),
(37, 3, 5, 'Vila', 1),
(38, 3, 6, 'Vila', 1),
(39, 1, 1, 'Floresta', 3),
(40, 2, 1, 'Floresta', 3),
(41, 3, 1, 'Floresta', 3),
(42, 4, 1, 'Floresta', 3),
(43, 5, 1, 'Floresta', 3),
(44, 1, 2, 'Floresta', 1),
(45, 2, 2, 'Floresta', 1),
(46, 3, 2, 'Floresta', 1),
(47, 4, 2, 'Floresta', 1),
(48, 5, 2, 'Floresta', 1),
(49, 1, 3, 'Floresta', 1),
(50, 2, 3, 'Floresta', 1),
(51, 3, 3, 'Floresta', 1),
(52, 4, 3, 'Floresta', 2),
(53, 5, 3, 'Floresta', 2),
(54, 1, 4, 'Floresta', 1),
(55, 2, 4, 'Floresta', 1),
(56, 3, 4, 'Floresta', 1),
(57, 4, 4, 'Floresta', 2),
(58, 5, 4, 'Floresta', 2),
(59, 1, 5, 'Floresta', 1),
(60, 2, 5, 'Floresta', 1),
(61, 3, 5, 'Floresta', 1),
(62, 4, 5, 'Floresta', 2),
(63, 5, 5, 'Floresta', 2);
