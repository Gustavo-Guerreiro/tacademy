create database extra03;

use extra03;

# 1 - Criar uma tabela chamada clientes com as seguintes características:

create table clientes (
	codigo_cliente int primary key auto_increment,
    nome_cliente varchar(30),
    email_cliente varchar(50)
);

# 2 - Criar uma sequência para a coluna codigo_cliente.
alter table clientes auto_increment = 100;

# 3 - Criar uma procedure para cadastrar os clientes, os parâmetros obrigatórios serão: nome e e-mail.
delimiter $$
create procedure cadastrar(in nome varchar(30), in email varchar(30))
begin
	insert into clientes values (null, nome, email);
end $$
delimiter ;

# 4 - Insira um cliente através da procedure criada.
call cadastrar("Gustavo", "gmail@gmail.com", @mensagem);

select @mensagem;

# 5 - Implemente a procedure de cadastro com as seguintes regras de negócio:
# a. O nome deve ter pelo menos 3 caracteres e no máximo 30 (pesquise pela função length);
# b. O campo e-mail é obrigatório e deverá ter pelo menos 10 caracteres;
# c. Não poderá haver e-mails iguais;
# d. O e-mail deve ter apenas um @;
drop procedure cadastrar;
delimiter $$
create procedure cadastrar(in nome varchar(30), in email varchar(30), out mensagem varchar(30))
begin
	if length(nome) >= 3 and length(email) >= 10 and email like "%@%" and not exists
	(select * from clientes where email_cliente =  email)
	then
		insert into clientes values (null, nome, email);
		set mensagem = "Cadastro realizado com sucesso";
	else
		set mensagem = "Cadastro não realizado";
	end if;
end $$
delimiter ;

# 6 - Criar uma procedure para efetuar a alteração de dados.
# Essa procedure deverá ter três parâmetros, sendo eles: O nome que desejamos alterar,
# o novo nome e o novo e-mail. Caso não tenha o nome informado, deverá retornar uma
# mensagem que o nome informado não existe.
delimiter $$
create procedure alterar_dados (
	in nome_antigo varchar(30),
	in nome_novo varchar(30),
    in novo_email varchar(30),
    out mensagem varchar(30))
begin
	if exists (select * from clientes where nome_cliente =  nome_antigo ) then
		update clientes
			set nome_cliente = nome_novo,
				email_cliente = novo_email
			where nome_cliente = nome_antigo;
            set mensagem = "Dados alterados com sucesso";
	else
		set mensagem = "Erro na alteração dos dados.";
    end if;
end $$
delimiter ;

call alterar_dados("Gustavo", "Rogério", "roger@email.com", @mensagem);

select @mensagem;

select * from clientes;

# 7 - Criar uma procedure para remover clientes através do nome, retorne uma mensagem
# informando se a exclusão foi efetuada ou não.
delimiter $$
create procedure remover_cliente_nome(
	in nome varchar(30),
    out mensagem varchar(30))
    begin
		if exists (select * from clientes where nome_cliente = nome) then
			delete from clientes where nome_cliente = nome;
            set mensagem = "Cliente removido com sucesso";
		else
			set mensagem = "Cliente não encontrado";
		end if;
    end $$
delimiter ;

call remover_cliente_nome("Rogério", @mensagem);

# 8 - Criar uma procedure para remover clientes através do e-mail,
# retorne uma mensagem informando se a exclusão foi efetuada ou não.
delimiter $$
create procedure remover_cliente_email(
	in email varchar(30),
    out mensagem varchar(30))
    begin
		if exists (select * from clientes where email_cliente = email) then
			delete from clientes where email_cliente = email;
            set mensagem = "Cliente removido com sucesso";
		else
			set mensagem = "Cliente não encontrado";
		end if;
    end $$
delimiter ;


