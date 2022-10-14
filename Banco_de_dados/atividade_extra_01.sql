CREATE TABLE autor(
	codigo_autor INT PRIMARY KEY AUTO_INCREMENT,
	nome_autor VARCHAR(40)
);

CREATE TABLE livro(
	codigo_livro INT PRIMARY KEY AUTO_INCREMENT,
	codigo_editora INT,
    nome_livro VARCHAR(50),
    codigo_autor INT,
    FOREIGN KEY(codigo_autor) REFERENCES autor(codigo_autor)
);

CREATE TABLE genero(
	codigo_genero INT PRIMARY KEY AUTO_INCREMENT,
	nome_genero VARCHAR(30)
);

CREATE TABLE cliente(
	codigo_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome_cliente VARCHAR(30)
);

CREATE TABLE reserva(
	codigo_reserva INT PRIMARY KEY AUTO_INCREMENT,
    data_reserva DATE
);

CREATE TABLE editora(
	codigo_editora INT PRIMARY KEY AUTO_INCREMENT,
    nome_editora VARCHAR(20)
);

CREATE TABLE reserva_livro(
	codigo_autor INT,
    codigo_editora INT,
    codigo_livro INT,
    codigo_genero INT,
    codigo_cliente INT,
    codigo_reserva INT
);

INSERT INTO autor(nome_autor) VALUES
('Jane Austen'),
('Stephen King'),
('Machado de Assis'),
('Ligia Fagundes Telles'),
('Clarice Lispector');

INSERT INTO livro(codigo_editora, nome_livro, codigo_autor) VALUES
(1,'Orgulho e Preconceito', 1),
(1, 'It: A coisa', 2),
(3,'Dom Casmurro', 3),
(2,'Emma', 1),
(3,'Felicidade Clandestina', 5),
(2,'Memórias póstumas de Brás Cubas', 3);

INSERT INTO genero(nome_genero) VALUES
('Romance'),
('Terror'),
('Comédia');

INSERT INTO cliente(nome_cliente) VALUES
('Ana Luiza'),
('Joana Rocha'),
('Maria Fernanda'),
('Angela Vitoria'),
('Gustavo Henrique'),
('Ulisses Anjos'),
('Catarina Augusta'),
('Joaquin José');

INSERT INTO reserva(data_reserva) VALUES
('2022-05-03'),
('2022-03-16'),
('2021-12-18'),
('2021-06-25'),
('2018-04-08'),
('2020-11-07'),
('2022-06-21'),
('2020-09-15');

INSERT INTO editora(nome_editora) VALUES 
('Rocco'),
('Companhia das Letras'),
('Saraiva');

INSERT INTO reserva_livro(codigo_editora, codigo_autor, codigo_livro, codigo_genero, codigo_cliente, codigo_reserva) VALUES
(1,1,1,2,6,4),
(1,2,2,1,3,1),
(3,3,3,3,2,3),
(3,5,5,1,4,2),
(3,5,5,1,5,6);

CREATE VIEW selecionar_livros_cadastrados AS
SELECT
	livro.nome_livro,
    autor.nome_autor
FROM livro
INNER JOIN autor
ON livro.codigo_autor = autor.codigo_autor;

SELECT * FROM selecionar_livros_cadastrados;

CREATE VIEW quantidade_livros_autores AS
SELECT
	COUNT(*),
    autor.nome_autor
FROM livro
INNER JOIN autor
ON livro.codigo_autor = autor.codigo_autor
GROUP BY(autor.nome_autor);

SELECT * FROM quantidade_livros_autores;

CREATE VIEW registro_reserva AS
SELECT
	livro.nome_livro,
    autor.nome_autor,
    reserva.data_reserva
FROM reserva_livro
INNER JOIN autor
ON autor.codigo_autor = reserva_livro.codigo_autor
INNER JOIN livro
ON livro.codigo_livro = reserva_livro.codigo_livro
INNER JOIN reserva
ON reserva.codigo_reserva = reserva_livro.codigo_reserva;

SELECT * FROM registro_reserva;

CREATE VIEW autores_com_livros_genero_romance AS
SELECT 
	autor.nome_autor,
    livro.nome_livro,
    genero.nome_genero
FROM reserva_livro
INNER JOIN autor
ON autor.codigo_autor = reserva_livro.codigo_autor
INNER JOIN livro
ON livro.codigo_livro = reserva_livro.codigo_livro
INNER JOIN genero
ON genero.codigo_genero = reserva_livro.codigo_genero
WHERE genero.nome_genero = 'Romance';

SELECT * FROM autores_com_livros_genero_romance;

CREATE VIEW autores_com_livros_genero_terror AS
SELECT 
	autor.nome_autor,
    livro.nome_livro,
    genero.nome_genero
FROM reserva_livro
INNER JOIN autor
ON autor.codigo_autor = reserva_livro.codigo_autor
INNER JOIN livro
ON livro.codigo_livro = reserva_livro.codigo_livro
INNER JOIN genero
ON genero.codigo_genero = reserva_livro.codigo_genero
WHERE genero.nome_genero = 'Terror';

SELECT * FROM autores_com_livros_genero_terror;

CREATE VIEW clientes_com_reserva AS
SELECT
	cliente.nome_cliente,
    livro.nome_livro,
    autor.nome_autor,
    genero.nome_genero,
    reserva.data_reserva
FROM reserva_livro
INNER JOIN cliente
ON cliente.codigo_cliente = reserva_livro.codigo_cliente
INNER JOIN livro
ON livro.codigo_livro = reserva_livro.codigo_livro
INNER JOIN autor
ON autor.codigo_autor = reserva_livro.codigo_autor
INNER JOIN reserva
ON reserva.codigo_reserva = reserva_livro.codigo_reserva
INNER JOIN genero
ON genero.codigo_genero = reserva_livro.codigo_genero;

SELECT * FROM clientes_com_reserva;

CREATE VIEW clientes_que_reserveram_livro_genero_comedia AS
SELECT
	cliente.nome_cliente,
    livro.nome_livro,
    autor.nome_autor,
    genero.nome_genero,
    reserva.data_reserva
FROM reserva_livro
INNER JOIN cliente
ON cliente.codigo_cliente = reserva_livro.codigo_cliente
INNER JOIN livro
ON livro.codigo_livro = reserva_livro.codigo_livro
INNER JOIN autor
ON autor.codigo_autor = reserva_livro.codigo_autor
INNER JOIN reserva
ON reserva.codigo_reserva = reserva_livro.codigo_reserva
INNER JOIN genero
ON genero.codigo_genero = reserva_livro.codigo_genero
WHERE genero.nome_genero = 'Comédia';

SELECT * FROM clientes_que_reserveram_livro_genero_comedia;

CREATE VIEW listar_todos_dados AS
SELECT
	editora.nome_editora,
    livro.nome_livro,
    autor.nome_autor,
    cliente.nome_cliente,
    reserva.data_reserva,
    genero.nome_genero,
    reserva_livro.codigo_editora
FROM reserva_livro
INNER JOIN editora
ON editora.codigo_editora = reserva_livro.codigo_editora
INNER JOIN livro
ON livro.codigo_livro = reserva_livro.codigo_livro
INNER JOIN autor
ON autor.codigo_autor = reserva_livro.codigo_autor
INNER JOIN cliente 
ON cliente.codigo_cliente = reserva_livro.codigo_cliente
INNER JOIN genero
ON genero.codigo_genero = reserva_livro.codigo_genero
INNER JOIN reserva
ON reserva.codigo_reserva = reserva_livro.codigo_reserva;

SELECT * FROM listar_todos_dados;

CREATE VIEW listar_livros_saraiva AS
SELECT
	editora.nome_editora,
    livro.nome_livro,
    autor.nome_autor,
    cliente.nome_cliente,
    reserva.data_reserva,
    genero.nome_genero,
    reserva_livro.codigo_editora
FROM reserva_livro
INNER JOIN editora
ON editora.codigo_editora = reserva_livro.codigo_editora
INNER JOIN livro
ON livro.codigo_livro = reserva_livro.codigo_livro
INNER JOIN autor
ON autor.codigo_autor = reserva_livro.codigo_autor
INNER JOIN cliente 
ON cliente.codigo_cliente = reserva_livro.codigo_cliente
INNER JOIN genero
ON genero.codigo_genero = reserva_livro.codigo_genero
INNER JOIN reserva
ON reserva.codigo_reserva = reserva_livro.codigo_reserva
WHERE editora.nome_editora = 'Saraiva';

SELECT * FROM listar_livros_saraiva;

CREATE VIEW listar_livros_rocco AS
SELECT
	editora.nome_editora,
    livro.nome_livro,
    autor.nome_autor,
    cliente.nome_cliente,
    reserva.data_reserva,
    genero.nome_genero,
    reserva_livro.codigo_editora
FROM reserva_livro
INNER JOIN editora
ON editora.codigo_editora = reserva_livro.codigo_editora
INNER JOIN livro
ON livro.codigo_livro = reserva_livro.codigo_livro
INNER JOIN autor
ON autor.codigo_autor = reserva_livro.codigo_autor
INNER JOIN cliente 
ON cliente.codigo_cliente = reserva_livro.codigo_cliente
INNER JOIN genero
ON genero.codigo_genero = reserva_livro.codigo_genero
INNER JOIN reserva
ON reserva.codigo_reserva = reserva_livro.codigo_reserva
WHERE editora.nome_editora = 'Rocco';

SELECT * FROM listar_livros_rocco;


	



    

