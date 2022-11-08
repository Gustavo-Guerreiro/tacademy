package br.com.projeto.pessoa.repositorio;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import br.com.projeto.pessoa.modelo.PessoaModelo;

@Repository
public interface PessoaRepositorio extends CrudRepository<PessoaModelo, Long> {
    
    // Retornar todos os registros com uma determinada idade
    Iterable<PessoaModelo> findByIdade(int idade);

    // Listar os registros através da coluna nome (A - Z)
    Iterable<PessoaModelo> findByOrderByNome();

    // Listar os registros através da coluna nome (Z - A)
    Iterable<PessoaModelo> findByOrderByNomeDesc();

    // Listar todas as pessoas com uma determinada idade em ordem descrescente de nome (Z - A)
    Iterable<PessoaModelo> findByIdadeOrderByNomeDesc(int idade);

    // Listar pessoas onde o nome possui determinado termo
    Iterable<PessoaModelo> findByNomeContaining(String termo);

    // Listar pessoas onde o nome inicia com determinado termo
    Iterable<PessoaModelo> findByNomeStartsWith(String termo);

    // Listar pessoas onde o nome finaliza com determinado termo
    Iterable<PessoaModelo> findByNomeEndsWith(String termo);

    // Método para retornar a soma das idades (JPQL)
    @Query(value = "SELECT SUM(idade) FROM pessoas", nativeQuery = true)
    int somaIdades();

    // Método para retornar pessoas com idade superior a 25 anos
    @Query(value = "SELECT * FROM pessoas WHERE idade >= :idade", nativeQuery = true)
    Iterable<PessoaModelo> idadeSuperior(int idade);

    
}
