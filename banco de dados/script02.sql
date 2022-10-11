# criar banco de dados
CREATE DATABASE projeto;

# selecionar base de dados
USE projeto;

# tabela de marcas
CREATE TABLE marcas(
	codigo_marca INT AUTO_INCREMENT PRIMARY KEY,
    nome_marca VARCHAR(30) NOT NULL
);

INSERT INTO marcas (nome_marca) VALUES 
('Apple'),
('Samsung'),
('Xiaomi');

# tabela de produtos
CREATE TABLE produtos(
	codigo_produtos INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(40) NOT NULL,
    codigo_marca INT, 
    FOREIGN KEY(codigo_marca) REFERENCES marcas(codigo_marca)
);

# inserir produtos
INSERT INTO produtos (nome_produto, codigo_marca) VALUES
('iPhone 13', 1),
('Samsung Galaxy S20', 2),
('iPhone 12', 1);

SELECT * FROM produtos;

# inner join
SELECT
	produtos.nome_produto,
    marcas.nome_marca
FROM produtos
INNER JOIN marcas
ON produtos.codigo_marca = marcas.codigo_marca;

SELECT 
	marcas.nome_marca,
	COUNT(produtos.codigo_marca)
FROM marcas
LEFT JOIN produtos
ON produtos.codigo_marca = marcas.codigo_marca
GROUP BY produtos.codigo_marca;

SELECT *, DATE_FORMAT(NOW(), '%d/%m/%y') AS 'Data', DATE_FORMAT(NOW(), '%H:%i') AS 'Hora' FROM produtos LIMIT 1;

DROP TABLE produtos;
TRUNCATE TABLE marcas;
DROP TABLE marcas;

