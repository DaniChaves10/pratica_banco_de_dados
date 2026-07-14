DROP DATABASE IF EXISTS db_escola;

-- Criar o Banco de dados db_escola
CREATE DATABASE db_escola;

USE db_escola;

SET SQL_SAFE_UPDATES = 0;

-- Criar a tabela tb_curso
CREATE TABLE tb_curso (
    id_curso bigint AUTO_INCREMENT,
    nome varchar(255) NOT NULL,
    carga_horaria int NOT NULL, 
    PRIMARY KEY (id_curso)
);

-- Insere dados na tabela tb_curso
INSERT INTO tb_curso (nome, carga_horaria)
VALUES 
("HTML5 e CSS3 Moderno", 40),
("JavaScript Avançado", 80),
("React.js e TypeScript", 120),
("Node.js para APIs", 90),
("Banco de Dados Relacional", 60),
("Estrutura de Dados em C", 100),
("Desenvolvimento Web Completo", 360),
("UI/UX Design Responsivo", 50),
("Metodologias Ágeis e Git", 30),
("Introdução ao Java", 120);

-- Criar a tabela tb_aluno
CREATE TABLE tb_aluno (
    id_aluno bigint AUTO_INCREMENT,
    nome varchar(255) NOT NULL,
    idade int NOT NULL,
    id_curso bigint,
    PRIMARY KEY (id_aluno),
    FOREIGN KEY (id_curso) REFERENCES tb_curso(id_curso)
);

-- Insere dados na tabela tb_aluno
INSERT INTO tb_aluno (nome, idade, id_curso) 
VALUES
("Daniel Silva", 24, 3),
("Ana Costa", 20, 1),
("Lucas Oliveira", 17, 6),
("Beatriz Souza", 22, 2),
("Mateus Santos", 19, 4),
("Mariana Lima", 16, 8),
("Gabriel Rocha", 27, 5),
("Larissa Mendes", 21, 3),
("Pedro Henrique", 15, 7),
("Sofia Rezende", 30, 10);

-- Liste todos os registros
SELECT * FROM tb_curso;
SELECT * FROM tb_aluno;

-- Filtre os alunos maiores de idade
SELECT * FROM tb_aluno WHERE idade >= 18;

-- Atualiza a idade da aluna Ana Costa
UPDATE tb_aluno
SET idade = 21
WHERE id_aluno = 2;

-- Atualiza o curso do aluno Daniel Silva
UPDATE tb_aluno
SET id_curso = 5
WHERE id_aluno = 1;

-- Remove o aluno Pedro Henrique
DELETE FROM tb_aluno
WHERE nome = "Pedro Henrique";

-- Relaciona os alunos com seus respectivos cursos
SELECT
    tb_aluno.nome AS Aluno,
    tb_aluno.idade AS Idade,
    tb_curso.nome AS Curso,
    tb_curso.carga_horaria AS Carga_Horaria
FROM tb_aluno
INNER JOIN tb_curso
ON tb_aluno.id_curso = tb_curso.id_curso;

