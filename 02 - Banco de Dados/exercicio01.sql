CREATE DATABASE exercicio01;

USE exercicio01;

CREATE TABLE clientes (
    cd_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nm_cliente VARCHAR(40),
    nm_cidade VARCHAR(20),
    nr_idade INT
);

INSERT INTO clientes (nm_cliente, nm_cidade, nr_idade) VALUES
("Érica", "Curitiba", 28),
("Lucas", "Blumenau", 16),
("Larissa", "Florianópolis", 36),
("Murilo", "Joinville", 23),
("Cristine", "Blumenau", 31),
("Robson", "Joinville", 42),
("Mariana", null, 37),
("Jean", "Blumenau", 43),
("Luana", "Pomerode", 19),
("Cleber", "Brusque", 34),
("Hellen", "Blumenau", 28),
("Paulo", "Joinville", 44),
("Alessandra", "São Paulo", 28),
("Dênis", "Blumenau", 37),
("Bianca", "Campinas", 23),
("Gabriel", "São Paulo", 26);

#1
SELECT * FROM clientes;

#2
SELECT COUNT(*) FROM clientes;

#3
SELECT nm_cliente, nr_idade from clientes
         WHERE nr_idade = (
         SELECT MAX(nr_idade) from clientes);

#4
SELECT (nm_cidade) FROM clientes
                   WHERE nm_cidade IS NOT NULL
                   GROUP BY nm_cidade;

#5
SELECT nm_cidade, COUNT(nm_cidade) FROM clientes
                   WHERE nm_cidade IS NOT NULL
                   GROUP BY nm_cidade;

#6
SELECT nm_cliente, nr_idade FROM clientes WHERE nm_cidade IS NULL;

#7
SELECT AVG(nr_idade) AS media from clientes;

#8
SELECT nm_cliente, nr_idade FROM clientes
WHERE nr_idade = (SELECT MIN(nr_idade) FROM clientes);

#9
SELECT nm_cliente, nr_idade FROM clientes
WHERE nr_idade >= (SELECT AVG(nr_idade) FROM clientes);

#10
SELECT nm_cliente, nm_cidade, nr_idade FROM clientes
WHERE nr_idade >= 20 AND nr_idade <= 30;

#11
SELECT nm_cliente, nm_cidade, nr_idade FROM clientes
WHERE nm_cidade = "BLUMENAU" AND nr_idade >=30;

#12
SELECT nm_cliente, nm_cidade FROM clientes
WHERE nm_cidade = "FLORIANÓPOLIS" OR nm_cidade = "CURITIBA";

#13
SELECT nm_cliente FROM clientes
WHERE nm_cliente LIKE ("%L%");

#14
SELECT nm_cliente FROM clientes
ORDER BY nm_cliente;

#15
UPDATE clientes SET nm_cidade = "Blumenau" WHERE nm_cidade IS NULL;

#16
DELETE FROM clientes WHERE nm_cidade != "Blumenau";

#17
DROP TABLE clientes;