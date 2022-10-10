CREATE DATABASE exercicio02;

USE exercicio02;

CREATE TABLE produtos (
    cd_produto INT PRIMARY KEY AUTO_INCREMENT,
    nm_produto VARCHAR(50),
    ds_marca VARCHAR(25),
    vl_produto DOUBLE,
    qt_estoque INT
);

INSERT INTO produtos (nm_produto, ds_marca, vl_produto, qt_estoque) VALUES
("Teclado", "Microsoft", 220, 60),
("Monitor 32", "Samsung", 3700, 20),
("Mouse", "Logitech", 129, 45),
("Impressora", "Epson", 430, 15),
("Mouse", "Microsoft", 199, 50),
("Monitor 27", "LG", 1990.8, 30),
("Cadeira Gamer", "Multilaser", 1170, 20),
("Teclado", "Dell", 110, 50),
("Mouse", "HP", 80, 70),
("Placa de Vídeo - GeForce GTX 1660", "ASUS", 2800, 10),
("SSD de 256GB", "Kingston", 400, 15),
("Processador Core i5 - 10° geração", "Intel", 1800, 10),
("Mouse", "Multilaser", 44.9, 70),
("Monitor 23", "Dell", 1080, 40),
("Teclado", "HP", 119.9, 25);

SELECT * FROM produtos;

#1
SELECT ds_marca, COUNT(nm_produto) FROM produtos GROUP BY ds_marca;

#2
SELECT AVG(vl_produto) AS media FROM produtos;

#3
SELECT ds_marca, SUM(qt_estoque) FROM produtos GROUP BY ds_marca;

#4
SELECT nm_produto, vl_produto FROM produtos ORDER BY vl_produto DESC;

#5
SELECT nm_produto, vl_produto FROM produtos
WHERE vl_produto =  (SELECT MAX(vl_produto) FROM produtos);

#6
SELECT * FROM produtos WHERE
vl_produto >= (SELECT AVG(vl_produto) FROM produtos);

#7
SELECT nm_produto, ds_marca, vl_produto, qt_estoque FROM produtos
WHERE qt_estoque = (SELECT MAX(qt_estoque) FROM produtos);

#8
SELECT nm_produto, ds_marca, vl_produto FROM produtos
WHERE vl_produto >= 100 AND vl_produto <= 500;

#9
SELECT nm_produto, ds_marca, vl_produto FROM produtos
WHERE nm_produto = "MOUSE" ORDER BY vl_produto ASC;

#10
SELECT nm_produto, LENGTH(nm_produto) AS quantidade_letras FROM produtos;

#11
UPDATE produtos SET ds_marca = "Alienware" WHERE ds_marca = "Dell";

#12
DROP TABLE produtos;