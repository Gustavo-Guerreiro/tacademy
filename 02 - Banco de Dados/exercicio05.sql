CREATE DATABASE exercicio05;

USE exercicio05;

CREATE TABLE marcas (
    cd_marca INT PRIMARY KEY AUTO_INCREMENT,
    nm_marca VARCHAR(20)
);

CREATE TABLE produtos (
    cd_produto INT PRIMARY KEY AUTO_INCREMENT,
    nm_produto VARCHAR(50),
    vl_produto DOUBLE,
    qt_estoque INT,
    cd_marca INT,
    FOREIGN KEY (cd_marca) REFERENCES marcas(cd_marca)
);

INSERT INTO marcas (nm_marca) VALUES
("Nike"),
("Adidas"),
("Colcci"),
("Tommy Hilfiger"),
("Hering"),
("Vans"),
("Vizzano"),
("Aramis"),
("Reserva");

INSERT INTO produtos
    (nm_produto, vl_produto, qt_estoque, cd_marca) VALUES
("Tênis Adidas Performance", 345, 765, 2),
("Tênis Nike Revolution", 769, 1235, 1),
("Blusa feminina rosa", 99, 754, 6),
("Camisa social branca", 180.99, 235, 8),
("Bota Chelsea Lacey", 322, 98, 3),
("Blusa moletom Romance", 150.76, 324, 3),
("Camiseta preta base", 79, 1235, 4),
("Bolsa Colcci Lisa", 249, 112, 3),
("Camisa Adidas Originals", 346, 344, 2),
("Tênis WM preto", 988, 2341, 6),
("Bota Colcci azul", 1540, 143, 3),
("Scarpin feminino salto", 877, 673, 7),
("Camiseta Nike Dri-FIT", 124, 228, 1),
("Camisa polo azul", 233, 549, 8),
("Camisa Polo Tommy Hilfiger", 499, 794, 4),
("Sandália Vizzano", 1540, 83, 7),
("Tênis Adidas Superstar", 769, 326, 2),
("Camiseta algodão verde", 76.99, 1214, 9),
("Short Nike Nk", 298, 683, 1),
("Camisa Aramis geométrica", 355, 1033, 8),
("Bolsa Nike Unissex", 265.29, 596, 1),
("Camiseta Aramis vermelha", 199, 457, 8),
("Boné Tommy Jeans", 204.64, 68, 4),
("Jaqueta Adidas ECO", 609.98, 116, 2);

SELECT * FROM produtos;
SELECT * FROM marcas;

#1 - Exiba o nome do produto, nome da marca e o valor do produto.
SELECT nm_produto, nm_marca, vl_produto FROM produtos
JOIN marcas m on m.cd_marca = produtos.cd_marca;

#2 - Listar obrigatoriamente todas as marcas e a quantidade de produtos cadastrados por marca.
SELECT nm_marca, COUNT(cd_produto) FROM marcas
LEFT JOIN produtos p on marcas.cd_marca = p.cd_marca
GROUP BY nm_marca;

#3 - Exibir o nome do produto e seu valor em ordem decrescente (do maior valor para o menor).
SELECT nm_produto, vl_produto FROM produtos
ORDER BY vl_produto DESC;

#4 - Média dos valores dos produtos por cada marca.
SELECT nm_marca, AVG(vl_produto) AS media FROM produtos
JOIN marcas m on m.cd_marca = produtos.cd_marca
GROUP BY nm_marca;

#5 - Listar nome do produto, valor, nome da marca e quantidade em estoque do produto de maior valor (Haverá dois
# produtos, os dois terão que ser exibidos).
SELECT nm_produto, vl_produto, nm_marca, qt_estoque
FROM produtos JOIN marcas m on m.cd_marca = produtos.cd_marca
WHERE vl_produto = (SELECT MAX(vl_produto) FROM produtos);

#6 - Listar todos os produtos (exiba todos os dados e converta o código da marca para o nome), onde o estoque esteja
# entre 500 e 1000 unidades.
SELECT cd_produto, nm_produto, vl_produto, qt_estoque, nm_marca
FROM produtos JOIN marcas m on m.cd_marca = produtos.cd_marca
WHERE qt_estoque BETWEEN 500 AND 1000;

#7 - Listar todos os produtos (nome, valor e estoque) que contenham os termos: Blusa, Camiseta e Camisa. Exiba em
# ordem decrescente de preço.
SELECT nm_produto, vl_produto, qt_estoque FROM produtos
WHERE nm_produto LIKE "%Blusa%" OR nm_produto LIKE "%Camiseta%"
OR nm_produto LIKE  "%Camisa%" ORDER BY vl_produto DESC;

#8 - Exibir a soma dos valores de cada produto e agrupar por marcas que estejam vinculadas em algum produto.
SELECT nm_marca, SUM(vl_produto) FROM produtos
JOIN marcas m on m.cd_marca = produtos.cd_marca
GROUP BY nm_marca;

#9 - Exibir o nome da marca, onde o produto é o mais caro.
SELECT nm_marca FROM marcas
JOIN produtos p on marcas.cd_marca = p.cd_marca
WHERE vl_produto = (SELECT MAX(vl_produto) FROM produtos);

#10 - Listar todos os produtos (nome e estoque), onde a quantidade em estoque seja maior ou igual a média total do
# estoque contido na tabela de produtos.
SELECT nm_produto, qt_estoque FROM produtos
WHERE qt_estoque > (SELECT AVG(qt_estoque) FROM produtos);

#11 - Excluir todas as tabelas.
DROP TABLE produtos;
DROP TABLE marcas;