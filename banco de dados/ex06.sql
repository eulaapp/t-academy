CREATE TABLE professores(
	codigo_professor INT PRIMARY KEY AUTO_INCREMENT,
    nome_professor VARCHAR(20)
);

CREATE TABLE materias(
	codigo_materia INT PRIMARY KEY AUTO_INCREMENT,
    codigo_professor INT,
    FOREIGN KEY (codigo_professor) REFERENCES professores(codigo_professor),
    nome_materia VARCHAR(20)
);

CREATE TABLE turmas(
	codigo_turma INT PRIMARY KEY AUTO_INCREMENT,
    nome_turma VARCHAR(2),
    turno_turma VARCHAR(10)
);

CREATE TABLE alunos(
	codigo_alunos INT PRIMARY KEY AUTO_INCREMENT,
    nome_alunos VARCHAR(50)
);

CREATE TABLE alunos_turmas(
	codigo_aluno INT,
    FOREIGN KEY (codigo_aluno) REFERENCES alunos(codigo_alunos),
    codigo_materia INT,
    FOREIGN KEY (codigo_materia) REFERENCES materias(codigo_materia),
    codigo_turma INT,
    FOREIGN KEY (codigo_turma) REFERENCES turmas(codigo_turma)
);

INSERT INTO professores(nome_professor) VALUES
('Renato'),
('Oscar'),
('Cátia'),
('Osvaldo'),
('Marília'),
('Paula'),
('Otávio'),
('Airton');

INSERT INTO materias(codigo_professor, nome_materia) VALUES
(1, 'Matemática'),
(2, 'Geografia'),
(7, 'Química'),
(6, 'Filosofia'),
(1, 'Física'),
(3, 'Português'),
(3, 'Inglês'),
(6, 'Sociologia'),
(5, 'Português'),
(4, 'História'),
(4, 'Sociologia'),
(5, 'Espanhol'),
(8, 'Biologia'),
(8, 'Química');

INSERT INTO turmas(nome_turma, turno_turma) VALUES
('6A', 'Matutino'),
('6B', 'Vespertino'),
('7A', 'Matutino'),
('7A', 'Vespertino'),
('8A', 'Matutino'),
('8B', 'Vespertino');

INSERT INTO alunos(nome_alunos) VALUES
('Alessandra'),
('Emanuela'),
('Cíntia'),
('Diego'),
('Eduardo'),
('Larissa'),
('Jonathan'),
('Cleber'),
('Jéssica'),
('Lucas'),
('Murilo'),
('Marcelo'),
('Rebeca'),
('Tatiana'),
('Taís'),
('Gabriel'),
('Felipe'),
('Eliza'),
('Sarah'),
('Patrícia');

INSERT INTO alunos_turmas(codigo_aluno, codigo_materia, codigo_turma) VALUES
(1, 1, 1),
(2, 5, 1),
(3, 10, 2),
(4, 14, 1),   
(5, 1, 1),
(6, 2, 6),
(7, 3, 2),
(8, 6, 3),
(9, 5, 4),
(10, 4, 4),
(11, 1, 5),
(12, 5, 2),
(13, 8, 3),
(14, 13, 6),
(15, 6, 5),
(16, 14, 3),
(17, 9, 5),
(18, 3, 1),
(19, 8, 4),
(20, 5, 6),
(4, 10, 3),
(15, 2, 1),
(12, 10, 1),
(9, 8, 6);

SELECT
	alunos.nome_alunos,
    turmas.nome_turma,
    materias.nome_materia
FROM alunos_turmas
INNER JOIN alunos
ON alunos.codigo_alunos = alunos_turmas.codigo_aluno
INNER JOIN turmas
ON turmas.codigo_turma = alunos_turmas.codigo_turma
INNER JOIN materias
ON materias.codigo_materia = alunos_turmas.codigo_turma;

SELECT 
	professores.nome_professor,
    materias.nome_materia
FROM materias
INNER JOIN professores
ON professores.codigo_professor = materias.codigo_professor;

SELECT
	COUNT(*),
    turmas.nome_turma
FROM alunos_turmas
INNER JOIN turmas
ON turmas.codigo_turma = alunos_turmas.codigo_turma
GROUP BY(turmas.nome_turma);

SELECT
	COUNT(*),
    turmas.turno_turma
FROM alunos_turmas
INNER JOIN turmas
ON turmas.codigo_turma = alunos_turmas.codigo_turma
GROUP BY(turmas.turno_turma);

SELECT 
	alunos.nome_alunos,
    turmas.nome_turma,
    materias.nome_materia,
    professores.nome_professor
FROM alunos_turmas
INNER JOIN alunos
ON alunos.codigo_alunos = alunos_turmas.codigo_aluno
INNER JOIN turmas
ON turmas.codigo_turma = alunos_turmas.codigo_turma
INNER JOIN materias
ON materias.codigo_materia = alunos_turmas.codigo_materia
INNER JOIN professores
ON professores.codigo_professor = materias.codigo_professor
WHERE nome_professor = 'Renato';

SELECT 
	professores.nome_professor,
    materias.nome_materia
FROM professores
INNER JOIN materias
ON professores.codigo_professor = materias.codigo_professor
WHERE materias.nome_materia = 'Química';

SELECT
	alunos.nome_alunos,
    materias.nome_materia
FROM alunos_turmas
INNER JOIN alunos
ON alunos.codigo_alunos = alunos_turmas.codigo_aluno
INNER JOIN materias
ON materias.codigo_materia = alunos_turmas.codigo_materia
WHERE materias.nome_materia = 'História';

SELECT
	professores.nome_professor
FROM professores
INNER JOIN materias
ON professores.codigo_professor = materias.codigo_professor
WHERE materias.nome_materia = 'Inglês' OR materias.nome_materia = 'Português' HAVING COUNT(professores.nome_professor) > 1;

SELECT 
	materias.nome_materia,
    COUNT(*)
AS 'Aluno matriculados'
FROM alunos_turmas
INNER JOIN materias
ON materias.codigo_materia = alunos_turmas.codigo_materia
GROUP BY(materias.nome_materia);

SELECT
	alunos.nome_alunos
FROM alunos_turmas
INNER JOIN alunos
ON alunos.codigo_alunos = alunos_turmas.codigo_aluno
INNER JOIN materias
ON materias.codigo_materia = alunos_turmas.codigo_materia
INNER JOIN professores
ON professores.codigo_professor = materias.codigo_professor
WHERE professores.nome_professor = 'Cátia' AND materias.nome_materia = 'Inglês';

SELECT
	COUNT(*)
FROM alunos_turmas
INNER JOIN turmas
ON turmas.codigo_turma = alunos_turmas.codigo_turma
INNER JOIN materias
ON materias.codigo_materia = alunos_turmas.codigo_materia
INNER JOIN professores
ON professores.codigo_professor = materias.codigo_professor
WHERE turmas.nome_turma = '6A' AND professores.nome_professor = 'Renato' AND materias.nome_materia = 'Matemática';

SELECT
	materias.nome_materia
FROM materias
INNER JOIN professores
ON materias.codigo_professor = professores.codigo_professor
WHERE professores.nome_professor = 'Airton';

SELECT
	COUNT(*)
FROM turmas
INNER JOIN alunos_turmas
ON turmas.codigo_turma = alunos_turmas.codigo_turma
INNER JOIN materias
ON materias.codigo_materia = alunos_turmas.codigo_materia
WHERE turmas.turno_turma = 'Vespertino' AND materias.nome_materia = 'Biologia';

DROP TABLE professores;
DROP TABLE materias;
DROP TABLE turmas;
DROP TABLE alunos;
DROP TABLE alunos_turmas;




