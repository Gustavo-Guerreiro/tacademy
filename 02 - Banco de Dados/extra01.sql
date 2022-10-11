CREATE DATABASE extra01;

USE extra01;

CREATE TABLE categoria (
    cd_categoria int PRIMARY KEY AUTO_INCREMENT,
    nm_categoria varchar(50) NOT NULL
);

CREATE TABLE cliente (
    cd_cliente int PRIMARY KEY AUTO_INCREMENT,
    nm_cliente varchar(50) NOT NULL,
    nr_telefone varchar(15) NOT NULL,
    ds_email varchar(50) NOT NULL
);

CREATE TABLE municipio (
    cd_municipio int PRIMARY KEY AUTO_INCREMENT,
    nm_municipio varchar(50) NOT NULL,
    sg_uf char(2) NOT NULL
);

CREATE TABLE endereco (
    cd_endereco int PRIMARY KEY AUTO_INCREMENT,
    nm_logradouro varchar(50) NOT NULL,
    ds_complemento varchar(20) NOT NULL,
    nm_bairo varchar(30) NOT NULL,
    nr_cep char(8) NOT NULL,
    cd_municipio int NOT NULL,
    cd_cliente int NOT NULL,
    FOREIGN KEY (cd_municipio) REFERENCES municipio(cd_municipio),
    FOREIGN KEY (cd_cliente) REFERENCES cliente(cd_cliente)
);

CREATE TABLE item_pedido (
    cd_produto int PRIMARY KEY AUTO_INCREMENT,
    nr_pedido int NOT NULL,
    qt_produto int NOT NULL,
    vl_produto decimal(8,2) NOT NULL,
    vl_total decimal(8,2) NOT NULL
);

CREATE TABLE pedido (
    nr_pedido int PRIMARY KEY AUTO_INCREMENT,
    dt_emissao date NOT NULL,
    cd_cliente int NOT NULL,
    vl_total decimal(8,2) NOT NULL,
    FOREIGN KEY (cd_cliente) REFERENCES cliente(cd_cliente)
);

CREATE TABLE produto (
    cd_produto int PRIMARY KEY AUTO_INCREMENT,
    nm_produto varchar(50) NOT NULL,
    qt_estoque int NOT NULL,
    vl_produto decimal(8,2) NOT NULL,
    cd_categoria int NOT NULL,
    FOREIGN KEY (cd_categoria) REFERENCES categoria(cd_categoria)
);

INSERT INTO categoria (nm_categoria) VALUES
("Frutas e Verduras"),
("Guloseimas"),
("Higiene e Limpeza");

INSERT INTO cliente (nm_cliente, nr_telefone, ds_email)
VALUES
    ("Rodrigo", "99 99999-9999", "rod@email.com"),
    ("Rogério", "88 88888-8888", "rogi@email.com"),
    ("Roberto", "77 77777-7777", "rob@email.com");

INSERT INTO municipio (nm_municipio, sg_uf) VALUES
("Blumenau", "SC"),
("Porto Alegre", "RS");

INSERT INTO endereco (nm_logradouro, ds_complemento, nm_bairo, nr_cep, cd_municipio, cd_cliente)
VALUES
    ("José Caipira", "Casa", "Água Azul", "99999999", 1, 1),
    ("Maria Josefa", "Apto 14", "Água Vermelha", "88888888", 2, 2),
    ("Poifa", "Casa", "Água Rosa", "7777777", 2, 3);

INSERT INTO produto (nm_produto, qt_estoque, vl_produto, cd_categoria)
VALUES
    ("Maçã", 10, 5, 1),
    ("Chocolate", 50, 8, 2);

INSERT INTO pedido (dt_emissao, cd_cliente, vl_total)
VALUES
    (CURRENT_DATE, 1, 5);

INSERT INTO item_pedido (cd_produto, nr_pedido, qt_produto, vl_produto, vl_total)
VALUES
    (1,1, 1, 5, 5);

CREATE VIEW selecionar_endereco_municipio AS
SELECT nm_logradouro, nm_bairo, nm_municipio FROM endereco
    JOIN municipio m on endereco.cd_municipio = m.cd_municipio;

CREATE VIEW selecionar_endereco_com_usuario_municipio AS
SELECT nm_logradouro, nm_bairo, nm_municipio, nm_cliente FROM endereco
JOIN cliente c on c.cd_cliente = endereco.cd_cliente
JOIN municipio m on m.cd_municipio = endereco.cd_municipio;

CREATE VIEW selecionar_item_pedido_com_produto_categoria_cliente AS
SELECT p.nr_pedido,dt_emissao, qt_produto, nm_produto, nm_categoria, nm_cliente FROM item_pedido
JOIN pedido p on item_pedido.nr_pedido = p.nr_pedido
JOIN produto p2 on item_pedido.cd_produto = p2.cd_produto
JOIN categoria c on p2.cd_categoria = c.cd_categoria
JOIN cliente c2 on p.cd_cliente = c2.cd_cliente;

CREATE VIEW selecionar_item_pedido_com_todos_os_dados_disponiveis AS
SELECT p.nr_pedido, dt_emissao, qt_produto, nm_produto, nm_categoria, nm_cliente,
       e.nm_logradouro, nm_municipio FROM item_pedido
JOIN pedido p on item_pedido.nr_pedido = p.nr_pedido
JOIN cliente c on c.cd_cliente = p.cd_cliente
JOIN endereco e on c.cd_cliente = e.cd_cliente
JOIN municipio m on e.cd_municipio = m.cd_municipio
JOIN produto p2 on item_pedido.cd_produto = p2.cd_produto
JOIN categoria c2 on p2.cd_categoria = c2.cd_categoria;

SELECT * FROM selecionar_endereco_municipio;
SELECT * FROM selecionar_endereco_com_usuario_municipio;
SELECT * FROM selecionar_item_pedido_com_produto_categoria_cliente;
SELECT * FROM selecionar_item_pedido_com_todos_os_dados_disponiveis;

