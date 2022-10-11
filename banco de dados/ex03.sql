CREATE TABLE alunos (
	nome VARCHAR(40),
    turma VARCHAR(10),
    nota1 DOUBLE,
    nota2 DOUBLE,
    nota3 DOUBLE,
    turno VARCHAR(10)
);

INSERT INTO alunos(nome, turma, nota1, nota2, nota3, turno) VALUES 
('Ana Paula', '7A', 5, 8, 7, 'Vespertino'),
('Caio Neves', '8B', 3, 4, 2, 'Matutino'),
('Isabella Fontana', '7C', 9, 8.5, 9, 'Vespertino'),
('Daniel Luz', '8A', 2, 5, 4, 'Vespertino'),
('Gabriela Braga', '8A', 10, 10, 10, 'Vespertino'),
('Ellen Souza', '7A', 5, 8, 7, 'Matutino'),
('Luciana Biltz', '8B', 9.5, 10, 10, 'Vespertino'),
('Paulo Almeida', '8A', 10, 10, 10, 'Matutino'),
('Carla Malta', '7B', 3, 7, 9, 'Matutino'),
('Diogo Andrade', '8C', 10, 9, 10, 'Vespertino'),
('Mônica Mota', '8A', 7, 7, 8, 'Vespertino'),
('Juliana Lima', '8C', 9, 8, 2, 'Vespertino'),
('Marcelo Matos', '7A', 9, 10, 5, 'Matutino');

SELECT IF((nota1+nota2+nota3)/3 >= 7, "Aprovado", "Reprovado") AS 'Situação' FROM alunos;

USE projeto;

SELECT turno, COUNT(*) FROM alunos GROUP BY(turno);

SELECT turma, COUNT(*) FROM alunos GROUP BY(turma);

SELECT nome, (nota1+nota2+nota3)/3 AS 'Média' FROM alunos WHERE (nota1+nota2+nota3)/3 >= 7;

SELECT turno, COUNT(*) FROM alunos WHERE (nota1+nota2+nota3)/3 < 7 AND turno = 'Vespertino';

SELECT nome FROM alunos WHERE (nota1+nota2+nota3) / 3 = 10;

SELECT turma, (nota1+nota2+nota3)/3 AS 'Média' FROM alunos GROUP BY(turma);

UPDATE alunos SET turma = '8A' WHERE turma = '8B';

SELECT * FROM alunos;

DROP TABLE alunos;
