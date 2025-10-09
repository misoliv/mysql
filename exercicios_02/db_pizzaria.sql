-- Criação do Banco de Dados Pizzaria
CREATE DATABASE db_pizzaria_legal;
USE db_pizzaria_legal;

-- Criação da Tabela Categorias
CREATE TABLE tb_categorias (
id_categoria INT AUTO_INCREMENT PRIMARY KEY,
nome_categoria VARCHAR(50) NOT NULL,   -- Tradicional, Gourmet, Vegana, Doce
tipo_massa VARCHAR(30),                -- Fina, Grossa, Integral
destaque BOOLEAN,               -- 1 = Pizza do dia, 0 = Não
borda BOOLEAN,                  -- 1 = Sim, 0 = Não
ranking INT                            -- Ranking de popularidade
);

-- Inserção dos dados da Tabela Categorias
INSERT INTO tb_categorias (nome_categoria, tipo_massa, destaque, borda, ranking) VALUES
('Tradicional', 'Fina', 0, 1, 90),
('Gourmet', 'Fina', 1, 1, 85),
('Vegana', 'Integral', 0, 0, 75),
('Doce', 'Fina', 1, 0, 80),
('Premium', 'Grossa', 0, 1, 70),
('Especial da Casa', 'Fina', 1, 1, 95),
('Italiana', 'Grossa', 0, 1, 88),
('Light', 'Integral', 0, 0, 60);

-- Inserção dos dados da Tabela Pizzas
CREATE TABLE tb_pizzas (
id_pizza INT AUTO_INCREMENT PRIMARY KEY,
nome_pizza VARCHAR(50) NOT NULL,
tamanho VARCHAR(20),          
sabor_principal VARCHAR(30),    
ingredientes TEXT,             
preco DECIMAL(8,2),           
id_categoria INT,
FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria)
);

-- Inserção dos dados da Tabela Pizzas
INSERT INTO tb_pizzas (nome_pizza, tamanho, sabor_principal, ingredientes, preco, id_categoria) VALUES
('Calabresa Clássica', 'Grande', 'Calabresa', 'Calabresa, cebola, queijo', 50.00, 1),
('Frango com Catupiry', 'Média', 'Frango', 'Frango, Catupiry, milho, queijo', 48.00, 1),
('Marguerita Gourmet', 'Grande', 'Queijo', 'Queijo de búfala, tomate fresco, manjericão', 60.00, 2),
('Vegana Mediterrânea', 'Média', 'Vegetais', 'Tomate seco, abobrinha, berinjela, cebola roxa', 55.00, 3),
('Chocolate Supremo', 'Média', 'Chocolate', 'Chocolate, morango, leite condensado', 58.00, 4),
('Trufada de Parma', 'Grande', 'Presunto Parma', 'Presunto Parma, rúcula, queijo brie, azeite trufado', 85.00, 2),
('Especial do Chef', 'Família', 'Mix de Sabores', 'Calabresa, frango, bacon, queijo, tomate', 95.00, 6),
('Italiana Tradizionale', 'Grande', 'Mussarela', 'Molho de tomate, mussarela, orégano e manjericão', 52.00, 7),
('Light de Ricota', 'Média', 'Ricota', 'Ricota, espinafre, tomate, azeite', 42.00, 8),
('Doce de Nutella', 'Média', 'Nutella', 'Nutella, morango e leite ninho', 65.00, 4);

-- -- Consultar Tabelas
SELECT * FROM tb_categorias;
SELECT * FROM tb_pizzas;

-- Pizzas cujo valor seja maior do que R$ 45,00
SELECT * FROM tb_pizzas WHERE preco > 45.00;

-- Pizzas cujo valor seja no intervalor entre R$50,00 e R$100,00
SELECT * FROM tb_pizzas WHERE preco BETWEEN 50 AND 100;

-- Busca por nomes de pizzas que contenham a letra 'M'
SELECT * FROM tb_pizzas WHERE nome_pizza LIKE '%M%';

-- Busca por nomes de pizzas que contenham o final do nome com a letra 'A'
SELECT * FROM tb_pizzas WHERE nome_pizza LIKE '%A';

-- Mostrar apenas as pizzas que tem queijo como ingrediente
SELECT * FROM tb_pizzas WHERE ingredientes LIKE '%queijo%';

-- União das tabelas Categorias e Pizzas
SELECT p.id_pizza, p.nome_pizza, p.tamanho, p.sabor_principal, p.ingredientes, p.preco, c.id_categoria, c.nome_categoria, c.tipo_massa, c.destaque, c.borda, c.ranking
FROM tb_pizzas p INNER JOIN tb_categorias c ON p.id_categoria = c.id_categoria;

-- União das tabelas Categorias e Pizzas trazendo a categoria doce
SELECT p.id_pizza, p.nome_pizza, p.tamanho, p.sabor_principal, p.ingredientes, p.preco, c.id_categoria, c.nome_categoria, c.tipo_massa, c.destaque, c.borda, c.ranking
FROM tb_pizzas p INNER JOIN tb_categorias c ON p.id_categoria = c.id_categoria WHERE c.nome_categoria = 'Doce';

-- Atualizar valor da pizza de Calabreza
UPDATE tb_pizzas SET preco = 60.00 WHERE id_pizza = 1;

-- Deletar a pizza Trufada de Parma da tabela
DELETE FROM tb_pizzas WHERE id_pizza = 6;

-- Para deletar pelo nome da pizza é preciso usar o Safe Update Mode antes 
SET SQL_SAFE_UPDATES = 0;

DELETE FROM tb_pizzas WHERE nome_pizza = 'Light de Ricota';
