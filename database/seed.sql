INSERT INTO categories (name, code) VALUES
('Frutas', 2001),                    -- Categoria Primária
('Frutas Cítricas', 2002),           -- Categoria Secundária de 'Frutas'
('Frutas Tropicais', 2003),          -- Categoria Secundária de 'Frutas'
('Legumes e Verduras', 2004),        -- Categoria Primária
('Verduras Folhosas', 2005),         -- Categoria Secundária de 'Legumes e Verduras'
('Tubérculos', 2006),                -- Categoria Secundária de 'Legumes e Verduras'
('Laticínios', 2007),                -- Categoria Primária
('Leite', 2008),                     -- Categoria Secundária de 'Laticínios'
('Queijos', 2009),                   -- Categoria Secundária de 'Laticínios'
('Bebidas', 2010),                   -- Categoria Primária
('Refrigerantes', 2011),             -- Categoria Secundária de 'Bebidas'
('Sucos Naturais', 2012),            -- Categoria Secundária de 'Bebidas'
('Carnes', 2013),                    -- Categoria Primária
('Carnes Vermelhas', 2014),          -- Categoria Secundária de 'Carnes'
('Aves', 2015),                      -- Categoria Secundária de 'Carnes'
('Pescados', 2016),                  -- Categoria Primária
('Peixes', 2017),                    -- Categoria Secundária de 'Pescados'
('Frutos do Mar', 2018),             -- Categoria Secundária de 'Pescados'
('Padaria e Confeitaria', 2019),     -- Categoria Primária
('Pães', 2020),                      -- Categoria Secundária de 'Padaria e Confeitaria'
('Doces e Bolos', 2021),             -- Categoria Secundária de 'Padaria e Confeitaria'
('Grãos e Cereais', 2022),           -- Categoria Primária
('Arroz', 2023),                     -- Categoria Secundária de 'Grãos e Cereais'
('Feijão', 2024),                    -- Categoria Secundária de 'Grãos e Cereais'
('Petiscos', 2025);                  -- Categoria Primária

INSERT INTO products (name, ean, primary_id, secondary_id) VALUES
('Laranja', '7891001234567', 1, 2),
('Limão', '7891001234568', 1, 2),
('Banana', '7891001234569', 1, 3),
('Manga', '7891001234570', 1, 3),
('Maçã', '7891001234571', 1, NULL),
('Alface', '7891001234572', 4, 5),
('Couve', '7891001234573', 4, 5),
('Cenoura', '7891001234574', 4, 6),
('Batata', '7891001234575', 4, 6),
('Espinafre', '7891001234576', 4, 5),
('Leite Integral', '7891001234577', 7, 8),
('Leite Desnatado', '7891001234578', 7, 8),
('Queijo Mussarela', '7891001234579', 7, 9),
('Queijo Parmesão', '7891001234580', 7, 9),
('Refrigerante Cola', '7891001234581', 10, 11),
('Refrigerante Guaraná', '7891001234582', 10, 11),
('Suco de Laranja Natural', '7891001234583', 10, 12),
('Suco de Uva Integral', '7891001234584', 10, 12),
('Carne Bovina', '7891001234585', 13, 14),
('Frango Inteiro', '7891001234586', 13, 15),
('Peito de Frango', '7891001234587', 13, 15),
('Salmão', '7891001234588', 16, 17),
('Tilápia', '7891001234589', 16, 17),
('Camarão', '7891001234590', 16, 18),
('Pão de Forma', '7891001234591', 19, 20),
('Pão Francês', '7891001234592', 19, 20),
('Bolo de Chocolate', '7891001234593', 19, 21),
('Bolo de Laranja', '7891001234594', 19, 21),
('Arroz Branco', '7891001234595', 22, 23),
('Arroz Integral', '7891001234596', 22, 23),
('Feijão Preto', '7891001234597', 22, 24),
('Feijão Carioca', '7891001234598', 22, 24),
('Amendoim Torrado', '7891001234599', 25, NULL),
('Pipoca de Micro-ondas', '7891001234600', 25, NULL),
('Batata Chips', '7891001234601', 25, NULL),
('Tomate', '7891001234602', 4, NULL),
('Pepino', '7891001234603', 4, NULL),
('Cebola', '7891001234604', 4, NULL),
('Beterraba', '7891001234605', 4, 6),
('Abóbora', '7891001234606', 4, 6),
('Abacate', '7891001234607', 1, 3),
('Morango', '7891001234608', 1, NULL),
('Abacaxi', '7891001234609', 1, 3),
('Goiaba', '7891001234610', 1, 3),
('Melancia', '7891001234611', 1, 3),
('Queijo Coalho', '7891001234612', 7, 9),
('Iogurte Natural', '7891001234613', 7, NULL),
('Requeijão', '7891001234614', 7, 9),
('Sorvete de Chocolate', '7891001234615', 7, NULL),
('Sorvete de Baunilha', '7891001234616', 7, NULL),
('Biscoito de Polvilho', '7891001234617', 25, NULL),
('Bolacha de Água e Sal', '7891001234618', 25, NULL),
('Rosquinha Doce', '7891001234619', 25, NULL),
('Pão de Queijo', '7891001234620', 19, 20),
('Croissant', '7891001234621', 19, 20),
('Torrada Integral', '7891001234622', 19, 20),
('Granola', '7891001234623', 22, NULL),
('Cereal Matinal', '7891001234624', 22, NULL),
('Farinha de Trigo', '7891001234625', 22, NULL),
('Farinha de Mandioca', '7891001234626', 22, NULL),
('Canjica', '7891001234627', 22, NULL),
('Manteiga', '7891001234628', 7, NULL),
('Creme de Leite', '7891001234629', 7, NULL),
('Leite Condensado', '7891001234630', 7, NULL),
('Ervilha Congelada', '7891001234631', 4, NULL),
('Brócolis', '7891001234632', 4, NULL),
('Milho Verde', '7891001234633', 4, NULL),
('Palmito', '7891001234634', 4, NULL),
('Couve-flor', '7891001234635', 4, NULL),
('Açaí na Tigela', '7891001234636', 1, 3),
('Pêssego', '7891001234637', 1, NULL),
('Amêndoas', '7891001234638', 25, NULL),
('Castanha-do-Pará', '7891001234639', 25, NULL),
('Suco de Maracujá', '7891001234640', 10, 12),
('Água de Coco', '7891001234641', 10, 12),
('Cerveja Pilsen', '7891001234642', 10, NULL),
('Chá Verde', '7891001234643', 10, NULL),
('Coxinha de Frango', '7891001234644', 25, NULL),
('Kibe', '7891001234645', 25, NULL),
('Pudim de Leite', '7891001234646', 19, 21),
('Bolo de Fubá', '7891001234647', 19, 21),
('Mousse de Maracujá', '7891001234648', 19, 21),
('Torta de Limão', '7891001234649', 19, 21),
('Bolinho de Bacalhau', '7891001234650', 19, 21),
('Sopa de Legumes', '7891001234651', 4, NULL),
('Frango Desfiado', '7891001234652', 13, 15),
('Linguiça Calabresa', '7891001234653', 13, 14),
('Costela de Porco', '7891001234654', 13, 14),
('Hambúrguer de Soja', '7891001234655', 25, NULL),
('Batata Doce', '7891001234656', 4, 6),
('Tomate Cereja', '7891001234657', 4, NULL),
('Cenoura Baby', '7891001234658', 4, 6),
('Alho', '7891001234659', 4, NULL),
('Nabo', '7891001234660', 4, 6),
('Geléia de Morango', '7891001234661', 25, NULL),
('Feijão Branco', '7891001234662', 22, 24),
('Farofa Pronta', '7891001234663', 22, NULL),
('Biscoito Recheado', '7891001234664', 25, NULL),
('Molho de Tomate', '7891001234665', 4, NULL),
('Biscoito Integral', '7891001234666', 25, NULL),
('Queijo Provolone', '7891001234667', 7, 9),
('Iogurte Grego', '7891001234668', 7, NULL),
('Sardinha', '7891001234669', 16, 17),
('Polvo', '7891001234670', 16, 18),
('Lula', '7891001234671', 16, 18),
('Bolacha Recheada', '7891001234672', 25, NULL),
('Pão Sírio', '7891001234673', 19, 20),
('Café Solúvel', '7891001234674', 10, NULL),
('Aveia em Flocos', '7891001234675', 22, NULL),
('Pipoca Doce', '7891001234676', 25, NULL),
('Sopa de Feijão', '7891001234677', 4, NULL),
('Suco de Caju', '7891001234678', 10, 12),
('Suco de Manga', '7891001234679', 10, 12),
('Frango à Passarinho', '7891001234680', 13, 15),
('Empanado de Frango', '7891001234681', 13, 15),
('Queijo Minas', '7891001234682', 7, 9),
('Mel', '7891001234683', 25, NULL),
('Torrada com Ervas', '7891001234684', 19, 20),
('Pão de Batata', '7891001234685', 19, 20),
('Biscoito Maisena', '7891001234686', 25, NULL),
('Cereal de Milho', '7891001234687', 22, NULL),
('Barra de Cereal', '7891001234688', 25, NULL),
('Chips de Banana', '7891001234689', 25, NULL),
('Frango Empanado', '7891001234690', 13, 15),
('Caldo de Galinha', '7891001234691', 4, NULL),
('Queijo Prato', '7891001234692', 7, 9),
('Feijão Verde', '7891001234693', 22, 24),
('Iogurte de Morango', '7891001234694', 7, NULL),
('Granola com Mel', '7891001234695', 22, NULL),
('Macarrão Integral', '7891001234696', 22, NULL),
('Tapioca', '7891001234697', 22, NULL),
('Farinha de Rosca', '7891001234698', 22, NULL),
('Coxinha de Charque', '7891001234699', 25, NULL),
('Sopa Instantânea', '7891001234700', 4, NULL);

INSERT INTO locations (latitude, longitude) VALUES
(-23.550520, -46.633308),
(-22.906847, -43.172896),
(-15.826691, -47.921820),
(-19.924502, -43.935238),
(-12.971399, -38.501305),
(-8.047562, -34.877545),
(-3.717220, -38.543370),
(-25.429596, -49.271272),
(-30.034647, -51.217658),
(-1.455020, -48.502372),
(-16.686882, -49.264788),
(-22.909938, -47.062633),
(-21.177500, -47.810280),
(-27.594870, -48.548220),
(-20.469711, -54.620121),
(-2.530730, -44.306800),
(-3.119028, -60.021731),
(-10.947246, -37.073082),
(-6.888463, -38.556948),
(-14.235004, -51.925282);


INSERT INTO suppliers (cnpj, code, location_id, address, state, city) VALUES
('12345678000100', 3001, 1, 'Avenida Paulista, 1000', 'SP', '3550308'),
('98765432000199', 3002, 3, 'Quadra 1, Bloco A', 'DF', '5300108'),
('45678912000188', 3003, 5, 'Rua das Flores, 300', 'BA', '2927408'),
('32165498000177', 3004, 7, 'Avenida Beira Mar, 1500', 'CE', '2304400'),
('65498721000166', 3005, 2, 'Rua dos Artistas, 123', 'RJ', '3304557'),
('15975346000155', 3006, 10, 'Praça da Sé, 50', 'PA', '1501402'),
('95175348000144', 3007, 12, 'Rua Campos Elíseos, 450', 'SP', '3509502'),
('75395126000133', 3008, 15, 'Rua Bonito, 890', 'MS', '5002704'),
('85245678000122', 3009, 17, 'Rua Manaus, 200', 'AM', '1302603'),
('74125896000111', 3010, 20, 'Rua Central, 900', 'BR', '5208707');


-- Seeding para a tabela de places com os códigos IBGE substituídos no lugar do nome da cidade
INSERT INTO places (name, location_id, cnpj, address, state, city) VALUES
('Loja Centro SP', 1, '12345678000100', 'Avenida Paulista, 1000', 'SP', '3550308'),
('Loja Norte RJ', 2, '22345678000100', 'Rua das Flores, 200', 'RJ', '3304557'),
('Loja Sul BA', 5, '32345678000100', 'Rua da Bahia, 150', 'BA', '2927408'),
('Loja Leste DF', 3, '42345678000100', 'Quadra 2, Bloco B', 'DF', '5300108'),
('Loja Oeste CE', 7, '52345678000100', 'Rua Beira Mar, 1500', 'CE', '2304400'),
('Loja Central PA', 10, '62345678000100', 'Praça da Sé, 100', 'PA', '1501402'),
('Loja Zona Sul AM', 17, '72345678000100', 'Rua Manaus, 500', 'AM', '1302603'),
('Loja Zona Oeste MG', 4, '82345678000100', 'Avenida Afonso Pena, 600', 'MG', '3106200'),
('Loja Zona Norte PR', 8, '92345678000100', 'Rua das Oliveiras, 300', 'PR', '4106902'),
('Loja Nordeste PE', 6, '102345678000100', 'Rua Recife, 250', 'PE', '2611606'),
('Galpão Centro SP', 1, '112345678000100', 'Rua dos Galpões, 50', 'SP', '3550308'),
('Galpão Industrial RJ', 2, '122345678000100', 'Avenida Industrial, 900', 'RJ', '3304557'),
('Galpão Norte BA', 5, '132345678000100', 'Rua dos Comerciantes, 80', 'BA', '2927408'),
('Galpão Leste DF', 3, '142345678000100', 'Área de Carga, 300', 'DF', '5300108'),
('Galpão Oeste CE', 7, '152345678000100', 'Rua do Porto, 1200', 'CE', '2304400'),
('Galpão Central PA', 10, '162345678000100', 'Rodovia Belém, 45', 'PA', '1501402'),
('Galpão Zona Norte AM', 17, '172345678000100', 'Avenida Amazônia, 1000', 'AM', '1302603'),
('Galpão Zona Sul MG', 4, '182345678000100', 'Rua do Comércio, 700', 'MG', '3106200'),
('Galpão Zona Oeste PR', 8, '192345678000100', 'Rua Industrial, 400', 'PR', '4106902'),
('Galpão Nordeste PE', 6, '202345678000100', 'Avenida Recife, 750', 'PE', '2611606');


INSERT INTO purchase_orders (supplier_id, product_id, sold_at, expired_at, quantity, price_by_unit) VALUES
(1, 1, '2023-10-01 10:00:00', '2024-01-01 10:00:00', 100, 15),
(1, 5, '2023-10-05 12:00:00', '2024-01-15 12:00:00', 150, 8),
(1, 12, '2023-09-20 08:30:00', '2024-02-20 08:30:00', 50, 20),
(1, 25, '2023-09-25 15:00:00', '2024-03-01 15:00:00', 200, 5),
(1, 45, '2023-08-15 11:00:00', '2024-02-15 11:00:00', 120, 12),
(2, 7, '2023-07-14 09:00:00', '2024-01-14 09:00:00', 90, 25),
(2, 16, '2023-08-20 13:00:00', '2024-01-20 13:00:00', 130, 10),
(2, 35, '2023-09-01 14:00:00', '2024-02-01 14:00:00', 75, 15),
(2, 50, '2023-10-12 16:00:00', '2024-03-12 16:00:00', 180, 18),
(3, 9, '2023-06-10 11:00:00', '2024-01-10 11:00:00', 40, 22),
(3, 22, '2023-07-05 10:30:00', '2024-01-05 10:30:00', 110, 6),
(3, 47, '2023-08-25 12:00:00', '2024-01-25 12:00:00', 150, 17),
(3, 66, '2023-09-15 09:00:00', '2024-02-15 09:00:00', 90, 13),
(3, 89, '2023-10-01 14:30:00', '2024-03-01 14:30:00', 60, 9),
(4, 4, '2023-05-10 08:00:00', '2024-01-10 08:00:00', 130, 14),
(4, 18, '2023-06-20 10:00:00', '2024-01-20 10:00:00', 70, 11),
(4, 37, '2023-07-15 15:00:00', '2024-01-15 15:00:00', 150, 19),
(4, 56, '2023-08-01 11:00:00', '2024-01-01 11:00:00', 80, 16),
(5, 13, '2023-04-20 13:30:00', '2024-01-20 13:30:00', 90, 23),
(5, 29, '2023-05-25 14:30:00', '2024-02-25 14:30:00', 60, 10),
(5, 55, '2023-06-15 09:45:00', '2024-02-15 09:45:00', 120, 12),
(5, 99, '2023-07-10 12:00:00', '2024-03-10 12:00:00', 200, 5),
(6, 15, '2023-03-01 08:30:00', '2024-01-01 08:30:00', 110, 21),
(6, 48, '2023-04-14 10:30:00', '2024-02-14 10:30:00', 140, 18),
(6, 70, '2023-06-18 14:15:00', '2024-02-18 14:15:00', 50, 20),
(6, 98, '2023-08-11 13:00:00', '2024-03-11 13:00:00', 180, 15),
(7, 3, '2023-05-05 11:00:00', '2024-01-05 11:00:00', 75, 19),
(7, 31, '2023-06-25 09:30:00', '2024-02-25 09:30:00', 95, 14),
(7, 60, '2023-07-14 15:45:00', '2024-03-14 15:45:00', 170, 13),
(7, 123, '2023-09-01 10:30:00', '2024-04-01 10:30:00', 40, 22),
(8, 6, '2023-04-01 09:15:00', '2024-01-01 09:15:00', 120, 11),
(8, 26, '2023-06-10 11:45:00', '2024-02-10 11:45:00', 85, 17),
(8, 88, '2023-08-22 16:30:00', '2024-03-22 16:30:00', 130, 9),
(8, 96, '2023-09-12 12:15:00', '2024-04-12 12:15:00', 55, 18),
(9, 11, '2023-02-20 08:45:00', '2024-01-20 08:45:00', 145, 16),
(9, 42, '2023-04-30 14:30:00', '2024-02-28 14:30:00', 70, 21),
(9, 78, '2023-07-19 12:00:00', '2024-03-19 12:00:00', 95, 25),
(9, 100, '2023-09-03 13:20:00', '2024-04-03 13:20:00', 60, 8),
(10, 20, '2023-01-15 10:45:00', '2024-01-15 10:45:00', 100, 19),
(10, 58, '2023-03-08 09:00:00', '2024-02-08 09:00:00', 130, 12),
(10, 91, '2023-05-18 15:30:00', '2024-03-18 15:30:00', 200, 10),
(10, 99, '2023-08-24 14:00:00', '2024-04-24 14:00:00', 150, 24),
(10, 65, '2023-10-05 11:00:00', '2024-05-05 11:00:00', 110, 14);


-- Seeding para a tabela de employees com até 20 registros
INSERT INTO employees (name, cpf, role) VALUES
('Rodrigo Batista', '435.678.901-24', 'Encarregado de Expedição'),
('Patrícia Ramos', '546.789.012-35', 'Auxiliar de Limpeza'),
('Gabriel Ferreira', '657.890.123-46', 'Assistente de Logística'),
('Letícia Teixeira', '768.901.234-57', 'Vendedor Externo'),
('André Coelho', '879.012.345-68', 'Analista de Estoque'),
('Laura Machado', '980.123.456-79', 'Recepcionista'),
('Marcelo Farias', '091.234.567-80', 'Gerente Regional');

INSERT INTO configurations (place_id, product_id, min_quantity, max_quantity) VALUES
(1, 1, 50, 150),
(1, 5, 20, 100),
(1, 12, 30, 200),
(1, 25, 15, 120),
(1, 45, 10, 150),
(2, 7, 40, 180),
(2, 16, 20, 90),
(2, 35, 15, 100),
(2, 50, 25, 130),
(2, 3, 30, 200),
(3, 9, 25, 80),
(3, 22, 20, 70),
(3, 47, 30, 150),
(3, 66, 40, 200),
(3, 89, 10, 100),
(4, 4, 20, 120),
(4, 18, 15, 90),
(4, 37, 30, 180),
(4, 56, 10, 130),
(4, 11, 25, 150),
(5, 13, 50, 200),
(5, 29, 30, 100),
(5, 55, 20, 120),
(5, 99, 10, 80),
(5, 7, 15, 150),
(6, 15, 25, 110),
(6, 48, 30, 140),
(6, 70, 20, 100),
(6, 99, 15, 150),
(6, 89, 10, 50),
(7, 3, 40, 180),
(7, 31, 20, 120),
(7, 60, 25, 130),
(7, 98, 15, 90),
(7, 50, 30, 200),
(8, 6, 20, 100),
(8, 26, 15, 90),
(8, 88, 25, 120),
(8, 100, 30, 150),
(8, 5, 40, 180),
(9, 11, 10, 100),
(9, 42, 15, 120),
(9, 78, 20, 150),
(9, 97, 30, 200),
(9, 22, 40, 130),
(10, 20, 50, 200),
(10, 58, 30, 130),
(10, 91, 15, 90),
(10, 96, 10, 80),
(10, 1, 25, 150),
(11, 13, 20, 110),
(11, 29, 30, 150),
(11, 55, 15, 120),
(11, 99, 10, 100),
(11, 70, 40, 170),
(12, 3, 20, 130),
(12, 31, 25, 150),
(12, 60, 15, 120),
(12, 123, 30, 200),
(12, 88, 10, 80),
(13, 6, 15, 100),
(13, 26, 20, 110),
(13, 88, 30, 160),
(13, 95, 40, 200),
(13, 94, 25, 130),
(14, 11, 10, 150),
(14, 42, 20, 120),
(14, 78, 30, 180),
(14, 93, 15, 90),
(14, 1, 40, 170),
(15, 20, 25, 140),
(15, 58, 10, 100),
(15, 91, 15, 130),
(15, 92, 20, 110),
(15, 3, 30, 150),
(16, 15, 40, 180),
(16, 48, 20, 130),
(16, 70, 10, 80),
(16, 91, 25, 150),
(16, 90, 30, 200),
(17, 13, 20, 100),
(17, 29, 15, 120),
(17, 55, 30, 180),
(17, 99, 10, 90),
(17, 6, 40, 170),
(18, 3, 25, 130),
(18, 31, 15, 110),
(18, 60, 20, 150),
(18, 89, 30, 200),
(18, 88, 10, 80),
(19, 6, 15, 90),
(19, 26, 20, 100),
(19, 88, 40, 180),
(19, 87, 25, 150),
(19, 86, 30, 200),
(20, 11, 10, 100),
(20, 42, 15, 130),
(20, 78, 20, 140),
(20, 85, 30, 180),
(20, 91, 25, 120);


DO $$
DECLARE
    order_id INTEGER;
    order_quantity INTEGER;
    current_quantity INTEGER;
    item_code VARCHAR(255);
    item_status INTEGER;
    items_to_generate INTEGER;
BEGIN
    FOR order_id, order_quantity IN
        SELECT id, quantity
        FROM purchase_orders
    LOOP
        -- Calcula a quantidade de itens a serem gerados, subtraindo um valor aleatório de 0 até quantity/2
        items_to_generate := order_quantity - CAST(FLOOR(RANDOM() * (order_quantity / 2 + 1)) AS INTEGER);
        
        current_quantity := 0;
        WHILE current_quantity < items_to_generate LOOP
            item_code := 'RFID-' || order_id || '-' || current_quantity;
            item_status := CAST(FLOOR(RANDOM() * 2) AS INTEGER);  -- Gera aleatoriamente 0 ou 1
            INSERT INTO items (code_rfid, purchase_order_id, status)
            VALUES (item_code, order_id, item_status);
            current_quantity := current_quantity + 1;
        END LOOP;
    END LOOP;
END $$;


DO $$
DECLARE
    item_id INTEGER;
    num_transactions INTEGER;
    current_transaction INTEGER;
    random_place_id INTEGER;
    random_employee_id INTEGER;
BEGIN
    FOR item_id IN
        SELECT id
        FROM items
    LOOP
        -- Define o número de transações aleatórias para o item (entre 1 e 5)
        num_transactions := 1 + CAST(FLOOR(RANDOM() * 5) AS INTEGER);

        current_transaction := 0;
        WHILE current_transaction < num_transactions LOOP
            -- Seleciona um place_id aleatório entre 1 e 20 (ajuste conforme a quantidade de registros em places)
            random_place_id := 1 + CAST(FLOOR(RANDOM() * 20) AS INTEGER);
            
            -- Seleciona um employee_id aleatório entre 1 e 100 (ajuste conforme a quantidade de funcionários existentes)
            random_employee_id := 1 + CAST(FLOOR(RANDOM() * (SELECT COUNT(*) FROM employees)) AS INTEGER);

            INSERT INTO transactions (item_id, place_id, employee_id, executed_at)
            VALUES (item_id, random_place_id, random_employee_id, NOW() - (INTERVAL '1 day' * CAST(FLOOR(RANDOM() * 365) AS INTEGER)));

            current_transaction := current_transaction + 1;
        END LOOP;
    END LOOP;
END $$;