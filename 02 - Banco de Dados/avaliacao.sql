CREATE DATABASE avaliacao;

USE avaliacao;

-- Criação das tabelas e suas chaves primárias.

CREATE TABLE candidato (
    nr_candidato int NOT NULL AUTO_INCREMENT,
    nm_candidato varchar(50) NOT NULL,
    nm_fantasia varchar(50) NOT NULL,
    cd_municipio int NOT NULL,
    nr_partido int NOT NULL,
    cd_cargo int NOT NULL,
    CONSTRAINT candidato_pk PRIMARY KEY (nr_candidato)
);

CREATE TABLE cargo (
    cd_cargo int NOT NULL AUTO_INCREMENT,
    nm_cargo varchar(50) NOT NULL,
    CONSTRAINT cargo_pk PRIMARY KEY (cd_cargo)
);

CREATE TABLE eleitor (
    nr_titulo int NOT NULL,
    nm_eleitor varchar(50) NOT NULL,
    ds_email varchar(50) NOT NULL,
    dt_nascimento date NOT NULL,
    vl_idade int,
    nr_secao int NOT NULL,
    cd_municipio int NOT NULL,
    CONSTRAINT eleitor_pk PRIMARY KEY (nr_titulo)
);

CREATE TABLE estado (
    cd_estado int NOT NULL AUTO_INCREMENT,
    nm_estado varchar(30) NOT NULL,
    sg_estado char(2) NOT NULL,
    CONSTRAINT estado_pk PRIMARY KEY (cd_estado)
);

CREATE TABLE municipio (
    cd_municipio int NOT NULL AUTO_INCREMENT,
    nm_municipio varchar(50) NOT NULL,
    cd_estado int NOT NULL,
    CONSTRAINT municipio_pk PRIMARY KEY (cd_municipio)
);

CREATE TABLE partido (
    nr_partido int NOT NULL,
    nm_partido varchar(50) NOT NULL,
    sg_partido varchar(10) NOT NULL,
    CONSTRAINT partido_pk PRIMARY KEY (nr_partido)
);

CREATE TABLE secao (
    nr_secao int NOT NULL,
    ds_logradouro varchar(50) NOT NULL,
    nr_edificio int NOT NULL,
    ds_bairro varchar(50)  NOT NULL,
    ds_complemento varchar(50)  NOT NULL,
    nr_cep char(8) NOT NULL,
    nr_urna int NOT NULL,
    nr_zona_eleitoral int NOT NULL,
    CONSTRAINT secao_pk PRIMARY KEY (nr_secao)
);

CREATE TABLE urna (
    nr_urna int NOT NULL,
    nm_modelo varchar(50) NOT NULL,
    CONSTRAINT urna_pk PRIMARY KEY (nr_urna)
);

CREATE TABLE voto (
    cd_voto int NOT NULL AUTO_INCREMENT,
    dt_registro date NOT NULL,
    nr_candidato int NOT NULL,
    cd_cargo int NOT NULL,
    nr_urna int NOT NULL,
    nr_partido int NOT NULL,
    CONSTRAINT voto_pk PRIMARY KEY (cd_voto)
);

CREATE TABLE zona_eleitoral (
    nr_zona_eleitoral int NOT NULL,
    cd_estado int NOT NULL,
    CONSTRAINT zona_eleitoral_pk PRIMARY KEY (nr_zona_eleitoral)
);

-- Definição das chaves estrangeiras.

ALTER TABLE candidato ADD CONSTRAINT candidato_cargo FOREIGN KEY candidato_cargo (cd_cargo)
    REFERENCES cargo (cd_cargo);

ALTER TABLE candidato ADD CONSTRAINT candidato_municipio FOREIGN KEY candidato_municipio (cd_municipio)
    REFERENCES municipio (cd_municipio);

ALTER TABLE candidato ADD CONSTRAINT candidato_partido FOREIGN KEY candidato_partido (nr_partido)
    REFERENCES partido (nr_partido);

ALTER TABLE eleitor ADD CONSTRAINT eleitor_municipio FOREIGN KEY eleitor_municipio (cd_municipio)
    REFERENCES municipio (cd_municipio);

ALTER TABLE eleitor ADD CONSTRAINT eleitor_secao FOREIGN KEY eleitor_secao (nr_secao)
    REFERENCES secao (nr_secao);

ALTER TABLE municipio ADD CONSTRAINT municipio_estado FOREIGN KEY municipio_estado (cd_estado)
    REFERENCES estado (cd_estado);

ALTER TABLE secao ADD CONSTRAINT secao_urna FOREIGN KEY secao_urna (nr_urna)
    REFERENCES urna (nr_urna);

ALTER TABLE secao ADD CONSTRAINT secao_zona_eleitoral FOREIGN KEY secao_zona_eleitoral (nr_zona_eleitoral)
    REFERENCES zona_eleitoral (nr_zona_eleitoral);

ALTER TABLE voto ADD CONSTRAINT voto_candidato FOREIGN KEY voto_candidato (nr_candidato)
    REFERENCES candidato (nr_candidato);

ALTER TABLE voto ADD CONSTRAINT voto_cargo FOREIGN KEY voto_cargo (cd_cargo)
    REFERENCES cargo (cd_cargo);

ALTER TABLE voto ADD CONSTRAINT voto_partido FOREIGN KEY voto_partido (nr_partido)
    REFERENCES partido (nr_partido);

ALTER TABLE voto ADD CONSTRAINT voto_urna FOREIGN KEY voto_urna (nr_urna)
    REFERENCES urna (nr_urna);

ALTER TABLE zona_eleitoral ADD CONSTRAINT zona_eleitoral_estado FOREIGN KEY zona_eleitoral_estado (cd_estado)
    REFERENCES estado (cd_estado);

-- Procedure de cadastro de estado
delimiter $$
CREATE PROCEDURE cadastrar_estado(
    IN nome VARCHAR(30), IN sigla CHAR(2), OUT mensagem VARCHAR(30))
BEGIN
    IF LENGTH(nome) >= 4 AND NOT EXISTS (SELECT * FROM estado WHERE nm_estado = nome)
    AND NOT EXISTS (SELECT * FROM estado WHERE sg_estado = sigla) THEN INSERT INTO
    estado (nm_estado, sg_estado) VALUES (nome, sigla);
        SET mensagem = 'Estado cadastrado';
    ELSE
        SET mensagem = 'Erro no cadastro do estado';
    END IF;
END $$
delimiter ;

-- Cadastrando os estados
CALL cadastrar_estado('Rio Grande do Sul', 'RS', @mensagem);
CALL cadastrar_estado('Santa Catarina', 'SC', @mensagem);
CALL cadastrar_estado('Paraná', 'PR', @mensagem);
CALL cadastrar_estado('São Paulo', 'SP', @mensagem);
CALL cadastrar_estado('Rio de Janeiro', 'RJ', @mensagem);
CALL cadastrar_estado('Espírito Santo', 'ES', @mensagem);
CALL cadastrar_estado('Minas Gerais', 'MG', @mensagem);
CALL cadastrar_estado('Mato Grosso', 'MT', @mensagem);
CALL cadastrar_estado('Mato Grosso do Sul', 'MS', @mensagem);
CALL cadastrar_estado('Goiás', 'GO', @mensagem);

-- Alterando estados
DELIMITER $$
CREATE PROCEDURE alterar_estado(IN sigla_atual CHAR(2), IN novo_nome VARCHAR(30),
    IN nova_sigla VARCHAR(30), OUT mensagem VARCHAR(30))
BEGIN
    IF EXISTS (SELECT * FROM estado WHERE sg_estado = sigla_atual) AND LENGTH(novo_nome) >= 4 THEN
        UPDATE estado SET nm_estado = novo_nome, sg_estado = nova_sigla
        WHERE sg_estado = sigla_atual;
        SET mensagem = 'Dados alterados com sucesso';
    ELSE
        SET mensagem = 'Falha na alteração de dados';
    END IF;
END $$
DELIMITER ;

-- Excluindo estados
DELIMITER $$
CREATE PROCEDURE excluir_estado(IN sigla CHAR(2), OUT mensagem VARCHAR(30))
BEGIN
    IF EXISTS(SELECT * FROM estado WHERE sg_estado = sigla) THEN
        DELETE FROM estado WHERE sg_estado = sigla;
        SET mensagem = 'Estado escluído com sucesso';
    ELSE
        SET mensagem = 'Falha em excluir o estado';
    END IF;
END $$
DELIMITER ;

-- Procedure de cadastro de municipio
DELIMITER $$
CREATE PROCEDURE cadastrar_municipio(
    IN nome VARCHAR(30), IN sigla_estado CHAR(2), OUT mensagem VARCHAR(30))
BEGIN
    IF NOT nome = ' ' AND EXISTS
    (SELECT sg_estado FROM estado WHERE sg_estado = sigla_estado)
    AND NOT EXISTS(SELECT * FROM municipio WHERE nm_municipio = nome) THEN
        INSERT INTO municipio (nm_municipio, cd_estado) VALUES
        (nome, (SELECT cd_estado FROM estado WHERE sg_estado= sigla_estado LIMIT 1));
        SET mensagem = 'Municipio cadastrado';
    ELSE
        SET mensagem = 'Erro no cadastro do municipio';
    END IF;
END $$
DELIMITER ;


-- Cadastrando municipios
CALL cadastrar_municipio('Blumenau', 'SC', @mensagem);
CALL cadastrar_municipio('Joinville', 'SC', @mensagem);
CALL cadastrar_municipio('São Paulo', 'SP', @mensagem);
CALL cadastrar_municipio('Curitiba', 'PR', @mensagem);
CALL cadastrar_municipio('Rio de Janeiro', 'RJ', @mensagem);
CALL cadastrar_municipio('Niterói', 'RJ', @mensagem);
CALL cadastrar_municipio('Campinas', 'SP', @mensagem);
CALL cadastrar_municipio('Porto Alegre', 'RS', @mensagem);
CALL cadastrar_municipio('Goiânia', 'GO', @mensagem);
CALL cadastrar_municipio('Campo Grande', 'MS', @mensagem);

-- Procedure para alteração de dados do municipio
DELIMITER $$
CREATE PROCEDURE alterar_municipio (IN nome VARCHAR(50), IN novo_nome VARCHAR(50),
    IN sg_novo_estado CHAR(2), OUT mensagem VARCHAR(30))
BEGIN
    IF EXISTS(SELECT * FROM municipio WHERE nm_municipio = nome)
    AND EXISTS(SELECT * FROM estado WHERE sg_estado = sg_novo_estado) THEN
        UPDATE municipio SET nm_municipio = novo_nome,
        cd_estado = (SELECT cd_estado FROM estado WHERE sg_estado = sg_novo_estado LIMIT 1)
        WHERE nm_municipio = nome;
        SET mensagem = 'Cadastro realizado';
    ELSE
        SET mensagem = 'Cadastro não realizado';
    END IF;
END $$
DELIMITER ;

-- Procedure para excluir municipios
DELIMITER $$
CREATE PROCEDURE excluir_municipio (IN nome VARCHAR(50), OUT mensagem VARCHAR(30))
BEGIN
    IF EXISTS(SELECT * FROM municipio WHERE nm_municipio = nome) THEN
        DELETE FROM municipio WHERE nm_municipio = nome;
        SET mensagem = 'Municipio excluido';
    ELSE
        SET mensagem = 'Falha em excluir municipio';
    END IF;
END $$
DELIMITER ;

-- Procedure para cadastrar zona eleitoral
DELIMITER $$
CREATE PROCEDURE cadastrar_zona_eleitoral
    (IN numero INT, IN sigla_estado CHAR(2), OUT mensagem VARCHAR(30))
BEGIN
    IF EXISTS(SELECT * FROM estado WHERE sg_estado = sigla_estado) THEN
        INSERT INTO zona_eleitoral VALUES (numero, (SELECT cd_estado FROM estado WHERE sg_estado = sigla_estado));
        SET mensagem = 'Zona eleitoral cadastrada';
    ELSE
        SET mensagem = 'Zona eleitoral não cadastrada';
    END IF;
END $$
DELIMITER ;

-- Cadastrando zonas eleitorais
CALL cadastrar_zona_eleitoral(240003, 'SC', @mensagem);
CALL cadastrar_zona_eleitoral(240004, 'SC', @mensagem);
CALL cadastrar_zona_eleitoral(260158, 'SP', @mensagem);
CALL cadastrar_zona_eleitoral(260155, 'SP', @mensagem);
CALL cadastrar_zona_eleitoral(260043, 'SP', @mensagem);
CALL cadastrar_zona_eleitoral(140136, 'PR', @mensagem);
CALL cadastrar_zona_eleitoral(140099, 'PR', @mensagem);
CALL cadastrar_zona_eleitoral(140044, 'PR', @mensagem);
CALL cadastrar_zona_eleitoral(210091, 'RS', @mensagem);
CALL cadastrar_zona_eleitoral(210098, 'RS', @mensagem);

-- Alterar zona eleitoral
DELIMITER $$
CREATE PROCEDURE alterar_zona_eleitoral (IN numero INT, IN novo_numero INT,
    IN novo_estado CHAR(2), OUT mensagem VARCHAR(30))
BEGIN
    IF EXISTS(SELECT * FROM zona_eleitoral WHERE nr_zona_eleitoral = numero) THEN
        UPDATE zona_eleitoral SET nr_zona_eleitoral = novo_numero,
                                  cd_estado = (SELECT cd_estado FROM estado WHERE sg_estado = novo_estado)
        WHERE nr_zona_eleitoral = numero;
        SET mensagem = 'Zona alterada';
    ELSE
        SET mensagem = 'Zona não alterada';
    END IF;
END $$
DELIMITER ;

-- Excluir zona eleitoral
DELIMITER $$
CREATE PROCEDURE excluir_zona_eleitoral (IN numero INT, OUT mensagem VARCHAR(30))
BEGIN
    IF EXISTS(SELECT * FROM zona_eleitoral WHERE nr_zona_eleitoral = numero) THEN
        DELETE FROM zona_eleitoral WHERE nr_zona_eleitoral = numero;
        SET mensagem = 'Zona excluida';
    ELSE
        SET mensagem = 'Falha em excluir zona';
    END IF;
END $$
DELIMITER ;

-- Procedure para cadastrar urna
DELIMITER $$
CREATE PROCEDURE cadastrar_urna
    (IN numero INT, IN modelo VARCHAR(50), OUT mensagem VARCHAR(30))
BEGIN
    IF LENGTH(modelo) <> 0 THEN
        INSERT INTO urna VALUES (numero, modelo);
        SET mensagem = 'Urna cadastrada';
    ELSE
        SET mensagem = 'Urna não cadastrada';
    END IF;
END $$
DELIMITER ;

-- Cadastrando urnas
CALL cadastrar_urna(1004, 'UE 2020', @mensagem);
CALL cadastrar_urna(2872, 'UE 2020', @mensagem);
CALL cadastrar_urna(3240, 'UE 2020', @mensagem);
CALL cadastrar_urna(1195, 'UE 2020', @mensagem);
CALL cadastrar_urna(4598, 'UE 2015', @mensagem);
CALL cadastrar_urna(7985, 'UE 2015', @mensagem);
CALL cadastrar_urna(4793, 'UE 2015', @mensagem);
CALL cadastrar_urna(9875, 'UE 2013', @mensagem);
CALL cadastrar_urna(6547, 'UE 2013', @mensagem);
CALL cadastrar_urna(5473, 'UE 2011', @mensagem);

-- Alterar urna
DELIMITER $$
CREATE PROCEDURE alterar_urna (IN numero INT, IN novo_numero INT,
    IN novo_modelo VARCHAR(50), OUT mensagem VARCHAR(30))
BEGIN
    IF EXISTS(SELECT * FROM zona_eleitoral WHERE nr_zona_eleitoral = numero) THEN
        UPDATE zona_eleitoral SET nr_zona_eleitoral = novo_numero,
                                  cd_estado = (SELECT cd_estado FROM estado WHERE sg_estado = novo_estado)
        WHERE nr_zona_eleitoral = numero;
        SET mensagem = 'Zona cadastrada';
    ELSE
        SET mensagem = 'Zona não cadastrada';
    END IF;
END $$
DELIMITER ;

/*
-- Cadastrar seção eleitoral
DELIMITER $$
CREATE PROCEDURE cadastrar_secao
    (IN numero INT, IN logradouro VARCHAR(50),
    IN numero_edificio INT,IN bairro VARCHAR(50),
    IN complement VARCHAR(50), cep CHAR(8),

    OUT mensagem VARCHAR(30))
BEGIN
    IF EXISTS(SELECT * FROM estado WHERE sg_estado = sigla_estado) THEN
        INSERT INTO zona_eleitoral VALUES (numero, (SELECT cd_estado FROM estado WHERE sg_estado = sigla_estado));
        SET mensagem = 'Zona eleitoral cadastrada';
    ELSE
        SET mensagem = 'Zona eleitoral não cadastrada';
    END IF;
END $$
DELIMITER ;
*/