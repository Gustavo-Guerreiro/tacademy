package br.com.projeto.pessoa.controle;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import br.com.projeto.pessoa.modelo.PessoaModelo;
import br.com.projeto.pessoa.repositorio.PessoaRepositorio;

@RestController
public class PessoaControle {

    @Autowired
    private PessoaRepositorio acao;
    
    @PostMapping("")
    public PessoaModelo cadastrar(@RequestBody PessoaModelo obj) {
        return acao.save(obj);
    }

    @GetMapping("")
    public Iterable<PessoaModelo> listar() {
        return acao.findAll();
    }

    @GetMapping("/contar")
    public long contarRegistros(){
        return acao.count();
    }

    @GetMapping("/listarIdade/{idade}")
    public Iterable<PessoaModelo> listarPessoasIdade(@PathVariable int idade) {
        return acao.findByIdade(idade);
    }

    @GetMapping("/ordenarNomeASC")
    public Iterable<PessoaModelo> ordenarNomeASC() {
        return acao.findByOrderByNome();
    }

    @GetMapping("/ordenarNomeDESC")
    public Iterable<PessoaModelo> ordenarNomeDesc() {
        return acao.findByOrderByNomeDesc();
    }

    @GetMapping("/idadeNome/{idade}")
    public Iterable<PessoaModelo> idadeNome(@PathVariable int idade){
        return acao.findByIdadeOrderByNomeDesc(idade);
    }

    @GetMapping("/nomeContem/{termo}")
    public Iterable<PessoaModelo> nomeContem(@PathVariable String termo) {
        return acao.findByNomeContaining(termo);
    }

    @GetMapping("/nomeComeca/{termo}")
    public Iterable<PessoaModelo> nomeComeca(@PathVariable String termo) {
        return acao.findByNomeStartsWith(termo);
    }

    @GetMapping("/nomeTermina/{termo}")
    public Iterable<PessoaModelo> nomeTermina(@PathVariable String termo) {
        return acao.findByNomeEndsWith(termo);
    }

    @GetMapping("/somaIdades")
    public int somaIdades(){
        return acao.somaIdades();
    }

    @GetMapping("/idadeSuperior/{idade}")
    public Iterable<PessoaModelo> idadeSuperior(@PathVariable int idade){
        return acao.idadeSuperior(idade);
    }
    
}
