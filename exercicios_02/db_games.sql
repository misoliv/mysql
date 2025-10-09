 -- Criação do Banco de Dados Games Online
CREATE DATABASE db_generation_game_online;
USE db_generation_game_online;

-- Criação da Tabela Classes
CREATE TABLE tb_classes (
id_classe INT AUTO_INCREMENT PRIMARY KEY,
nome_classe VARCHAR(50) NOT NULL,  -- Nome da classe (arcano)
elemento VARCHAR(30),              -- Luz, Sombras, Terra, Fogo, Água
magia VARCHAR(50),                 -- Tipo de magia
arma VARCHAR(50)                   -- Arma que utiliza
);

-- Inserção dos dados da Tabela de Classes
INSERT INTO tb_classes (nome_classe, elemento, magia, arma) VALUES
('A Sacerdotisa', 'Luz', 'Sabedoria', 'Cajado de Cristal'),
('A Imperatriz', 'Terra', 'Cura', 'Cetro Dourado'),
('A Estrela', 'Água', 'Esperança', 'Orbe Celestial'),
('A Lua', 'Sombras', 'Ilusão', 'Adaga Lunar'),
('A Morte', 'Fogo', 'Transformação', 'Foice Carmesim');

-- Criação da Tabela Personagens
CREATE TABLE tb_personagens (
id_personagem INT AUTO_INCREMENT PRIMARY KEY,
nome_personagem VARCHAR(50) NOT NULL,
poder_ataque INT,
poder_defesa INT,
raridade VARCHAR(20),
historia TEXT,
id_classe INT,
FOREIGN KEY (id_classe) REFERENCES tb_classes(id_classe)
);

-- Inserção dos dados da Tabela de Personagens
INSERT INTO tb_personagens (nome_personagem, poder_ataque, poder_defesa, raridade, historia, id_classe) VALUES
('Selena', 2100, 1700, 'Épica', 'Sacerdotisa que domina os véus do destino e guarda os segredos da luz.', 1),  -- A Sacerdotisa
('Aurora', 1980, 2200, 'Rara', 'Imperatriz que comanda as forças da natureza e traz abundância à terra.', 2),  -- A Imperatriz
('Lyra', 2500, 1600, 'Lendária', 'Estrela caída que ilumina os corações dos justos e guia viajantes perdidos.', 3),  -- A Estrela
('Noctia', 2750, 1400, 'Épica', 'Maga da Lua que manipula sonhos e ilusões, tecendo véus de mistério.', 4),  -- A Lua
('Lilith', 3200, 1250, 'Lendária', 'Espírito da Morte que renasce das cinzas e purifica o mundo com fogo.', 5),  -- A Morte
('Elyra', 1800, 1900, 'Rara', 'Aprendiz da Sacerdotisa, dedicada à busca da sabedoria interior.', 1),  -- A Sacerdotisa
('Seraphine', 2450, 1750, 'Épica', 'Curandeira da Estrela, portadora da esperança e das águas da vida.', 3),  -- A Estrela
('Kaira', 3100, 1350, 'Lendária', 'Guardiã dos portais lunares, mensageira entre mundos e sonhos.', 4);  -- A Lua

-- -- Consultar Tabelas
SELECT * FROM tb_classes;
SELECT * FROM tb_personagens;

-- Personagens com poder de ataque acima de 2000
SELECT nome_personagem, poder_ataque FROM tb_personagens WHERE poder_ataque > 2000;

-- Personagens com poder de defesa entre 1000 e 2000
SELECT nome_personagem, poder_defesa FROM tb_personagens WHERE poder_defesa BETWEEN 1000 AND 2000;

-- Busca por nomes de personagens que contenham a letra 'C'
SELECT * FROM tb_personagens WHERE nome_personagem LIKE '%C%';

-- Busca por nomes de personagens que contenham o final do nome com a letra 'A'
SELECT * FROM tb_personagens WHERE nome_personagem LIKE '%A';

-- Busca por nomes de personagens que contenham o início do nome com a letra 'S'
SELECT * FROM tb_personagens WHERE nome_personagem LIKE 'S%';

-- União das tabelas Classes e Personagens
SELECT p.id_personagem, p.nome_personagem, p.poder_ataque, p.poder_defesa, p.raridade, p.historia, c.id_classe, c.nome_classe, c.elemento, c.magia, c.arma
FROM tb_personagens p INNER JOIN tb_classes c ON p.id_classe = c.id_classe;

-- União das tabelas com os personagens da classe de elementos sombras
SELECT p.id_personagem, p.nome_personagem, p.poder_ataque, p.poder_defesa, p.raridade, p.historia, c.id_classe, c.nome_classe, c.elemento, c.magia, c.arma
FROM tb_personagens p INNER JOIN tb_classes c ON p.id_classe = c.id_classe WHERE c.elemento = 'Sombras';





