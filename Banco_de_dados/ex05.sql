CREATE TABLE marcas(
	codigo_marca INT PRIMARY KEY AUTO_INCREMENT,
    nome_marca VARCHAR(20)
);

DROP TABLE produtos;

CREATE TABLE produtos(
	codigo_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome_produto VARCHAR(50),
    valor_produto DOUBLE,
    quantidade_estoque INT,
    codigo_marca INT,
    FOREIGN KEY (codigo_marca) REFERENCES marcas(codigo_marca)
);

INSERT INTO marcas(nome_marca) VALUES 
('Nike'),
('Adidas'),
('Colcci'),
('Tommy Hilfiger'),
('Hering'),
('Vans'),
('Vizzano'),
('Aramis'),
('Reserva');

select * from marcas;

INSERT INTO produtos(nome_produto, valor_produto, quantidade_estoque, codigo_marca) VALUES 
('Tênis Adidas Performance', 345, 765, 2),
('Tênis Nike Revolution', 769, 1235, 1),
('Blusa feminina rosa', 99, 754, 6),
('Camisa social branca', 180.99, 235, 8),
('Bota Chelsea Lacey', 322, 98, 3),
('Blusa moletom Romance', 150.76, 324, 3),
('Camiseta preta base', 79, 1235, 4),
('Bolsa Colcci Lisa', 249, 112, 3),
('Camisa Adidas Originals', 346, 344, 2),
('Tênis WM preto', 988, 2341, 6),
('Bota Colcci azul', 1540, 143, 3),
('Scarpin feminino salto', 877, 673, 7),
('Camiseta Nike Dri-FIT', 124, 228, 1),
('Camisa polo azul', 233, 549, 8),
('Camisa Polo Tommy Hilfiger', 499, 794, 4),
('Sandália Vizzano', 1540, 83, 7),
('Tênis Adidas Superstar', 769, 326, 9),
('Camiseta algodão verde', 76.99, 1214, 9),
('Short Nike Nk', 289, 683, 1),
('Camisa Aramis geométrica', 355, 1033, 8),
('Bolsa Nike Unissex', 265.29, 596, 1),
('Camiseta Aramis vermelha', 199, 457, 8),
('Boné Tommy Jeans', 204.64, 68, 4),
('Jaqueta Adidas ECO', 609.98, 116, 2);

SELECT
	nome_produto,
    valor_produto,
    marcas.nome_marca
FROM produtos
INNER JOIN marcas
ON marcas.codigo_marca = produtos.codigo_marca;

SELECT
	marcas.nome_marca,
    COUNT(*)
FROM marcas
LEFT JOIN produtos
ON marcas.codigo_marca = produtos.codigo_marca
GROUP BY(marcas.nome_marca);

SELECT nome_produto, valor_produto FROM produtos ORDER BY(valor_produto) DESC;

SELECT 
	marcas.nome_marca,
    AVG(produtos.valor_produto)
AS 'Média dos valores por cada marca'
FROM produtos
INNER JOIN marcas
ON marcas.codigo_marca = produtos.codigo_marca
GROUP BY(marcas.nome_marca);

SELECT 
	produtos.nome_produto,
    produtos.valor_produto,
    marcas.nome_marca,
    produtos.quantidade_estoque
FROM  produtos
INNER JOIN marcas
ON marcas.codigo_marca = produtos.codigo_marca
WHERE produtos.valor_produto = (SELECT MAX(valor_produto) FROM produtos);


SELECT 
	produtos.codigo_produto,
    produtos.nome_produto,
    produtos.valor_produto,
    produtos.quantidade_estoque,
    marcas.nome_marca
FROM produtos 
INNER JOIN marcas
ON marcas.codigo_marca = produtos.codigo_marca
WHERE quantidade_estoque 
BETWEEN 500 AND 1000;

SELECT
	nome_produto,
    valor_produto,
    quantidade_estoque
FROM produtos 
WHERE nome_produto LIKE '%Camiseta%' OR nome_produto LIKE '%Camisa%' OR nome_produto LIKE '%Blusa%';

SELECT
	SUM(produtos.valor_produto),
    marcas.nome_marca
FROM produtos
INNER JOIN marcas
ON marcas.codigo_marca = produtos.codigo_marca
GROUP BY(marcas.nome_marca);

SELECT
	marcas.nome_marca,
    produtos.valor_produto
FROM produtos
INNER JOIN marcas
ON marcas.codigo_marca = produtos.codigo_marca
WHERE produtos.valor_produto = (SELECT MAX(valor_produto) FROM produtos);

SELECT nome_produto, quantidade_estoque FROM produtos WHERE quantidade_estoque >= (SELECT AVG(quantidade_estoque) FROM produtos);

DROP TABLE marcas;
DROP TABLE produtos;

	
