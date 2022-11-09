package br.com.gerenciadormusicas.controle;

import br.com.gerenciadormusicas.modelo.MusicaModelo;
import br.com.gerenciadormusicas.repositorio.MusicaRepositorio;
import br.com.gerenciadormusicas.servico.MusicaServico;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


@RestController
@CrossOrigin(origins = "*")
@RequestMapping("/musica")
public class MusicaControle {

    @Autowired
    private MusicaRepositorio acao;
    @Autowired
    private MusicaServico servico;

    @PostMapping("/{cdArtista}")
    public MusicaModelo cadastrar(@RequestBody MusicaModelo obj, @PathVariable long cdArtista) throws Exception {
        return servico.cadastrar(cdArtista, obj);
    }

    @PutMapping("")
    public MusicaModelo alterar(@RequestBody MusicaModelo obj) {
        return acao.save(obj);
    }

    @GetMapping("listarMusicas")
    public Iterable<MusicaModelo> listar() {
        return acao.findAll();
    }

    @GetMapping("/selecionarMusica/{codigo}")
    public MusicaModelo selecionar(@PathVariable long codigo) {
        return servico.selecionar(codigo);
    }

    @GetMapping("/pesquisarMusica/{termo}")
    public Iterable<MusicaModelo> pesquisar(@PathVariable String termo) {
        return acao.findByNmMusicaContainsIgnoreCase(termo);
    }

    @DeleteMapping("/{codigo}")
    public void remover(@PathVariable long codigo) {
        acao.deleteById(codigo);
    }
}
