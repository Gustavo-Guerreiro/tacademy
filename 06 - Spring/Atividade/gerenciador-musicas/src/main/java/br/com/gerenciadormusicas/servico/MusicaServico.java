package br.com.gerenciadormusicas.servico;

import br.com.gerenciadormusicas.modelo.ArtistaModelo;
import br.com.gerenciadormusicas.modelo.MusicaModelo;
import br.com.gerenciadormusicas.repositorio.ArtistaRepositorio;
import br.com.gerenciadormusicas.repositorio.MusicaRepositorio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class MusicaServico {

    @Autowired
    MusicaRepositorio acao;
    @Autowired
    ArtistaRepositorio ar;

    public MusicaModelo cadastrar(long cdArtista, MusicaModelo obj){
        Optional<ArtistaModelo> oam =  ar.findById(cdArtista);
        if (oam.isPresent()) {
            MusicaModelo mm = acao.save(obj);
            ArtistaModelo am = oam.get();
            am.getMusicas().add(mm);
            ar.save(am);
            return mm;
        } else {
            throw new IllegalArgumentException("Erro! Artista não encontrado.");
        }
    }

    public MusicaModelo selecionar(long codigo) {
        if (acao.findById(codigo).isPresent()) {
            return acao.findById(codigo).get();
        } else {
            throw new IllegalArgumentException("Música não encontrada");
        }
    }
}
