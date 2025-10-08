-- Criação do Banco de Dados E-commerce
CREATE DATABASE db_ecommerce;
SHOW DATABASES;

USE db_ecommerce;

-- Criação da Tabela Produtos
CREATE TABLE tb_produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    marca VARCHAR(50),
    categoria VARCHAR(50),
    preco DECIMAL(10,2),
    estoque INT,
    descricao VARCHAR(255),
    cor VARCHAR(50),
    peso VARCHAR(20),
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    avaliacao DECIMAL(2,1)
) ENGINE=InnoDB;

-- Inserir Produtos
INSERT INTO tb_produtos (nome, marca, categoria, preco, estoque, descricao, cor, peso, avaliacao)
VALUES 
('Batom Matte', 'Vult', 'Batom', 29.90, 30, 'Batom matte de longa duração', 'Vermelho', '3g', 4.5),
('Base Líquida', 'Maybelline', 'Base', 49.90, 50, 'Base líquida para todos os tipos de pele', 'Bege Médio', '30ml', 4.7),
('Máscara de Cílios', 'Rimmel', 'Cílios', 39.90, 20, 'Máscara para cílios volumosos', 'Preto', '10ml', 4.3),
('Blush Compacto', 'Dailus', 'Blush', 25.90, 35, 'Blush compacto com pigmentação intensa', 'Rosado', '5g', 4.6),
('Paleta de Sombras', 'Ruby Rose', 'Olhos', 59.90, 40, 'Paleta com 12 cores vibrantes', 'Sortido', '15g', 4.8),
('Delineador Líquido', 'Natura', 'Olhos', 34.90, 35, 'Delineador de ponta fina', 'Preto', '2ml', 4.4),
('Corretivo Líquido', 'L\'Oréal', 'Rosto', 44.90, 20, 'Corretivo de alta cobertura', 'Bege Claro', '10ml', 4.6),
('Pó Compacto', 'Vult', 'Rosto', 29.90, 40, 'Pó compacto para acabamento matte', 'Transparente', '8g', 4.5),
('Iluminador em Pó', 'Dailus', 'Rosto', 39.90, 28, 'Iluminador que deixa a pele radiante', 'Champanhe', '7g', 4.7),
('Lip Gloss', 'Boticário', 'Batom', 24.90, 34, 'Gloss hidratante e brilhoso', 'Rosa', '4g', 4.2);

-- Consultar Tabela Produtos
SELECT * FROM tb_produtos;

-- Selecionar produtos com preço maior do que R$20,00
SELECT * FROM tb_produtos WHERE preco > 20;

-- Selecionar produtos com preço menor do que R$20,00
SELECT * FROM tb_produtos WHERE preco < 20;

-- Selecionar produtos com preço entre R$20,00 e R$50,00
SELECT * FROM tb_produtos WHERE preco BETWEEN 20 AND 50;

-- Selecionar todos os produtos de cor vermelha
SELECT * FROM tb_produtos WHERE cor = 'Vermelho';

-- Desabilitar o Safe Update Mode
SET SQL_SAFE_UPDATES = 0;

-- Atualizar o preço de um produto
UPDATE tb_produtos SET preco = 34.90 WHERE nome = 'Batom Matte';

-- Atualizar o estoque de um produto
UPDATE tb_produtos SET estoque = 30 WHERE nome = 'Base Líquida';

-- Atualizar a avaliação de um produto
UPDATE tb_produtos SET preco = 27.90, avaliacao = 4.8 WHERE nome = 'Blush Compacto';

-- Verificar registros atualizados
SELECT * FROM tb_produtos WHERE preco IN (34.90, 27.90) OR estoque = 30 OR avaliacao = 4.8;






