package br.com.exemplo03.repositorio;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import br.com.exemplo03.modelo.AlunoModelo;

@Repository
public interface AlunoRepositorio extends CrudRepository<AlunoModelo, Long>{
    
}
