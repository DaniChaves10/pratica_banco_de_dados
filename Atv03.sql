DROP DATABASE IF EXISTS db_loja;

-- Criar o Banco de dados db_loja
CREATE DATABASE db_loja;

use db_loja;

SET SQL_SAFE_UPDATES = 0;

-- Criar a tabela tb_categoria
CREATE TABLE tb_categoria (
    id_categoria bigint AUTO_INCREMENT,
    nome varchar(255) NOT NULL,
    PRIMARY KEY (id_categoria)
);

-- Insere dados na tabela tb_categoria
INSERT INTO tb_categoria (nome)
VALUES 
("Informática"),
("Eletrônicos"),
("Escritório"),
("Games"),
("Acessórios");

-- Criar a tabela tb_produto
CREATE TABLE tb_produto (
    id_produto bigint AUTO_INCREMENT,
    nome varchar(255) NOT NULL,
    preco decimal (8,2) NOT NULL,
    id_categoria bigint,
    PRIMARY KEY (id_produto),
    FOREIGN KEY (id_categoria) REFERENCES tb_categoria(id_categoria)
);

-- Insere dados na tabela tb_produto
INSERT INTO tb_produto (nome, preco, id_categoria) 
VALUES 
("Teclado Mecânico RGB", 180.00, 1),
("Mouse Gamer Sem Fio", 120.00, 1),
("Monitor", 850.00, 1),
("Headset Bluetooth", 250.00, 2),
("Cadeira Ergonômica", 950.00, 3),
("Console PS5", 3999.00, 4),
("Controle DualSense", 400.00, 4),
("Mesa Digitalizadora", 350.00, 1),
("Webcam Full HD", 220.00, 2),
("Suporte para Notebook", 80.00, 5);

-- Liste todos os registros
SELECT * FROM tb_categoria;
SELECT * FROM tb_produto;

-- Filtre os produtos por preço (Ex: produtos menores que R$ 300,00)
SELECT * FROM tb_produto WHERE preco < 300.00;

-- Atualize o preço de um produto identificando-o por uma condição específica (Ex: ID 1)
UPDATE tb_produto
SET preco = 195.00
WHERE id_produto = 1;

-- Remova um produto identificando-o por uma condição específica (Ex: ID 10)
DELETE FROM tb_produto
WHERE id_produto = 10;

-- Consulta relacionando as tabelas de produto e categoria (JOIN)
SELECT 
    tb_produto.nome AS "Produto",
    tb_produto.preco AS "Preço",
    tb_categoria.nome AS "Categoria"
FROM tb_produto
INNER JOIN tb_categoria 
ON tb_produto.id_categoria = tb_categoria.id_categoria
ORDER BY tb_produto.nome;

