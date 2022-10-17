CREATE TABLE clientes(
	codigo_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome_cliente VARCHAR(30),
    email_cliente VARCHAR(50)
);


DELIMITER $$
CREATE PROCEDURE teste(IN nome VARCHAR(30), IN email VARCHAR(50), OUT mensagem VARCHAR(30))
BEGIN
	IF LENGTH(nome) < 3 THEN
    SET mensagem = "Menor que três";
    else
    SET mensagem = "Maior que três";
    END IF;
	#INSERT INTO clientes VALUES (null, nome, email);
END $$
DELIMITER ;

CALL teste('Eula Paula', 'teste@gmail.com', @retorno);
select @retorno;

CALL cadastrar('Eula Paula', 'teste@gmail.com');
DROP PROCEDURE cadastrar;
SELECT * FROM clientes;