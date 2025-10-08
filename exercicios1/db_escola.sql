-- Criação do Banco de Dados Escola
CREATE DATABASE db_escola;

USE db_escola;

-- Criação da Tabela Estudantes
CREATE TABLE tb_estudantes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    data_nascimento DATE,
    cpf CHAR(11),
    matricula VARCHAR(20) NOT NULL,
    turma VARCHAR(20),
    email VARCHAR(100),
    telefone VARCHAR(20),
    endereco VARCHAR(255),
    status ENUM('Ativo','Inativo','Transferido') DEFAULT 'Ativo',
    data_matricula TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    nota DECIMAL(4,2) 
) ENGINE=InnoDB;

-- Inserir informações dos estudantes
INSERT INTO tb_estudantes (nome, data_nascimento, cpf, matricula, turma, email, telefone, endereco, status, nota)
VALUES
('Ana Silva', '2005-03-12', '12345678901', '2023001', '8A', 'ana.silva@email.com', '(11) 98877-1122', 'Rua das Flores, 45 - São Paulo', 'Ativo', 8.5),
('Bruno Costa', '2004-07-25', '98765432100', '2023002', '9B', 'bruno.costa@email.com', '(11) 97766-3344', 'Av. Paulista, 1200 - São Paulo', 'Ativo', 7.8),
('Camila Oliveira', '2006-01-18', '45678912300', '2023003', '7C', 'camila.oliveira@email.com', '(21) 96655-7788', 'Rua do Mercado, 89 - Rio de Janeiro', 'Ativo', 9.2),
('Daniel Souza', '2005-11-30', '32165498710', '2023004', '8B', 'daniel.souza@email.com', '(31) 98877-4455', 'Rua Flor de Lis, 12 - Belo Horizonte', 'Ativo', 6.9),
('Eduarda Lima', '2004-05-15', '74185296300', '2023005', '9A', 'eduarda.lima@email.com', '(85) 99123-4455', 'Av. Beira Mar, 50 - Fortaleza', 'Ativo', 8.0),
('Felipe Rocha', '2005-09-19', '25896314700', '2023006', '8C', 'felipe.rocha@email.com', '(11) 98800-7788', 'Rua do Progresso, 220 - São Paulo', 'Ativo', 7.5),
('Gabriela Martins', '2006-02-28', '96385274100', '2023007', '7A', 'gabriela.martins@email.com', '(41) 97711-3322', 'Rua XV de Novembro, 88 - Curitiba', 'Ativo', 9.0),
('Hugo Almeida', '2005-06-08', '15975348620', '2023008', '8A', 'hugo.almeida@email.com', '(71) 99988-7766', 'Rua Bahia, 45 - Salvador', 'Ativo', 6.5),
('Isabela Santos', '2004-10-10', '85236974100', '2023009', '9C', 'isabela.santos@email.com', '(11) 99234-5566', 'Rua dos Andradas, 77 - São Paulo', 'Ativo', 8.7),
('João Pereira', '2006-08-22', '35795145600', '2023010', '7B', 'joao.pereira@email.com', '(51) 98123-9988', 'Av. Ipiranga, 310 - Porto Alegre', 'Ativo', 7.2);

-- Consultar Tabela Estudantes
SELECT * FROM tb_estudantes;

-- Selecionar estudantes com nota maior que 7.0
SELECT * FROM tb_estudantes WHERE nota > 7.0;

-- Selecionar estudantes com nota menor que 7.0
SELECT * FROM tb_estudantes WHERE nota < 7.0;

-- Selecionar estudantes com nota maior do que 7.0 e menor do que 8.5
SELECT * FROM tb_estudantes WHERE nota BETWEEN 7.0 AND 8.5;

-- Desabilitar o Safe Update Mode
SET SQL_SAFE_UPDATES = 0;

-- Atualizar notas dos estudantes
UPDATE tb_estudantes SET nota = 9.0 WHERE nome = 'Ana Silva';
UPDATE tb_estudantes SET nota = 8.2 WHERE nome = 'Bruno Costa';
UPDATE tb_estudantes SET nota = 7.5 WHERE nome = 'Daniel Souza';

-- Verificar registros atualizados
SELECT * FROM tb_estudantes WHERE nome IN ('Ana Silva', 'Bruno Costa', 'Daniel Souza');



