package br.com.crud.produto.controle;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import br.com.crud.produto.modelo.ProdutoModelo;
import br.com.crud.produto.repositorio.ProdutoRepositorio;

@RestController
@CrossOrigin(origins = "*")
public class ProdutoControle {

    @Autowired
    private ProdutoRepositorio pr;

    @GetMapping("")
    public Iterable<ProdutoModelo> listar() {
        return pr.findAll();
    }

    @PostMapping("")
    public ProdutoModelo cadastrar(@RequestBody ProdutoModelo obj){
        return pr.save(obj);
    }

    @PutMapping("")
    public ProdutoModelo alterar(@RequestBody ProdutoModelo obj){
        return pr.save(obj);
    }

    @DeleteMapping("{codigo}")
    public void remover(@PathVariable int codigo){
        pr.deleteById(codigo);
    }

    @GetMapping("{codigo}")
    public Optional<ProdutoModelo> filtrar(@PathVariable int codigo){
        return pr.findById(codigo);
    }

}
