CREATE TABLE professores(
	codigo_professor INT PRIMARY KEY AUTO_INCREMENT,
    nome_professor VARCHAR(50)
);

CREATE TABLE cursos(
	codigo_curso INT PRIMARY KEY AUTO_INCREMENT,
    nome_curso VARCHAR(40),
    valor_curso DOUBLE,
    codigo_professor INT,
    FOREIGN KEY(codigo_professor) REFERENCES professores(codigo_professor)
);

CREATE TABLE alunos(
	codigo_aluno INT PRIMARY KEY AUTO_INCREMENT,
    nome_aluno VARCHAR(30),
    nascimento_aluno DATE,
    estado_aluno VARCHAR(20),
    cidade_aluno VARCHAR(40)
);

CREATE TABLE alunos_cursos(
	codigo_aluno INT,
    FOREIGN KEY(codigo_aluno) REFERENCES alunos(codigo_aluno),
    codigo_curso INT,
    FOREIGN KEY(codigo_curso) REFERENCES cursos(codigo_curso),
    status_curso VARCHAR(20)
);

DROP TABLE professores;
DROP TABLE cursos;
DROP TABLE alunos;
DROP TABLE alunos_cursos;

INSERT INTO professores(nome_professor) VALUES
('Larissa'),
('Daniel'),
('Gustavo'),
('Carla'),
('Guilherme'),
('Carina'),
('Lúcio'),
('Bianca');

INSERT INTO cursos(nome_curso, valor_curso, codigo_professor) VALUES
('Java - Básico', 1000, 2),
('Java - Avançado', 1250, 2),
('Spring Boot', 1800,2),
('C#', 1140, 7),
('ASP.NET Core', 1800, 7),
('Python', 900, 4),
('Flask', 1020,4),
('Django', 1400,4),
('PHP', 950,4),
('Laravel', 1600,4),
('Angular', 2300, 1),
('React', 2100,1),
('HTML', 500,8),
('CSS', 700,8),
('JavaScript', 900,4),
('Banco de dados', 600,3),
('Design Patterns', 2700,8);

INSERT INTO alunos(nome_aluno, nascimento_aluno, estado_aluno, cidade_aluno) VALUES
('Aline', '1997/03/01', 'Santa Catarina', 'Blumenau'),
('Mariana', '1993/08/28', 'Santa Catarina', 'Joinville'),
('Gustavo', '2000/11/14', 'São Paulo', 'Campinas'),
('Bianca', '1999/01/07', 'Santa Catarina', 'Blumenau'),
('Ricardo', '2002/07/30', 'Paraná', 'Curitiba'),
('Tamara', '2005/02/22', 'São Paulo', 'São Paulo'),
('Juliano', '1986/09/19', 'Paraná', 'Londrina'),
('Fernanda', '1987/01/28', 'São Paulo', 'São Paulo'),
('Alice', '2001/06/13', 'Santa Catarina', 'Blumenau'),
('Henrique', '1991/01/24', 'Rio de Janeiro', 'Niterói'),
('Marcelo', '1988/12/08', 'Paraná', 'Curitiba'),
('Daniela', '1998/10/14', 'Santa Catarina', 'Florianópolis'),
('Caroline', '2002/04/10', 'Paraná', 'Maringá'),
('Letícia', '1993/08/22', 'São Paulo', 'São Paulo'),
('Mauro', '1996/09/08', 'Santa Catarina', 'Jaraguá do Sul');

INSERT INTO alunos_cursos(codigo_aluno, codigo_curso, status_curso) VALUES
(1, 2, 'Concluído'),
(3, 6, 'Em andamento'),
(1, 7, 'Concluído'),
(4, 2, 'Em andamento'),
(9, 16, 'Não iniciado'),
(8, 10, 'Concluído'),
(1, 4, 'Concluído'),
(4, 9, 'Não iniciado'),
(10, 2, 'Em andamento'),
(7, 1, 'Concluído'),
(12, 2, 'Não iniciado'),
(2, 1, 'Não iniciado'),
(15, 7, 'Não iniciado'),
(11, 2, 'Concluído'),
(6, 13, 'Em andamento'),
(3, 4, 'Em andamento'),
(4, 10, 'Em andamento'),
(9, 17, 'Concluído'),
(1, 5, 'Em andamento'),
(10, 8, 'Em andamento');

SELECT
	alunos.nome_aluno,
    COUNT(*)
FROM alunos_cursos
LEFT JOIN alunos
ON alunos.codigo_aluno = alunos_cursos.codigo_aluno
LEFT JOIN cursos
ON cursos.codigo_curso = alunos_cursos.codigo_curso
GROUP BY(cursos.nome_curso);

SELECT 
	COUNT(*)
FROM alunos_cursos
INNER JOIN cursos
ON cursos.codigo_curso = alunos_cursos.codigo_curso
GROUP BY(alunos_cursos.status_curso);

SELECT
	alunos.nome_aluno,
    cursos.nome_curso
FROM alunos_cursos
INNER JOIN alunos
ON alunos.codigo_aluno = alunos_cursos.codigo_aluno
INNER JOIN cursos
ON cursos.codigo_curso = alunos_cursos.codigo_curso
WHERE alunos_cursos.status_curso = 'Concluído' AND cursos.valor_curso >= 1.000;

SELECT
	COUNT(*),
    estado_aluno
FROM alunos
GROUP BY(estado_aluno);

SELECT
	alunos.nome_aluno,
    cursos.nome_curso
FROM alunos_cursos
INNER JOIN alunos
ON alunos.codigo_aluno = alunos_cursos.codigo_aluno
INNER JOIN cursos
ON cursos.codigo_curso = alunos_cursos.codigo_curso
WHERE alunos_cursos.status_curso = 'Não iniciado';

SELECT nascimento_aluno FROM alunos WHERE DATE_FORMAT(NOW(),'%Y') - DATE_FORMAT(nascimento_aluno,'%Y') < 18;

SELECT
	alunos.nome_aluno,
    COUNT(*)
FROM alunos_cursos
INNER JOIN alunos
ON alunos.codigo_aluno = alunos_cursos.codigo_aluno
INNER JOIN cursos
ON cursos.codigo_curso = alunos_cursos.codigo_curso
WHERE alunos.nascimento_aluno = (SELECT nascimento_aluno FROM alunos WHERE DATE_FORMAT(NOW(),'%Y') - DATE_FORMAT(nascimento_aluno,'%Y') < 18);

SELECT MAX(valor_curso) FROM cursos;

SELECT
	cursos.nome_curso,
    cursos.valor_curso,
    COUNT(*)
FROM cursos
INNER JOIN alunos_cursos
ON cursos.codigo_curso = alunos_cursos.codigo_curso
WHERE cursos.valor_curso = (SELECT MAX(valor_curso) FROM cursos);
    

SELECT
	professores.nome_professor,
    COUNT(*)
FROM cursos
INNER JOIN professores
ON professores.codigo_professor = cursos.codigo_professor
GROUP BY(professores.nome_professor);


SELECT nome_professor, nome_curso, COUNT(codigo_aluno) AS qt_alunos
FROM alunos_cursos
RIGHT JOIN cursos c on alunos_cursos.codigo_curso = c.codigo_curso
RIGHT JOIN professores p on p.codigo_professor = c.codigo_professor
GROUP BY nome_professor, nome_curso;

SELECT
	alunos.nome_aluno,
    cursos.nome_curso,
    cursos.valor_curso,
    professores.nome_professor
FROM alunos_cursos
INNER JOIN alunos 
ON alunos.codigo_aluno = alunos_cursos.codigo_aluno
INNER JOIN cursos
ON cursos.codigo_curso = alunos_cursos.codigo_curso
INNER JOIN professores
ON professores.codigo_professor = cursos.codigo_professor;

SELECT AVG(valor_curso) FROM cursos;

SELECT
	cursos.nome_curso,
    cursos.valor_curso,
    COUNT(*)
FROM cursos
INNER JOIN alunos_cursos
ON cursos.codigo_curso = alunos_cursos.codigo_curso
WHERE cursos.valor_curso >= (SELECT AVG(valor_curso) FROM cursos);

DELETE FROM alunos WHERE 2022 - DATE_FORMAT(nascimento_aluno,"%Y") > 30;



	


