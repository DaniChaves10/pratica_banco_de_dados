DROP DATABASE IF EXISTS db_empresa;

-- Criar o Banco de dados db_empresa
CREATE DATABASE db_empresa;

use db_empresa;

SET SQL_SAFE_UPDATES = 0;

-- Criar a tabela tb_departamento
CREATE TABLE tb_departamento (
    id_departamento bigint AUTO_INCREMENT,
    nome varchar(255) NOT NULL,
    PRIMARY KEY (id_departamento)
);

-- Insere dados na tabela tb_departamento
INSERT INTO tb_departamento (nome)
VALUES 
("Tecnologia"),
("Recursos Humanos"),
("Financeiro"),
("Marketing"),
("Vendas");

-- Criar a tabela tb_funcionario
CREATE TABLE tb_funcionario (
    id_funcionario bigint AUTO_INCREMENT,
    nome varchar(255) NOT NULL,
    salario decimal (8,2) NOT NULL,
    id_departamento bigint,
    PRIMARY KEY (id_funcionario),
    FOREIGN KEY (id_departamento) REFERENCES tb_departamento(id_departamento)
);

-- Insere dados na tabela tb_funcionario
INSERT INTO tb_funcionario (nome, salario, id_departamento) 
VALUES 
("Carlos Souza", 3500.00, 1),
("Mariana Dias", 4200.00, 1),
("Rodrigo Alves", 2800.00, 2),
("Juliana Lima", 3100.00, 3),
("Felipe Neto", 5000.00, 1),
("Camila Costa", 2500.00, 4),
("Bruno Rocha", 4800.00, 3),
("Amanda Silva", 2900.00, 2),
("Lucas Martins", 3200.00, 5),
("Fernanda Gomes", 6000.00, 1);

-- Liste todos os registros
SELECT * FROM tb_departamento;
SELECT * FROM tb_funcionario;

-- Filtra funcionários com salário maior que R$ 3.000,00
SELECT * FROM tb_funcionario WHERE salario > 3000;

-- Atualiza o salario do Carlos
UPDATE tb_funcionario
SET salario = 3800.00
WHERE id_funcionario = 1;

-- Remove o funcionário Lucas Martins
DELETE FROM tb_funcionario
WHERE id_funcionario = 9;

-- Relaciona os funcionários com seus respectivos departamentos (JOIN)
SELECT 
    tb_funcionario.nome AS "Funcionário",
    tb_funcionario.salario AS "Salário",
    tb_departamento.nome AS "Departamento"
FROM tb_funcionario
INNER JOIN tb_departamento 
ON tb_funcionario.id_departamento = tb_departamento.id_departamento;

