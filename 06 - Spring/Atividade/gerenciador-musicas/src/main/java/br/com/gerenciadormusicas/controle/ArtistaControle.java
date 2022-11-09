package br.com.gerenciadormusicas.controle;

import br.com.gerenciadormusicas.modelo.ArtistaModelo;
import br.com.gerenciadormusicas.repositorio.ArtistaRepositorio;
import br.com.gerenciadormusicas.servico.ArtistaServico;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


@RestController
@CrossOrigin(origins = "*")
@RequestMapping("/artista")
public class ArtistaControle {

    @Autowired
    private ArtistaRepositorio acao;
    @Autowired
    private ArtistaServico servico;

    @PostMapping("")
    public ArtistaModelo cadastrar(@RequestBody ArtistaModelo obj) {
        return acao.save(obj);
    }

    @GetMapping("/{codigo}")
    public ArtistaModelo selecionar(@PathVariable long codigo) {
        if (acao.findById(codigo).isPresent()) {
            return acao.findById(codigo).get();
        } else {
            throw new IllegalArgumentException("Código não encontrado");
        }
    }

    @GetMapping("")
    public Iterable<ArtistaModelo> listar() {
        return acao.findAll();
    }

    @GetMapping("pesquisarArtista/{termo}")
    public Iterable<ArtistaModelo> pesquisar(@PathVariable String termo) {
        return acao.findByNmArtistaContaining(termo);
    }

    @PutMapping("")
    public ArtistaModelo alterar(@RequestBody ArtistaModelo obj) {
        return acao.save(obj);
    }

    @DeleteMapping("/{codigo}")
    public void remover(@PathVariable long codigo) {
        servico.remover(codigo);
    }

}
