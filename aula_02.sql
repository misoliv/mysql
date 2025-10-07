CREATE DATABASE db_quitanda;

USE db_quitanda;

CREATE TABLE tb_produtos(
	id bigint AUTO_INCREMENT,
	nome varchar(255) NOT NULL,
    quantidade int,
    data_validade date,
    preco decimal NOT NULL,
    PRIMARY KEY(id)
    );
    
    -- Inserir dados na Tabela
 INSERT INTO tb_produtos(nome, quantidade, data_validade, preco)
 VALUES("Abacate", 0, "2025-10-27", 15.90);
 
 SELECT * FROM tb_produtos;
 
-- modificar a estrutura de um atributo
ALTER TABLE tb_produtos MODIFY preco decimal(6,2);

 SELECT * FROM tb_produtos;
 
 INSERT INTO tb_produtos(nome, quantidade, data_validade, preco)
 VALUES("Laranja", 50, "25-10-27", 12.50);
 
INSERT INTO tb_produtos(nome, quantidade, data_validade, preco)
VALUES("Banana", 200, "2025-10-27", 5.30);
 
INSERT INTO tb_produtos(nome, quantidade, data_validade, preco)
VALUES("Morango", 70, "2025-10-11", 10.00);

UPDATE tb_produtos SET preco = 15.90 WHERE id= 1;

DELETE FROM tb_produtos WHERE id = 3;
 
 SELECT * FROM tb_produtos;  
 
  
 SET SQL_SAFE_UPDATES = 1;
 
ALTER TABLE tb_produtos ADD descricao varchar(255);
 
ALTER TABLE tb_produtos CHANGE descricao description varchar(255);  

ALTER TABLE tb_produtos DROP description;

select * FROM tb_produtos WHERE id = 4;

SELECT * FROM db_quitanda.tb_produtos;

SELECT * FROM tb_produtos WHERE preco > 10;
 
SELECT * FROM tb_produtos WHERE preco != 10; 

SELECT nome, preco FROM tb_produtos;
