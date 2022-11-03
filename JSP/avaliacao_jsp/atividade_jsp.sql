CREATE DATABASE atividade;
USE atividade;
CREATE TABLE publicacao(
	codigo INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(45),
    conteudo VARCHAR(250)
);

CREATE TABLE comentario(
	codigo INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45),
    mensagem VARCHAR(250),
    aprovado BOOLEAN,
    codigo_publicacao INT,
    codigo_usuario INT,
    FOREIGN KEY (codigo_publicacao) REFERENCES publicacao(codigo),
    FOREIGN KEY (codigo_usuario) REFERENCES usuario(codigo)
);

DROP TABLE comentario;

CREATE TABLE usuario(
	codigo INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    sobrenome VARCHAR(255),
    email VARCHAR(255),
    senha VARCHAR(255),
    isAdmin boolean
);

INSERT INTO usuario(nome, sobrenome, email, senha, isAdmin) VALUE ('Eula', 'Pereira', 'eula@gmail.com', '123abc', true);

SELECT * FROM usuario;

DELETE FROM usuario WHERE codigo = 6;

DROP TABLE comentario;

SELECT nome FROM usuario WHERE email = 'denilson@gmail.com' AND senha = '123456';

SELECT cmt.*, us.* FROM comentario cmt INNER JOIN usuario us ON cmt.codigo_usuario = us.codigo;


