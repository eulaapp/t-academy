
CREATE DATABASE avaliacao;
USE avaliacao;

CREATE TABLE autor(
	codigo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45)
);

CREATE TABLE genero(
	codigo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45)
);

CREATE TABLE editora(
	codigo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45)
);

CREATE TABLE livro(
	codigo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    valor DOUBLE
);

CREATE TABLE edicao(
	codigo INT PRIMARY KEY AUTO_INCREMENT,
    livro_codigo INT,
    FOREIGN KEY(livro_codigo) REFERENCES livro(codigo),
    editora_codigo INT,
    FOREIGN KEY(editora_codigo) REFERENCES editora(codigo),
    nome VARCHAR(45),
    data_publicacao DATE
);

CREATE TABLE livro_autor(
	livro_codigo INT,
    FOREIGN KEY(livro_codigo) REFERENCES livro(codigo),
    autor_codigo INT,
    FOREIGN KEY(autor_codigo) REFERENCES autor(codigo)
);

CREATE TABLE livro_genero(
	livro_codigo INT,
    FOREIGN KEY(livro_codigo) REFERENCES livro(codigo),
    genero_codigo INT,
    FOREIGN KEY(genero_codigo) REFERENCES genero(codigo)
);

CREATE TABLE cliente(
	codigo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    data_nascimento DATE
);

CREATE TABLE reserva(
	codigo INT PRIMARY KEY AUTO_INCREMENT,
    data_reserva DATE,
    cliente_codigo INT,
    FOREIGN KEY(cliente_codigo) REFERENCES cliente(codigo),
    valor DOUBLE,
    periodo INT
);

CREATE TABLE livro_reserva(
	livro_codigo INT,
    FOREIGN KEY(livro_codigo) REFERENCES livro(codigo),
    reserva_codigo INT,
    FOREIGN KEY(reserva_codigo) REFERENCES reserva(codigo)
);

INSERT INTO autor(nome) VALUES
('John Ronald Reuel Tolkien'),
('Jane Austen'),
('Clive Staples Lewis'),
('William Shakespeare'),
('Agatha Christie'),
('Ligia Fagundes Telles'),
('Cornelia Funke'),
('Machado de Assis'),
('Clarice Lispector'),
('Stephen King'),
('Emily Bronte');

INSERT INTO genero(nome) VALUES
('Fantasia'),
('Ficção'),
('Horror'),
('Aventura'),
('Mistério'),
('Romance'),
('Ficção científica'),
('Conto'),
('Policial'),
('Drama');

INSERT INTO editora(nome) VALUES
('HarperCollins'),
('WMF Martins Fontes'),
('Nova Fronteira'),
('Clássicos Zahar'),
('Companhia das Letras'),
('Seguinte'),
('Principis'),
('Suma'),
('Darkside'),
('Saraiva'),
('Suma');

INSERT INTO livro(nome, valor) VALUES
('O Hobbit', 33.90),
('O morro dos ventos uivantes', 22.98),
('Orgulho e Preconceito', 53.30),
('As crônicas de Nárnia', 49.90),
('Coração de Tinta', 35.97),
('O Senhor dos Anéis', 249.90),
('O Iluminado', 52.99),
('O Silmarillion', 45.90),
('Contos Inacabados De Númenor E Da Terra-média', 39.89),
('A queda de gondolin', 40.39);

INSERT INTO edicao(livro_codigo, editora_codigo, nome, data_publicacao) VALUES 
(1,1, '1ª edição', '2019/07/15'),
(2,4, 'Bolso de luxo', '2018/05/10'),
(3,9,'1ª edição','2022/09/06'),
(4,2,'2ª edição','2009/01/08'),
(5,6,'1ª edição','2006/02/10'),
(6,1,'Edição de colecionador','2021/12/20'),
(7,8,'1ª edição','2012/11/19'),
(8,1,'1ª edição','2019/03/19'),
(9,1,'1ª edição','2020/07/15'),
(10,1,'1ª edição','2018/09/03');

INSERT INTO livro_autor(livro_codigo, autor_codigo) VALUES
(1,1),
(2,11),
(3, 2),
(4, 3),
(5,7),
(6,1),
(7,10),
(8,1),
(9,1),
(10,1);

SELECT * FROm autor;

INSERT INTO livro_genero(livro_codigo, genero_codigo) VALUES
(1,1),
(2, 2),
(3,6),
(4,4),
(5,1),
(6,1),
(7,3),
(8,1),
(9,4),
(10,4);

INSERT INTO cliente(nome) VALUES
('Denilson Lehner'),
('Maria Eduarda Pereira'),
('Maria Joaquina'),
('Maisa'),
('José Maria'),
('Catarina Rodrigues'),
('Ana Luiza'),
('Diogo André'),
('Angela Maria'),
('Elizabeth Soares');

INSERT INTO reserva(data_reserva, cliente_codigo) VALUES
('2022-08-02',1),
('2021-07-15',8),
('2022-06-24',5),
('2022-02-14',3),
('2022-03-27',6),
('2021-04-12',1),
('2022-04-26',2),
('2021-08-22',7),
('2022-09-23',9),
('2022-08-15',1);

INSERT INTO livro_reserva(livro_codigo,reserva_codigo) VALUES
(2,2),
(1,1),
(3,5),
(4,6),
(5,8),
(6,9),
(7,4),
(8,3),
(9,7),
(10,10);

# 1ª view
CREATE VIEW livro_cadastrados_tolkien AS
SELECT 
	autor.nome,
    COUNT(*)
AS 'Livros cadastrados'
FROM livro_autor
INNER JOIN autor
ON autor.codigo = livro_autor.autor_codigo
INNER JOIN livro
ON livro.codigo = livro_autor.livro_codigo
WHERE autor.nome = 'John Ronald Reuel Tolkien'
GROUP BY(autor.nome);


SELECT * FROM livro_cadastrados_tolkien;

# 2ª view
CREATE VIEW livro_com_valor_mais_alto AS
SELECT
	livro.valor,
    livro.nome AS 'Nome livro',
    autor.nome AS 'Nome autor'
FROM livro_autor
INNER JOIN livro
ON livro.codigo = livro_autor.livro_codigo
INNER JOIN autor
ON autor.codigo = livro_autor.autor_codigo
ORDER BY(livro.valor) DESC LIMIT 1;

SELECT * FROM livro_com_valor_mais_alto;

# 3ª view
CREATE VIEW reserva_livros AS
SELECT
	reserva.data_reserva,
    cliente.nome AS 'Cliente',
    livro.nome AS 'Livro'
FROM livro_reserva
INNER JOIN reserva
ON reserva.codigo = livro_reserva.reserva_codigo
INNER JOIN cliente
ON cliente.codigo = reserva.cliente_codigo
INNER JOIN livro
ON livro.codigo = livro_reserva.livro_codigo
WHERE reserva.data_reserva BETWEEN '2022-01-01' AND '2022-12-31';

SELECT * FROM reserva_livros;

# 4ª view
CREATE VIEW valores_livros_ordem_decrescente AS
SELECT
	livro.valor AS 'Valor',
    livro.nome AS 'Livro',
    autor.nome AS 'Autor',
    edicao.nome AS 'Edição'
FROM livro_autor
INNER JOIN livro
ON livro.codigo = livro_autor.livro_codigo
INNER JOIN autor
ON autor.codigo = livro_autor.autor_codigo
INNER JOIN edicao
ON edicao.livro_codigo = livro.codigo
ORDER BY(livro.valor) DESC;

SELECT * FROM valores_livros_ordem_decrescente;

# 5ª view
CREATE VIEW dados_livros AS
SELECT
	livro.nome AS 'Livro',
    livro.valor AS 'Valor',
    autor.nome AS 'Autor',
    genero.nome AS 'Genero',
    edicao.nome AS 'Edição',
    editora.nome AS 'Editora'
FROM livro_autor
INNER JOIN livro
ON livro.codigo = livro_autor.livro_codigo
INNER JOIN autor
ON autor.codigo = livro_autor.autor_codigo
INNER JOIN livro_genero
ON livro_genero.livro_codigo = livro.codigo
INNER JOIN genero
ON genero.codigo = livro_genero.genero_codigo
INNER JOIN edicao
ON edicao.livro_codigo = livro.codigo
INNER JOIN editora
ON editora.codigo = edicao.editora_codigo;

SELECT * FROM dados_livros;

# View com RIGHT JOIN
CREATE VIEW editoras_cadastradas_com_ou_sem_livro AS
SELECT
	livro.nome AS 'Livro',
    editora.nome AS 'Editora'
FROM edicao
RIGHT JOIN livro
ON livro.codigo = edicao.livro_codigo
RIGHT JOIN editora
ON editora.codigo = edicao.editora_codigo;

SELECT * FROM editoras_cadastradas_com_ou_sem_livro;

# View com LEFT JOIN - todos os autores com ou sem livros cadastrados
CREATE VIEW autores_cadastrados AS
SELECT 
	autor.nome AS 'Autor',
    COUNT(livro.codigo) AS 'Quantidade de livros'
FROM autor
LEFT JOIN livro_autor
ON autor.codigo = livro_autor.autor_codigo
LEFT JOIN livro
ON livro.codigo = livro_autor.livro_codigo
GROUP BY(autor.nome);

SELECT * FROM autores_cadastrados;

# Livro com valor mais alto
SELECT nome FROM livro WHERE valor = (SELECT MAX(livro.valor) FROM livro);

# Livro com valor mais baixo
SELECT nome FROM livro WHERE valor = (SELECT MIN(livro.valor) FROM livro);

# Livros em que o autor seja J. R. R. Tolkien ou Jane Austen
SELECT 
	livro.nome
FROM livro_autor
INNER JOIN autor
ON autor.codigo = livro_autor.autor_codigo
INNER JOIN livro
ON livro.codigo = livro_autor.livro_codigo
WHERE autor.nome = 'John Ronald Reuel Tolkien' OR autor.nome = 'Jane Austen';

# Autores que possuem mais de 3 livros cadastrados
SELECT
	autor.nome AS 'Autor',
    COUNT(livro.codigo)
FROM livro_autor
INNER JOIN autor
ON autor.codigo = livro_autor.autor_codigo
INNER JOIN livro
ON livro.codigo = livro_autor.livro_codigo
GROUP BY(autor.nome) HAVING COUNT(livro.codigo) > 3;

# Livros publicados com menos de 5 anos
SELECT
	livro.nome
FROM livro
INNER JOIN edicao
ON livro.codigo = edicao.livro_codigo
WHERE data_publicacao = DATE_FORMAT(NOW(),'%Y') - DATE_FORMAT(data_publicacao,'%Y') < 5;

# Livros que possuam a letra 'a' e sejam de fantasia
SELECT
	livro.nome AS 'Livro'
FROM livro_genero
INNER JOIN livro
ON livro.codigo = livro_genero.livro_codigo
INNER JOIN genero
ON genero.codigo = livro_genero.genero_codigo
WHERE livro.nome LIKE '%a%' AND genero.nome = 'Fantasia';

# Livros com valor promocional
SELECT nome, IF(valor < 30, 'Promoção', 'Preço normal') FROM livro;

# Cadastrar primeira reserva gratuita
DELIMITER $
CREATE TRIGGER reserva_gratis
AFTER INSERT ON cliente
FOR EACH ROW
BEGIN
	INSERT INTO reserva(data_reserva, cliente_codigo, periodo, valor) VALUE (NOW(),NEW.codigo, NEW.periodo, NEW.valor);
    INSERT INTO livro_reserva(livro_codigo, reserva_codigo) VALUE (1, (SELECT MAX(codigo) FROM reserva));
END$

DELIMITER ;

# Adicionar desconto no valor do livro
DELIMITER %
CREATE TRIGGER desconto_livro
BEFORE INSERT ON livro
FOR EACH ROW
BEGIN
    IF (NEW.valor > 100) THEN
		SET NEW.valor = NEW.valor * 0.8;
	ELSE 
		SET NEW.valor = NEW.valor* 0.9;
	END IF;
END%

DELIMITER ;

# Procedure para cadastrar livro
DELIMITER $$
CREATE PROCEDURE cadastrar_livro(IN nome VARCHAR(45), IN valor DOUBLE)
BEGIN
	INSERT INTO livro(nome, valor) VALUE (nome, valor);
END$$
DELIMITER ;

# Procedure para cadastrar livro_reserva
DELIMITER $$
CREATE PROCEDURE cadastrar_livro_reserva(IN livro_codigo INT, IN reserva_codigo INT)
BEGIN
	INSERT INTO livro_reserva(livro_codigo, reserva_codigo) VALUE (livro_codigo, reserva_codigo);
END$$
DELIMITER ;

# Procedure para cadastrar reserva
DELIMITER $$
CREATE PROCEDURE cadastrar_reserva(IN data_reserva DATE, IN cliente_codigo INT, periodo INT, valor DOUBLE)
BEGIN
	INSERT INTO reserva(data_reserva, cliente_codigo, periodo, valor) VALUE (data_reserva, cliente_codigo, periodo, valor);
END$$
DELIMITER ;

# Procedure para cadastrar cliente
DELIMITER $$
CREATE PROCEDURE cadastrar_cliente(IN nome VARCHAR(45), IN data_nascimento DATE)
BEGIN
	INSERT INTO cliente(nome, data_nascimento) VALUE (nome, data_nascimento);
END$$
DELIMITER ;

# Procedure para cadastrar livro_genero
DELIMITER $$
CREATE PROCEDURE cadastrar_livro_genero(IN livro_codigo INT, IN genero_codigo INT)
BEGIN
	INSERT INTO livro_genero(livro_codigo, genero_codigo) VALUE (livro_codigo, genero_codigo);
END$$
DELIMITER ;

# Procedure para cadastrar genero
DELIMITER $$
CREATE PROCEDURE cadastrar_genero(IN nome VARCHAR(45))
BEGIN
	INSERT INTO genero(nome) VALUE (nome);
END$$
DELIMITER ;

# Procedure para cadastrar livro_autor
DELIMITER $$
CREATE PROCEDURE cadastrar_livro_autor(IN livro_codigo INT, autor_codigo INT)
BEGIN
	INSERT INTO livro_autor(livro_codigo, autor_codigo) VALUE (livro_codigo, autor_codigo);
END$$
DELIMITER ;

# Procedure para cadastrar autor
DELIMITER $$
CREATE PROCEDURE cadastrar_autor(IN nome VARCHAR(45))
BEGIN
	INSERT INTO autor(nome) VALUE (nome);
END$$
DELIMITER ;

# Procedure para cadastrar edicao
DELIMITER $$
CREATE PROCEDURE cadastrar_edicao(IN livro_codigo INT, IN editora_codigo INT, IN nome VARCHAR(45), IN data_publicacao DATE)
BEGIN
	INSERT INTO edicao(livro_codigo, editora_codigo, nome, data_publicacao) VALUE (livro_codigo, editora_codigo, nome, data_publicacao);
END$$
DELIMITER ;

# Procedure para cadastrar editora
DELIMITER $$
CREATE PROCEDURE cadastrar_editora(IN nome VARCHAR(45))
BEGIN
	INSERT INTO editora(nome) VALUE (nome);
END$$
DELIMITER ;

# Procedure para alterar livro
DELIMITER $$
CREATE PROCEDURE alterar_livro(IN parametro_codigo INT, IN parametro_nome VARCHAR(45), OUT mensagem VARCHAR(45))
BEGIN
	DECLARE qtd_codigo INT DEFAULT 0;
    
    SELECT COUNT(livro.codigo)
    INTO qtd_codigo
    FROM livro
    WHERE codigo = parametro_codigo;
    
    IF (qtd_codigo > 0) THEN
		UPDATE livro SET nome = parametro_nome WHERE codigo = parametro_codigo;
        SET mensagem = 'Livro alterado!';
	ELSE 
		SET mensagem = 'Falha ao alterar!';
	END IF;
END $$
DELIMITER ;

# Procedure para alterar data reserva
DELIMITER $$
CREATE PROCEDURE alterar_data_reserva(IN parametro_codigo INT, IN parametro_data DATE, OUT mensagem VARCHAR(45))
BEGIN
	DECLARE qtd_codigo INT DEFAULT 0;
    
    SELECT COUNT(reserva.codigo)
    INTO qtd_codigo
    FROM reserva
    WHERE codigo = parametro_codigo;
    
    IF (qtd_codigo > 0) THEN
		UPDATE reserva SET data_reserva = parametro_data WHERE codigo = parametro_codigo;
        SET mensagem = 'Data alterada!';
	ELSE 
		SET mensagem = 'Falha ao alterar!';
	END IF;
END $$
DELIMITER ;

# Procedure para alterar nome do cliente
DELIMITER $$
CREATE PROCEDURE alterar_nome_cliente(IN parametro_codigo INT, IN novo_nome VARCHAR(45), OUT mensagem VARCHAR(45))
BEGIN
	DECLARE qtd_codigo INT DEFAULT 0;
    
    SELECT COUNT(*)
    INTO qtd_codigo
    FROM cliente
    WHERE codigo = parametro_codigo;
    
    IF (qtd_codigo > 0) THEN
		UPDATE cliente SET nome = novo_nome WHERE codigo = parametro_codigo;
        SET mensagem = 'Cliente alterado!';
	ELSE 
		SET mensagem = 'Falha ao alterar!';
	END IF;
END$$
DELIMITER ;

# Procedure para alterar nome do genero
DELIMITER $$
CREATE PROCEDURE alterar_nome_genero(IN parametro_codigo INT, IN novo_nome VARCHAR(45), OUT mensagem VARCHAR(45))
BEGIN
	DECLARE qtd_codigo INT DEFAULT 0;
    
    SELECT COUNT(*)
    INTO qtd_codigo
    FROM genero
    WHERE codigo = parametro_codigo;
    
    IF (qtd_codigo > 0) THEN
		UPDATE genero SET nome = novo_nome WHERE codigo = parametro_codigo;
        SET mensagem = 'Genero alterado!';
	ELSE 
		SET mensagem = 'Falha ao alterar!';
	END IF;
END$$
DELIMITER ;

# Procedure para alterar nome do autor
DELIMITER $$
CREATE PROCEDURE alterar_nome_autor(IN parametro_codigo INT, IN novo_nome VARCHAR(45), OUT mensagem VARCHAR(45))
BEGIN
    DECLARE qtd_codigo INT DEFAULT 0;
    
    SELECT COUNT(*)
    INTO qtd_codigo
    FROM autor
    WHERE codigo = parametro_codigo;
    
    IF (qtd_codigo > 0) THEN
		UPDATE autor SET nome = novo_nome WHERE codigo = parametro_codigo;
        SET mensagem = 'Autor alterado!';
	ELSE 
		SET mensagem = 'Falha ao alterar!';
	END IF;
END$$
DELIMITER ;

# Procedure para alterar nome da edicao
DELIMITER $$
CREATE PROCEDURE alterar_nome_edicao(IN parametro_codigo INT, IN novo_nome VARCHAR(45), OUT mensagem VARCHAR(45))
BEGIN
    DECLARE qtd_codigo INT DEFAULT 0;
    
    SELECT COUNT(*)
    INTO qtd_codigo
    FROM edicao
    WHERE codigo = parametro_codigo;
    
    IF (qtd_codigo > 0) THEN
		UPDATE edicao SET nome = novo_nome WHERE codigo = parametro_codigo;
        SET mensagem = 'Edição alterada!';
	ELSE 
		SET mensagem = 'Falha ao alterar!';
	END IF;
END$$
DELIMITER ;

# Procedure para alterar nome da editora
DELIMITER $$
CREATE PROCEDURE alterar_nome_editora(IN parametro_codigo INT, IN novo_nome VARCHAR(45), OUT mensagem VARCHAR(45))
BEGIN
	DECLARE qtd_codigo INT DEFAULT 0;
    
    SELECT COUNT(*)
    INTO qtd_codigo
    FROM editora
    WHERE codigo = parametro_codigo;
    
    IF (qtd_codigo > 0) THEN
		UPDATE editora SET nome = novo_nome WHERE codigo = parametro_codigo;
        SET mensagem = 'Editora alterada!';
	ELSE 
		SET mensagem = 'Falha ao alterar!';
	END IF;
END$$
DELIMITER ;

# Procedure para remover livro
DELIMITER $$
CREATE PROCEDURE remover_livro(IN parametro_codigo INT, OUT mensagem VARCHAR(45))
BEGIN
	DECLARE qtd_codigo INT DEFAULT 0;
    
    SELECT COUNT(*)
    INTO qtd_codigo
    FROM livro
    WHERE codigo = parametro_codigo;
    
    IF (qtd_codigo > 0) THEN
		DELETE FROM livro WHERE codigo = parametro_codigo;
        SET mensagem = 'Livro removido!';
	ELSE 
		SET mensagem = 'Falha ao remover!';
	END IF;
END $$
DELIMITER ;

# Procedure para remover reserva
DELIMITER $$
CREATE PROCEDURE remover_reserva(IN parametro_codigo INT, OUT mensagem VARCHAR(45))
BEGIN
	DECLARE qtd_codigo INT DEFAULT 0;
    
    SELECT COUNT(*)
    INTO qtd_codigo
    FROM reserva
    WHERE codigo = parametro_codigo;
    
    IF (qtd_codigo > 0) THEN
		DELETE FROM reserva WHERE codigo = parametro_codigo;
        SET mensagem = 'Reserva removido!';
	ELSE 
		SET mensagem = 'Falha ao remover!';
	END IF;
END $$
DELIMITER ;

# Procedure para remover cliente
DELIMITER $$
CREATE PROCEDURE remover_cliente(IN parametro_codigo INT, OUT mensagem VARCHAR(45))
BEGIN
	DECLARE qtd_codigo INT DEFAULT 0;
    
    SELECT COUNT(*)
    INTO qtd_codigo
    FROM cliente
    WHERE codigo = parametro_codigo;
    
    IF (qtd_codigo > 0) THEN
		DELETE FROM cliente WHERE codigo = parametro_codigo;
        SET mensagem = 'Cliente removido!';
	ELSE 
		SET mensagem = 'Falha ao remover!';
	END IF;
END $$
DELIMITER ;

# Procedure para remover genero
DELIMITER $$
CREATE PROCEDURE remover_genero(IN parametro_codigo INT, OUT mensagem VARCHAR(45))
BEGIN
	DECLARE qtd_codigo INT DEFAULT 0;
    
    SELECT COUNT(*)
    INTO qtd_codigo
    FROM genero
    WHERE codigo = parametro_codigo;
    
    IF (qtd_codigo > 0) THEN
		DELETE FROM genero WHERE codigo = parametro_codigo;
        SET mensagem = 'Genero removido!';
	ELSE 
		SET mensagem = 'Falha ao remover!';
	END IF;
END $$
DELIMITER ;

# Procedure para remover autor
DELIMITER $$
CREATE PROCEDURE remover_autor(IN parametro_codigo INT, OUT mensagem VARCHAR(45))
BEGIN
	DECLARE qtd_codigo INT DEFAULT 0;
    
    SELECT COUNT(*)
    INTO qtd_codigo
    FROM autor
    WHERE codigo = parametro_codigo;
    
    IF (qtd_codigo > 0) THEN
		DELETE FROM autor WHERE codigo = parametro_codigo;
        SET mensagem = 'Autor removido!';
	ELSE 
		SET mensagem = 'Falha ao remover!';
	END IF;
END$$
DELIMITER ;

# Procedure para remover edição
DELIMITER $$
CREATE PROCEDURE remover_edicao(IN parametro_codigo INT, OUT mensagem VARCHAR(45))
BEGIN
	DECLARE qtd_codigo INT DEFAULT 0;
    
    SELECT COUNT(*)
    INTO qtd_codigo
    FROM edicao
    WHERE codigo = parametro_codigo;
    
    IF (qtd_codigo > 0) THEN
		DELETE FROM edicao WHERE codigo = parametro_codigo;
        SET mensagem = 'Edição removida!';
	ELSE 
		SET mensagem = 'Falha ao remover!';
	END IF;
END$$
DELIMITER ;

# Procedure para remover editora
DELIMITER $$
CREATE PROCEDURE remover_editora(IN parametro_codigo INT, OUT mensagem VARCHAR(45))
BEGIN
	DECLARE qtd_codigo INT DEFAULT 0;
    
    SELECT COUNT(*)
    INTO qtd_codigo
    FROM editora
    WHERE codigo = parametro_codigo;
    
    IF (qtd_codigo > 0) THEN
		DELETE FROM editora WHERE codigo = parametro_codigo;
        SET mensagem = 'Editora removida!';
	ELSE 
		SET mensagem = 'Falha ao remover!';
	END IF;
END $$
DELIMITER ;
