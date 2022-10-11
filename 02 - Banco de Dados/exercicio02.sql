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

#1 - Listar o nome das marcas (sem repetição) e a quantidade de produtos das respectivas marcas.
SELECT ds_marca, COUNT(nm_produto) FROM produtos GROUP BY ds_marca;

#2 - Média dos valores de todos os produtos.
SELECT AVG(vl_produto) AS media FROM produtos;

#3 - Exibir o nome da marca (sem repetição) e a soma dos produtos que fazem parte da respectiva marca.
SELECT ds_marca, SUM(qt_estoque) FROM produtos GROUP BY ds_marca;

#4 - Exibir o nome do produto e o valor em ordem decrescente (do mais caro para o mais barato).
SELECT nm_produto, vl_produto FROM produtos ORDER BY vl_produto DESC;

#5 - Nome e valor do produto mais caro.
SELECT nm_produto, vl_produto FROM produtos
WHERE vl_produto =  (SELECT MAX(vl_produto) FROM produtos);

#6 - Exibir todos os produtos, onde seu valor seja maior ou igual a média de todos os valores cadastrados.
SELECT * FROM produtos WHERE
vl_produto >= (SELECT AVG(vl_produto) FROM produtos);

#7 - Informar o nome do produto, marca, valor e quantidade em estoque, do produto que possui maior estoque.
SELECT nm_produto, ds_marca, vl_produto, qt_estoque FROM produtos
WHERE qt_estoque = (SELECT MAX(qt_estoque) FROM produtos);

#8 - Exibir o nome do produto, marca e valor, onde os valores dos produtos estejam entre R$100,00 e R$500,00.
SELECT nm_produto, ds_marca, vl_produto FROM produtos
WHERE vl_produto >= 100 AND vl_produto <= 500;

#9 - Listar o nome, marca e valor de todos os produtos que sejam mouses, exiba em ordem crescente de preço
# (do menor para o maior).
SELECT nm_produto, ds_marca, vl_produto FROM produtos
WHERE nm_produto = "MOUSE" ORDER BY vl_produto ASC;

#10 - Exiba o nome do produto e a quantidade de letras.
SELECT nm_produto, LENGTH(nm_produto) AS quantidade_letras FROM produtos;

#11 - Troque a marca Dell para Alienware.
UPDATE produtos SET ds_marca = "Alienware" WHERE ds_marca = "Dell";

#12 - Excluir a tabela.
DROP TABLE produtos;