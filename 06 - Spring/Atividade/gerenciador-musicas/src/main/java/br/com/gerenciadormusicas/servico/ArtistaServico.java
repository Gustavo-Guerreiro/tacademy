package br.com.gerenciadormusicas.servico;

import br.com.gerenciadormusicas.modelo.ArtistaModelo;
import br.com.gerenciadormusicas.repositorio.ArtistaRepositorio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ArtistaServico {
    @Autowired
    ArtistaRepositorio acao;

    public ArtistaModelo selecionar(long codigo) {
        if (acao.findById(codigo).isPresent()) {
            return acao.findById(codigo).get();
        } else {
            throw new IllegalArgumentException("Código não encontrado");
        }
    }

    public void remover(long codigo) {
        if ( acao.findById(codigo).isPresent()) {
            ArtistaModelo am = acao.findById(codigo).get();
            if (am.getMusicas().size() == 0) {
                acao.deleteById(codigo);
            } else {
                throw new IllegalArgumentException("O Artista possui músicas cadastradas");
            }
        } else {
            throw new IllegalArgumentException("Artista não encontrado");
        }
    }
}
