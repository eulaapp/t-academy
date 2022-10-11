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
();