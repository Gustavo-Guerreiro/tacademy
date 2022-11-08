package br.com.crud.produto.repositorio;

import org.springframework.data.repository.CrudRepository;

import br.com.crud.produto.modelo.ProdutoModelo;

public interface ProdutoRepositorio extends CrudRepository<ProdutoModelo, Integer>{
    
}
