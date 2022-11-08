package br.com.exemplo03.repositorio;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import br.com.exemplo03.modelo.CursoModelo;

@Repository
public interface CursoRepositorio extends CrudRepository<CursoModelo, Long>{
    
}
