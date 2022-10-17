-- Script feito por Gustavo Guerreiro

DROP DATABASE avaliacao;
-- Criando banco de dados para avaliação
CREATE DATABASE avaliacao;

-- Conectando ao banco de dados
USE avaliacao;

-- Criação das tabelas e suas chaves primárias.
CREATE TABLE candidato (
    nr_candidato int NOT NULL,
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
    nr_cpf char(11) NOT NULL,
    ds_email varchar(50) NOT NULL,
    dt_nascimento date NOT NULL,
    vl_idade int NULL,
    nr_secao int NOT NULL,
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
    nr_candidatos INT DEFAULT 0,
    CONSTRAINT partido_pk PRIMARY KEY (nr_partido)
);

CREATE TABLE secao (
    nr_secao int NOT NULL,
    ds_logradouro varchar(50) NOT NULL,
    nr_edificio int NOT NULL,
    ds_bairro varchar(50) NOT NULL,
    ds_complemento varchar(50) NULL,
    nr_cep char(8) NOT NULL,
    cd_municipio int NOT NULL,
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

-- Chaves estrangeiras
ALTER TABLE candidato ADD CONSTRAINT candidato_cargo FOREIGN KEY candidato_cargo (cd_cargo)
    REFERENCES cargo (cd_cargo);

ALTER TABLE candidato ADD CONSTRAINT candidato_municipio FOREIGN KEY candidato_municipio (cd_municipio)
    REFERENCES municipio (cd_municipio);

ALTER TABLE candidato ADD CONSTRAINT candidato_partido FOREIGN KEY candidato_partido (nr_partido)
    REFERENCES partido (nr_partido);

ALTER TABLE eleitor ADD CONSTRAINT eleitor_secao FOREIGN KEY eleitor_secao (nr_secao)
    REFERENCES secao (nr_secao);

ALTER TABLE municipio ADD CONSTRAINT municipio_estado FOREIGN KEY municipio_estado (cd_estado)
    REFERENCES estado (cd_estado);

ALTER TABLE secao ADD CONSTRAINT secao_municipio FOREIGN KEY secao_municipio (cd_municipio)
    REFERENCES municipio (cd_municipio);

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


-- Triggers

-- Criar triggers para cadastrar idade do eleitor
CREATE TRIGGER calcular_idade_inserir
BEFORE INSERT ON eleitor
FOR EACH ROW
SET NEW.vl_idade = DATEDIFF(CURRENT_DATE, NEW.dt_nascimento) /365.25;

CREATE TRIGGER calcular_idade_update
BEFORE UPDATE ON eleitor
FOR EACH ROW
SET NEW.vl_idade = DATEDIFF(CURRENT_DATE, NEW.dt_nascimento) /365.25;

-- Criar triggers para atualizar número de candidatos no partido
CREATE TRIGGER adicionou_candidato
AFTER INSERT ON candidato
FOR EACH ROW
UPDATE partido SET nr_candidatos = nr_candidatos + 1 WHERE nr_partido = NEW.nr_partido;

CREATE TRIGGER removeu_candidato
AFTER DELETE ON candidato
FOR EACH ROW
UPDATE partido SET nr_candidatos = nr_candidatos - 1 WHERE nr_partido = OLD.nr_partido;

DELIMITER $$
CREATE TRIGGER alterou_candidato
AFTER UPDATE ON candidato
FOR EACH ROW
BEGIN
UPDATE partido SET nr_candidatos = nr_candidatos - 1 WHERE nr_partido = OLD.nr_partido;
UPDATE partido SET nr_candidatos = nr_candidatos + 1 WHERE nr_partido = NEW.nr_partido;
END;
DELIMITER ;


-- Procedures

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
    (SELECT sg_estado FROM estado WHERE sg_estado = sigla_estado) THEN
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
CALL cadastrar_urna(9889, 'UE 2011', @mensagem);

-- Alterar urna
DELIMITER $$
CREATE PROCEDURE alterar_urna (IN numero INT, IN novo_numero INT,
    IN novo_modelo VARCHAR(50), OUT mensagem VARCHAR(30))
BEGIN
    IF EXISTS(SELECT * FROM urna WHERE nr_urna = numero) THEN
        UPDATE urna SET nr_urna = novo_numero,
                        nm_modelo = novo_modelo
        WHERE nr_urna = numero;
        SET mensagem = 'Urna alterada';
    ELSE
        SET mensagem = 'Urna não alterada';
    END IF;
END $$
DELIMITER ;

-- Remover urna
DELIMITER $$
CREATE PROCEDURE remover_urna (IN numero INT, OUT mensagem VARCHAR(30))
BEGIN
    IF EXISTS(SELECT * FROM urna WHERE nr_urna = numero) THEN
        DELETE FROM urna WHERE nr_urna = numero;
        SET mensagem = 'Urna removida';
    ElSE
        SET mensagem = 'Urna não removida';
    END IF;
END $$
DELIMITER ;


-- Cadastrar seção eleitoral
DELIMITER $$
CREATE PROCEDURE cadastrar_secao(
    IN numero INT,
    IN logradouro VARCHAR(50),
    IN numero_edificio INT,
    IN bairro VARCHAR(50),
    IN complemento VARCHAR(50),
    IN cep CHAR(8),
    IN municipio INT,
    IN urna INT,
    IN zona_eleitoral INT,
    OUT mensagem VARCHAR(30))
BEGIN
    IF NOT cep LIKE '% %' AND LENGTH(cep) = 8 THEN
        INSERT INTO secao VALUES
        (numero, logradouro, numero_edificio, bairro, complemento, cep, municipio, urna, zona_eleitoral);
        SET mensagem = 'Seção eleitoral cadastrada';
    ELSE
        SET mensagem = 'Seção eleitoral não cadastrada';
    END IF;
END $$
DELIMITER ;

-- Cadastrando seções
CALL cadastrar_secao(25, 'Rua Maria Joana',
    50, 'Água', null, '15482123', 1,1004, 240003, @mensagem);
CALL cadastrar_secao(50, 'Avenida José das Flores',
    47, 'Flores', null, '75132123', 1, 2872, 240003, @mensagem);
CALL cadastrar_secao(41, 'Rua Rogério Friederich',
    20, 'Centro', null, '75142123', 2, 3240, 210098, @mensagem);
CALL cadastrar_secao(86, 'Avenida Jorge Kranken',
    20, 'Centro', null, '24687521', 3, 1195, 210098, @mensagem);
CALL cadastrar_secao(78, 'Rua Bonita',
    20, 'Centro', null, '19521571', 2, 4598, 210098, @mensagem);
CALL cadastrar_secao(21, 'Rua Legal',
    564, 'Centro', null, '84561111', 2, 7985,  260158, @mensagem);
CALL cadastrar_secao(88, 'Rua Massa',
    800, 'Centro', null, '54872333', 4, 4793, 260158, @mensagem);
CALL cadastrar_secao(95, 'Rua Azul',
    23, 'Centro', null, '32145656', 2, 9875, 140136, @mensagem);
CALL cadastrar_secao(64, 'Rua Azul',
    54, 'Centro', null, '78524656', 2, 6547, 140136, @mensagem);
CALL cadastrar_secao(68, 'Rua Azul',
    54, 'Centro', null, '78524656', 2, 5473, 140136, @mensagem);

-- Procedure para alterar seções
DELIMITER $$
CREATE PROCEDURE alterar_secao
    (IN numero INT,
    IN novo_numero INT,
    IN novo_logradouro VARCHAR(50),
    IN novo_numero_edificio INT,IN novo_bairro VARCHAR(50),
    IN novo_complemento VARCHAR(50), novo_cep CHAR(8),
    IN novo_municipio INT, IN novo_urna INT,
    IN novo_zona_eleitoral INT,
    OUT mensagem VARCHAR(30))
BEGIN
    IF EXISTS(SELECT * FROM secao WHERE nr_secao = numero) THEN
        UPDATE secao
            SET nr_secao = novo_numero,
                ds_logradouro = novo_logradouro,
                nr_edificio = novo_numero_edificio,
                ds_bairro = novo_bairro,
                ds_complemento = novo_complemento,
                nr_cep = novo_cep,
                cd_municipio = novo_municipio,
                nr_urna = novo_urna,
                nr_zona_eleitoral = novo_zona_eleitoral
        WHERE nr_secao = numero;
        SET mensagem = 'Seção alterada;';
    ELSE
        SET mensagem = 'Seção não encontrada';
    END IF;
END $$
DELIMITER ;

-- Procedure para remover uma seção
DELIMITER $$
CREATE PROCEDURE remover_secao (IN numero INT, OUT mensagem VARCHAR(30))
BEGIN
    IF EXISTS(SELECT * FROM secao WHERE nr_secao = numero) THEN
        DELETE FROM secao WHERE nr_secao = numero;
        SET mensagem = 'Seção removida';
    ElSE
        SET mensagem = 'Seção não removida';
    END IF;
END $$
DELIMITER ;

-- Cadastrar eleitor
DELIMITER $$
CREATE PROCEDURE cadastrar_eleitor (
    IN titulo INT,
    IN nome VARCHAR(50),
    IN cpf VARCHAR(11),
    IN email VARCHAR(50),
    IN nascimento DATE,
    IN secao INT,
    OUT mensagem VARCHAR(30))
BEGIN
    IF (LENGTH(email) - LENGTH(REPLACE(email, '@', ''))) = 1 AND LENGTH(nome) > 0
    AND NOT EXISTS(SELECT * FROM eleitor WHERE ds_email = email) AND
    NOT EXISTS(SELECT * FROM eleitor WHERE nr_cpf = cpf) AND LENGTH(cpf) = 11 THEN
        INSERT INTO eleitor (nr_titulo, nm_eleitor, nr_cpf, ds_email, dt_nascimento, nr_secao) VALUES
            (titulo, nome, cpf, email, nascimento, secao);
        SET mensagem = 'Eleitor cadastrado';
    ELSE
        SET mensagem = 'Falha no cadastro do eleitor';
    END IF;
END $$
DELIMITER ;

-- Cadastrar eleitores
CALL cadastrar_eleitor(789541, 'Rodrigo da Silva', '15678923214',
    'rodinho@email.com', '2000-10-14', 64, @mensagem);
CALL cadastrar_eleitor(487967, 'Rogério Lima', '45215463578',
    'roger@email.com', '1995-10-14', 95, @mensagem);
CALL cadastrar_eleitor(248926, 'Fernanda Soares', '78485412345',
    'fefei@email.com', '1995-8-25', 21, @mensagem);
CALL cadastrar_eleitor(894195, 'Amanda Fernandes', '11111111111',
    'amanna@email.com', '1980-3-24', 21, @mensagem);
CALL cadastrar_eleitor(489223, 'Gabriel Gabe', '22222222222',
    'gabri@email.com', '2003-3-24', 50, @mensagem);
CALL cadastrar_eleitor(195652, 'Gabriela Rosa', '33333333333',
    'gabrilinha@email.com', '2001-3-24', 41, @mensagem);
CALL cadastrar_eleitor(162358, 'Guilherme Domingos', '55555555555',
    'guilho@email.com', '1977-3-24', 41, @mensagem);
CALL cadastrar_eleitor(289562, 'Rodrigo Sanches', '77777777777',
    'rodsan@email.com', '1985-3-24', 86, @mensagem);
CALL cadastrar_eleitor(598999, 'Sandra Chagas', '88888888888',
    'sansan@email.com', '1985-11-22', 86, @mensagem);
CALL cadastrar_eleitor(894645, 'João Jones', '55555555555',
    'janjan@email.com', '1999-11-22', 86, @mensagem);

-- Criar procedura para atualizar eleitor
DELIMITER $$
CREATE PROCEDURE alterar_eleitor (
    IN titulo INT,
    IN novo_titulo INT,
    IN novo_nome VARCHAR(50),
    IN novo_cpf CHAR(11),
    IN novo_email VARCHAR(50),
    IN novo_nascimento DATE,
    IN nova_secao INT,
    OUT mensagem VARCHAR(30)
)
BEGIN
    IF (LENGTH(novo_email) - LENGTH(REPLACE(novo_email, '@', ''))) = 1 AND LENGTH(novo_nome) > 0
    AND NOT EXISTS(SELECT * FROM eleitor WHERE ds_email = novo_email) AND
    NOT EXISTS(SELECT * FROM eleitor WHERE nr_cpf = novo_cpf) AND LENGTH(novo_cpf) = 11 THEN
        UPDATE eleitor SET
            nr_titulo = novo_titulo,
            nm_eleitor = novo_nome,
            nr_cpf = novo_cpf,
            dt_nascimento = novo_nascimento,
            nr_secao = nova_secao
        WHERE nr_titulo = titulo;
        SET mensagem = 'Eleitor alterado com sucesso';
    ELSE
        SET mensagem = 'Falha no cadastro de eleitor';
    END IF;
END $$
DELIMITER ;

-- Criar procedure para excluir eleitor
DELIMITER $$
CREATE PROCEDURE excluir_eleitor(IN titulo INT, OUT mensagem VARCHAR(30))
BEGIN
    IF EXISTS(SELECT * FROM eleitor WHERE nr_titulo = titulo) THEN
        DELETE FROM eleitor WHERE nr_titulo = titulo;
        SET mensagem = 'Eleitor excluído com sucesso';
    ELSE
        SET mensagem = 'Falha em excluir eleitor';
    END IF;
END $$
DELIMITER ;

-- Criar procedure para cadastrar partido
DELIMITER $$
CREATE PROCEDURE cadastrar_partido(
    IN numero INT,
    IN nome VARCHAR(50),
    IN sigla VARCHAR(10),
    OUT mensagem VARCHAR(30))
BEGIN
   IF NOT EXISTS(SELECT * FROM partido WHERE sg_partido = sigla) AND numero > 9 AND numero < 100 THEN
       INSERT INTO partido (nr_partido, nm_partido, sg_partido) VALUES (numero, nome, sigla);
       SET mensagem = 'Partido cadastrado com sucesso';
    ELSE
       SET mensagem = 'Falha no cadastro do partido';
    END IF;
END $$

CALL cadastrar_partido(99, 'Partido da Música', 'PM', @mensagem);
CALL cadastrar_partido(98, 'Partido do Folclore', 'PF', @mensagem);
CALL cadastrar_partido(97, 'Partido da Criança', 'PC', @mensagem);
CALL cadastrar_partido(96, 'Partido da Diversão', 'PD', @mensagem);
CALL cadastrar_partido(95, 'Partido da Alegria', 'PA', @mensagem);
CALL cadastrar_partido(94, 'Partido da Teatro Artística', 'PTA', @mensagem);
CALL cadastrar_partido(93, 'Partido dos Brinquedos', 'PB', @mensagem);
CALL cadastrar_partido(92, 'Partido Amigo do Papai Noel', 'PAPN', @mensagem);
CALL cadastrar_partido(91, 'Partido das Belas Artes', 'PBA', @mensagem);
CALL cadastrar_partido(90, 'Partido dos Ritmos Musicais', 'PRM', @mensagem);

-- Procedure para alterar partido.
DELIMITER $$
CREATE PROCEDURE alterar_partido (
    IN numero INT,
    IN novo_numero INT,
    IN novo_nome VARCHAR(50),
    IN nova_sigla VARCHAR(10),
    OUT mensagem VARCHAR(30)
)
BEGIN
    IF NOT EXISTS(SELECT * FROM partido WHERE sg_partido = nova_sigla)
    AND novo_numero > 9 AND novo_numero < 100 THEN
        UPDATE partido SET
            nr_partido = novo_numero,
            nm_partido = novo_nome,
            sg_partido = nova_sigla
        WHERE nr_partido = numero;
        SET mensagem = 'Partido alterado com sucesso';
    ELSE
        SET mensagem = 'Falha ao alterar partido';
    END IF;
END $$
DELIMITER ;

-- Criar procedura para remover partido
DELIMITER $$
CREATE PROCEDURE excluir_partido (
    IN numero INT,
    OUT mensagem VARCHAR(30)
)
BEGIN
    DELETE FROM partido WHERE nr_partido = numero;
    SET mensagem = 'Partido excluído com sucesso';
END $$
DELIMITER ;

-- Cadastrar cargo
DELIMITER $$
CREATE PROCEDURE cadastrar_cargo(
    IN nome VARCHAR(50),
    OUT mensagem VARCHAR(30)
)
BEGIN
    IF NOT EXISTS(SELECT * FROM cargo WHERE nm_cargo = nome) THEN
        INSERT INTO cargo VALUES (null, nome);
        SET mensagem = 'Cargo cadastrado com sucesso';
    ELSE
        SET mensagem = 'Falha ao cadastrar o cargo';
    END IF;
END $$
DELIMITER ;

CALL cadastrar_cargo('Presidente', @mensagem);
CALL cadastrar_cargo('Vice Presidente', @mensagem);
CALL cadastrar_cargo('Governador de Estado', @mensagem);
CALL cadastrar_cargo('Governador do Distrito Federal', @mensagem);
CALL cadastrar_cargo('Senador', @mensagem);
CALL cadastrar_cargo('Deputado Federal', @mensagem);
CALL cadastrar_cargo('Deputado Estadual', @mensagem);
CALL cadastrar_cargo('Deputado Distrital', @mensagem);
CALL cadastrar_cargo('Prefeito', @mensagem);
CALL cadastrar_cargo('Vereador', @mensagem);

-- Criar procedure para alterar cargo
DELIMITER $$
CREATE PROCEDURE alterar_cargo(IN codigo INT,IN novo_codigo INT, IN novo_nome VARCHAR(50), OUT mensagem VARCHAR(30))
BEGIN
    IF NOT EXISTS(SELECT * FROM cargo WHERE nm_cargo = novo_nome) THEN
        UPDATE cargo
            SET cd_cargo = novo_codigo,
                nm_cargo = novo_nome
        WHERE cd_cargo = codigo;
        SET mensagem = 'Cargo alterado com sucesso';
    ELSE
        SET mensagem = 'Falha na alteração do cargo';
    END IF;
END $$
DELIMITER ;

-- Criar procedure para excluir cargo
DELIMITER $$
CREATE PROCEDURE excluir_cargo (IN codigo INT, OUT mensagem VARCHAR(30))
BEGIN
    DELETE FROM cargo WHERE cd_cargo = codigo;
    SET mensagem = 'Cargo excluído com sucesso';
END $$
DELIMITER ;

CALL excluir_cargo(11, @mensagem);

SELECT * FROM cargo;

-- Criar procedure para cadastrar candidato
DELIMITER $$
CREATE PROCEDURE cadastrar_candidato(
    IN numero INT,
    IN nome VARCHAR(50),
    IN nome_fantasia VARCHAR(50),
    IN municipio INT,
    IN partido INT,
    IN cargo INT,
    OUT mensagem VARCHAR(30))
BEGIN
    IF LEFT(numero, 2) = partido THEN
        INSERT INTO candidato VALUES
            (numero, nome, nome_fantasia, municipio, partido, cargo);
        SET mensagem = 'Candidato cadastrado';
    ELSE
        SET mensagem = 'Candidato não cadastrado';
    END IF;
END $$
DELIMITER ;

-- Cadastrando candidatos
CALL cadastrar_candidato(9902, 'Jorge Cardoso', 'Jorginho Card',
    2, 99, 7, @mensagem);
CALL cadastrar_candidato(98, 'Roberto Jorge', 'Roberto',
    2, 98, 1, @mensagem);
CALL cadastrar_candidato(98008, 'Tomas Tommy', 'Tommy',
    1, 98, 8, @mensagem);
CALL cadastrar_candidato(9788, 'Maria Joana', 'Jona',
    1, 97, 7, @mensagem);
CALL cadastrar_candidato(96888, 'Joana Maria', 'Mara',
    5, 96, 8, @mensagem);
CALL cadastrar_candidato(97855, 'João Silva', 'Silvão',
    5, 97, 8, @mensagem);
CALL cadastrar_candidato(93855, 'Roodrigo Rodny', 'Rodnei',
    3, 97, 8, @mensagem);
CALL cadastrar_candidato(94, 'Mario Silva', 'Mario',
    3, 94, 1, @mensagem);
CALL cadastrar_candidato(954, 'Sergio Vargas', 'Vargas',
    4, 95, 6, @mensagem);
CALL cadastrar_candidato(924, 'Sergio Dantas', 'Dante',
    4, 92, 6, @mensagem);

-- Criar procedure para alterar candidato
DELIMITER $$
CREATE PROCEDURE alterar_candidato(
    IN numero INT,
    IN novo_numero INT,
    IN novo_nome VARCHAR(50),
    IN novo_nome_fantasia VARCHAR(50),
    IN novo_municipio INT,
    IN novo_partido INT,
    IN novo_cargo INT,
    OUT mensagem VARCHAR(30)
)
BEGIN
    IF LEFT(novo_numero, 2) = novo_partido THEN
        UPDATE candidato SET
            nr_candidato = novo_numero,
            nm_candidato = novo_nome,
            nm_fantasia = novo_nome_fantasia,
            cd_municipio = novo_municipio,
            nr_partido = novo_partido,
            cd_cargo = novo_cargo
        WHERE nr_candidato = numero;
        SET mensagem = 'Candidato alterado';
    ELSE
        SET mensagem = 'Candidato não alterado';
    END IF;
END $$
DELIMITER ;

-- Criar procedure excluir candidato
DELIMITER $$
CREATE PROCEDURE excluir_candidato(IN numero INT, OUT mensagem VARCHAR(30))
BEGIN
    DELETE FROM candidato WHERE nr_candidato = numero;
    SET mensagem = 'Candidato Excluído';
END $$
DELIMITER ;

-- Criar procedure cadastrar voto
DELIMITER $$
CREATE PROCEDURE cadastrar_voto(
    IN candidato INT,
    IN cargo INT,
    IN urna INT,
    OUT mensagem VARCHAR(30)
)
BEGIN
    IF EXISTS(SELECT * FROM avaliacao.candidato WHERE nr_candidato = candidato AND cd_cargo = cargo) THEN
        INSERT INTO voto (dt_registro, nr_candidato, cd_cargo, nr_urna, nr_partido)  VALUES
            (CURRENT_DATE, candidato, cargo, urna, LEFT(candidato,2));
        SET mensagem = 'Voto inserido';
    ELSE
        SET mensagem = 'Voto não inserido';
    END IF;
END $$
DELIMITER ;

-- Cadastrando votos
CALL cadastrar_voto(94, 1, 9889, @mensagem);
CALL cadastrar_voto(94, 1, 9889, @mensagem);
CALL cadastrar_voto(98, 1, 9889, @mensagem);
CALL cadastrar_voto(98, 1, 9889, @mensagem);
CALL cadastrar_voto(98, 1, 9889, @mensagem);
CALL cadastrar_voto(98, 1, 1004, @mensagem);
CALL cadastrar_voto(98, 1, 1004, @mensagem);
CALL cadastrar_voto(98, 1, 1004, @mensagem);
CALL cadastrar_voto(98, 1, 1004, @mensagem);
CALL cadastrar_voto(94, 1, 1004, @mensagem);

-- Alterar voto
DELIMITER $$
CREATE PROCEDURE alterar_voto(
    IN codigo INT,
    IN novo_codigo INT,
    IN novo_candidato INT,
    IN novo_cargo INT,
    IN novo_urna INT,
    IN novo_partido INT,
    OUT mensagem VARCHAR(30)
)
BEGIN
    IF EXISTS(SELECT * FROM avaliacao.candidato WHERE nr_candidato = novo_candidato AND cd_cargo = novo_cargo) THEN
       UPDATE voto SET
            cd_voto = novo_codigo,
            nr_candidato = novo_candidato,
            cd_cargo = novo_cargo,
            nr_urna = novo_urna,
            nr_partido = novo_partido
       WHERE cd_voto = codigo;
       SET mensagem = 'Voto alterado';
    ELSE
        SET mensagem = 'Voto não alterado';
    END IF;
END $$
DELIMITER ;

-- Remover voto
DELIMITER $$
CREATE PROCEDURE remover_voto(
    IN codigo INT,
    OUT mensagem VARCHAR(30)
)
BEGIN
    DELETE FROM voto WHERE cd_voto = codigo;
    SET mensagem = 'Voto removido';
END $$
DELIMITER ;

-- Views

-- View para exibir o nome dos partidos de cada candidato
CREATE VIEW candidatos_partidos AS
SELECT nm_candidato, nm_partido FROM candidato
INNER JOIN partido p ON p.nr_partido = candidato.nr_partido;

-- View para saber o endereço da seção de cada eleitor
CREATE VIEW eleitor_secao_endereco AS
SELECT nm_eleitor, nr_cep, ds_logradouro, nr_edificio, ds_bairro FROM eleitor
INNER JOIN secao s ON eleitor.nr_secao = s.nr_secao;

-- View para saber o nome do munícipio e do estado de cada seção
CREATE VIEW secao_municipio_estado AS
SELECT nr_secao, nm_municipio, nm_estado FROM secao
INNER JOIN municipio m ON secao.cd_municipio = m.cd_municipio
INNER JOIN estado e ON m.cd_estado = e.cd_estado;

-- View para retornar zona e estado de uma secao
CREATE VIEW secao_zona_estado AS
SELECT nr_secao, ze.nr_zona_eleitoral, sg_estado FROM secao
INNER JOIN zona_eleitoral ze ON secao.nr_zona_eleitoral = ze.nr_zona_eleitoral
INNER JOIN estado e ON ze.cd_estado = e.cd_estado;

-- Puxar as informações do voto: urna, modelo da urna, candidato, cargo e partido
CREATE VIEW urna_modelo_candidato_cargo_partido_voto AS
SELECT cd_voto ,u.nr_urna, nm_modelo, c.nr_candidato, nm_fantasia, nm_cargo, sg_partido FROM voto
INNER JOIN urna u on voto.nr_urna = u.nr_urna
INNER JOIN candidato c on voto.nr_candidato = c.nr_candidato
INNER JOIN cargo c2 on c.cd_cargo = c2.cd_cargo
INNER JOIN partido p on c.nr_partido = p.nr_partido;

-- Puxar a quantidade de votos de cada candidato
CREATE VIEW votos_candidatos AS
SELECT candidato.nr_candidato,nm_fantasia, COUNT(v.nr_candidato) AS qtd_votos FROM candidato
LEFT JOIN voto v on candidato.nr_candidato = v.nr_candidato
GROUP BY candidato.nr_candidato, nm_fantasia;

-- Puxar a quantidade de votos de cada partido
CREATE VIEW votos_partidos AS
SELECT sg_partido, COUNT(voto.nr_partido) FROM voto
RIGHT JOIN partido p on voto.nr_partido = p.nr_partido
GROUP BY p.nr_partido;

-- Comandos DQL

-- Selecionar candidatos a deputado federal e estadual de Blumenau
SELECT * FROM candidato WHERE cd_municipio = 1 AND (cd_cargo = 6 OR cd_cargo = 7);

-- Selecionar eleitores que nasceram na década de 90
SELECT * FROM eleitor WHERE DATE_FORMAT(dt_nascimento, '%Y') BETWEEN 1990 AND 1999;

-- Selecionar o presidente que obteve mais votos (ou os que obtiveram em caso de empate)
SELECT voto.nr_candidato, COUNT(voto.nr_candidato) AS qtd_votos FROM voto
JOIN (
        (SELECT nr_candidato, MAX(votos) AS maior_voto FROM
        (SELECT nr_candidato, COUNT(nr_candidato) AS votos FROM voto GROUP BY nr_candidato) as votos)
    ) AS maior_voto
WHERE voto.nr_candidato = maior_voto.nr_candidato
GROUP BY voto.nr_candidato;

-- Listar partidos por número de candidatos concorrendo do partido mais candidatos para os com menos;
SELECT nr_partido, sg_partido, nr_candidatos FROM partido ORDER BY nr_candidatos DESC;


-- Selecionar o eleitor mais velho
SELECT * FROM eleitor
HAVING dt_nascimento = MIN(dt_nascimento);

-- Selecionar as seções localizadas em avenidas
SELECT * FROM secao WHERE ds_logradouro LIKE 'Avenida%';

-- Selecionar os votos junto com quantos dias se passaram desde que ocorreram
SELECT cd_voto, DATEDIFF((DATE(NOW())), dt_registro) AS dias_passados FROM voto;

-- Selecionar os eleitores e sua faixa de etária
SELECT nr_titulo, nm_eleitor,
CASE WHEN vl_idade >=  60 THEN 'Idoso'
     WHEN vl_idade >= 18 THEN 'Adulto'
     WHEN vl_idade >= 16 THEN 'Adolescente'
END AS faixa_etaria
FROM eleitor;

-- Conferir se partido obteve ou não votos
SELECT sg_partido, IF(nr_candidatos > 0, 'Conseguiu votos', 'Não conseguiu votos') AS teve_votos FROM partido;
