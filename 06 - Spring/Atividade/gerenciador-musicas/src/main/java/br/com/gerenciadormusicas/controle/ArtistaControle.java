package br.com.gerenciadormusicas.controle;

import br.com.gerenciadormusicas.modelo.ArtistaModelo;
import br.com.gerenciadormusicas.modelo.MusicaModelo;
import br.com.gerenciadormusicas.repositorio.ArtistaRepositorio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping("/artista")
public class ArtistaControle {

    @Autowired
    private ArtistaRepositorio acao;

    @PostMapping("")
    public ArtistaModelo cadastrar(@RequestBody ArtistaModelo obj) {
        return acao.save(obj);
    }

    @GetMapping("listarArtistas")
    public Iterable<ArtistaModelo> listar() {
        return acao.findAll();
    }

    @GetMapping("pesquisarArtista/{termo}")
    public Iterable<ArtistaModelo> pesquisar(@PathVariable String termo) {
        return acao.findByNmArtistaContaining(termo);
    }

    @GetMapping("selecionarArtista/{codigo}")
    public Optional<ArtistaModelo> listarPorArtista(@PathVariable long codigo) {
        return acao.findById(codigo);
    }

    @PutMapping("/{codigo}")
    public ArtistaModelo adicionarMusica(@PathVariable long codigo, @RequestBody MusicaModelo obj) throws Exception {

        Optional<ArtistaModelo> oam =  acao.findById(codigo);
        if (oam.isPresent()) {
            ArtistaModelo am = oam.get();
            am.getMusicas().add(obj);
            acao.save(am);
            return am;
        } else {
            throw new Exception("Erro!");
        }
    }

    @PutMapping("")
    public ArtistaModelo atualizar(@RequestBody ArtistaModelo obj) {
        acao.save(obj);
    }
}
