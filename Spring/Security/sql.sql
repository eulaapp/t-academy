CREATE DATABASE spring_security;

INSERT INTO tb_roles VALUES 
(null, "ROLE_ADMIN"),
(null, "ROLE_USER");

INSERT INTO tb_users VALUES
(null, "$2a$10$W.pEMitV91cVwmqXIPuxjeSkNMJbUazP8YdTTpWXelUfxrf9LlVeS", "ralf"),
(null, "$2a$10$HXqZPAQauSOaotEnCH3tdehjdnYq/r4IeGueC1kCbRrGtrSckxVVe", "larissa");

INSERT INTO tb_users_roles VALUES
(1, 1),
(2, 2);

SELECT * FROM tb_roles;
SELECT * FROM tb_users;