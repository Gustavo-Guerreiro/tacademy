package br.com.gerenciadormusicas.repositorio;

import br.com.gerenciadormusicas.modelo.ArtistaModelo;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ArtistaRepositorio extends CrudRepository<ArtistaModelo, Long> {
    Iterable<ArtistaModelo> findByNmArtistaContaining(String termo);


}
