package br.com.gerenciadormusicas.repositorio;

import br.com.gerenciadormusicas.modelo.MusicaModelo;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MusicaRepositorio extends CrudRepository<MusicaModelo, Long> {
    Iterable<MusicaModelo> findByNmMusicaContainsIgnoreCase(String nmMusica);





}
