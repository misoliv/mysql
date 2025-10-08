-- Criação do Banco de Dados RH
CREATE DATABASE db_rh;
USE db_rh;

-- Criação da Tabela Departamentos
CREATE TABLE tb_departamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

-- Inserir dados na Tabela Departamentos
INSERT INTO tb_departamentos (nome) VALUES
('Recursos Humanos'),
('Marketing'),
('Financeiro'),
('Tecnologia'),
('Jurídico');

-- Criação da Tabela Colaboradores
CREATE TABLE tb_colaboradores (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cpf CHAR(11),
    data_nascimento DATE,
    cargo VARCHAR(50),
    salario DECIMAL(10,2),
    data_admissao DATE,
    departamento_id INT,
    email_corporativo VARCHAR(100),
    telefone VARCHAR(20),
    endereco VARCHAR(255),
    status_emprego ENUM('Ativo','Férias','Desligado','Licença') DEFAULT 'Ativo',
    FOREIGN KEY (departamento_id) REFERENCES tb_departamentos(id)
) ENGINE=InnoDB;

-- Inserir dados dos colaboradores
INSERT INTO tb_colaboradores
(nome, cpf, data_nascimento, cargo, salario, data_admissao, departamento_id, email_corporativo, telefone, endereco, status_emprego)
VALUES
('Renato Melo', '12345678901', '1988-05-14', 'Analista de RH', 4200.00, '2021-03-10', 1, 'renato.melo@suaempresa.com', '(11) 98877-2211', 'Rua das Palmeiras, 45 - São Paulo', 'Ativo'),
('Juliana Costa', '98765432100', '1992-08-22', 'Desenvolvedora Full Stack', 7500.00, '2020-07-01', 4, 'juliana.costa@suaempresa.com', '(11) 97766-3344', 'Av. Paulista, 1230 - São Paulo', 'Ativo'),
('Carlos Nogueira', '45678912300', '1985-12-02', 'Gerente Financeiro', 9800.00, '2018-01-15', 3, 'carlos.nogueira@suaempresa.com', '(21) 96655-7788', 'Rua do Mercado, 89 - Rio de Janeiro', 'Ativo'),
('Fernanda Lima', '32165498710', '1990-06-30', 'Assistente Administrativo', 3100.00, '2022-05-10', 1, 'fernanda.lima@suaempresa.com', '(31) 98877-4455', 'Rua Flor de Lis, 12 - Belo Horizonte', 'Ativo'),
('Rafael Sousa', '74185296300', '1995-09-19', 'Analista de Suporte', 4200.00, '2023-01-02', 4, 'rafael.sousa@suaempresa.com', '(85) 99123-4455', 'Av. Beira Mar, 50 - Fortaleza', 'Ativo'),
('Mariana Teixeira', '25896314700', '1989-11-03', 'Coordenadora de Projetos', 8600.00, '2019-09-20', 4, 'mariana.teixeira@suaempresa.com', '(11) 98800-7788', 'Rua do Progresso, 220 - São Paulo', 'Férias'),
('Pedro Almeida', '96385274100', '1993-03-12', 'Contador', 5200.00, '2020-02-25', 3, 'pedro.almeida@suaempresa.com', '(41) 97711-3322', 'Rua XV de Novembro, 88 - Curitiba', 'Ativo'),
('Aline Rocha', '15975348620', '1991-07-08', 'Recrutadora', 4100.00, '2021-11-01', 1, 'aline.rocha@suaempresa.com', '(71) 99988-7766', 'Rua Bahia, 45 - Salvador', 'Ativo'),
('Eduardo Santos', '85236974100', '1987-02-28', 'Analista de Sistemas', 6900.00, '2017-06-15', 4, 'eduardo.santos@suaempresa.com', '(11) 99234-5566', 'Rua dos Andradas, 77 - São Paulo', 'Licença'),
('Camila Ribeiro', '35795145600', '1996-10-10', 'Assistente Financeira', 3500.00, '2023-08-05', 3, 'camila.ribeiro@suaempresa.com', '(51) 98123-9988', 'Av. Ipiranga, 310 - Porto Alegre', 'Ativo');

-- Consultar Tabelas
SELECT * FROM tb_departamentos;
SELECT * FROM tb_colaboradores;
 
-- Selecionar colaboradores com salário maior que 2000
SELECT * FROM tb_colaboradores WHERE salario > 2000;

-- Selecionar colaboradores com salário menor que 2000
SELECT * FROM tb_colaboradores WHERE salario < 2000;

-- Atualizar registro do colaborador
UPDATE tb_colaboradores SET salario = 5000.00 WHERE id = 1;
 
-- Verificar se o registro foi atualizado 
SELECT * FROM tb_colaboradores WHERE nome = 'Renato Melo';

-- Desabilitar o Safe Update Mode
SET SQL_SAFE_UPDATES = 0;

-- Atualizar registros dos colaboradores
UPDATE tb_colaboradores SET salario = 8500.00 WHERE nome = 'Juliana Costa';
UPDATE tb_colaboradores SET status_emprego = 'Licença' WHERE nome = 'Rafael Sousa';
UPDATE tb_colaboradores SET salario = 8500.00, cargo = 'Gerente de Projetos' WHERE nome = 'Eduardo Santos';
UPDATE tb_colaboradores SET endereco = 'Rua das Palmeiras, 520 - São Paulo' WHERE nome = 'Camila Ribeiro';

-- Verificar se os registros foram atualizados
SELECT * FROM tb_colaboradores WHERE nome IN ('Juliana Costa', 'Rafael Sousa', 'Eduardo Santos', 'Camila Ribeiro');

UPDATE tb_colaboradores SET status_emprego = 'Ativo' WHERE nome = 'Eduardo Santos';

-- Verificar se o registro foi atualizado 
SELECT * FROM tb_colaboradores WHERE nome = 'Eduardo Santos';
 