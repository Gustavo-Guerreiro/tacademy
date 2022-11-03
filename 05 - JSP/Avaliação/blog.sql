DROP DATABASE blog;

CREATE DATABASE blog;

USE blog;

CREATE TABLE usuario (
     cd_usuario INTEGER AUTO_INCREMENT,
     nm_usuario VARCHAR(50) NOT NULL,
     fg_tipo CHAR(1) NOT NULL,
     fg_banido CHAR(1) NOT NULL DEFAULT 'N',
     ds_email VARCHAR(50) NOT NULL UNIQUE,
     vl_senha CHAR(128) NOT NULL,
     PRIMARY KEY (cd_usuario)
);

CREATE TABLE postagem (
    cd_postagem INTEGER AUTO_INCREMENT,
    nm_cliente VARCHAR(50) NOT NULL,
    ds_titulo VARCHAR(100) NOT NULL,
    ds_mensagem VARCHAR(255) NOT NULL,
    hr_postagem DATETIME DEFAULT NOW(),
    cd_usuario INTEGER,
    PRIMARY KEY (cd_postagem),
    FOREIGN KEY (cd_usuario) REFERENCES usuario(cd_usuario)
);

CREATE TABLE comentario (
    cd_comentario INTEGER AUTO_INCREMENT,
    nm_cliente VARCHAR(50) NOT NULL,
    ds_mensagem VARCHAR(150) NOT NULL,
    cd_postagem INTEGER NOT NULL,
    hr_postagem DATETIME DEFAULT NOW(),
    fg_aceito CHAR(1) NOT NULL DEFAULT 'A',
    cd_usuario INTEGER,
    PRIMARY KEY (cd_comentario),
    FOREIGN KEY (cd_postagem) references postagem(cd_postagem),
    FOREIGN KEY (cd_usuario) REFERENCES  usuario(cd_usuario)
);

-- Criando usuário de administrador
INSERT INTO usuario (nm_usuario, fg_tipo, ds_email, vl_senha) VALUES
('Admin', 'A', 'admin@admin.com', SHA2('admin', 512));

