package br.com.gerenciadormusicas.controle;

import br.com.gerenciadormusicas.modelo.MusicaModelo;
import br.com.gerenciadormusicas.repositorio.MusicaRepositorio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/musica")
public class MusicaControle {

    @Autowired
    private MusicaRepositorio acao;

    @PostMapping("")
    public MusicaModelo cadastrar(@RequestBody MusicaModelo obj) {
        return acao.save(obj);
    }

    @GetMapping("listarMusicas")
    public Iterable<MusicaModelo> listar() {
        return acao.findAll();
    }

}
