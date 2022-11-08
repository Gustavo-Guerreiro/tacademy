package br.com.gerenciadormusicas.repositorio;

import br.com.gerenciadormusicas.modelo.MusicaModelo;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MusicaRepositorio extends CrudRepository<MusicaModelo, Long> {

}
