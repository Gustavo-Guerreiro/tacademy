package br.com.projeto.curso.servico;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import br.com.projeto.curso.modelo.CursoModelo;
import br.com.projeto.curso.modelo.ErroModelo;
import br.com.projeto.curso.repositorio.CursoRepositorio;

@Service
public class CursoServico {

    @Autowired
    private ErroModelo erro_modelo;

    @Autowired
    private CursoRepositorio acao;

    // Método para cadastrar
    public ResponseEntity<?> cadastrar(CursoModelo obj) {

        if (obj.getNome().equals("")){
            erro_modelo.setMensagem("O nome do curso é obrigatório.");
            return new ResponseEntity<ErroModelo>(erro_modelo, HttpStatus.BAD_REQUEST);
        } else if (obj.getNome().length() < 5) {
            erro_modelo.setMensagem("O nome do curso precisa conter pelo menos 5 caracteres.");
            return new ResponseEntity<ErroModelo>(erro_modelo, HttpStatus.BAD_REQUEST);
        } else if (obj.getValor() <= 0) {
            erro_modelo.setMensagem("Informe um valor válido.");
            return new ResponseEntity<ErroModelo>(erro_modelo, HttpStatus.BAD_REQUEST);
        } else if (acao.countByNome(obj.getNome()) > 0) {
            erro_modelo.setMensagem("O curso informado já está cadastrado.");
            return new ResponseEntity<ErroModelo>(erro_modelo, HttpStatus.BAD_REQUEST);
        } else {
            return new ResponseEntity<CursoModelo>(acao.save(obj), HttpStatus.OK); 
        }
    }

    // Método para selecionar todos os cursos
    public ResponseEntity<?> selecionar(){

        if(acao.count() == 0) {
            erro_modelo.setMensagem("Não há cursos registrados.");
            return new ResponseEntity<ErroModelo>(erro_modelo, HttpStatus.OK);
        } else {
            return new ResponseEntity<Iterable<CursoModelo>>(acao.findAll(), HttpStatus.OK);
        }
    }
    
    // Método responsável por remover um curso
    public ResponseEntity<?> remover(long codigo){

        if (acao.countByCodigo(codigo) == 0) {
            erro_modelo.setMensagem("O cósigo informado não existe.");
            return new ResponseEntity<ErroModelo>(erro_modelo, HttpStatus.NOT_FOUND);
        } else {
            acao.deleteById(codigo);
            erro_modelo.setMensagem("Curso removido com sucesso!");
            return new ResponseEntity<ErroModelo>(erro_modelo, HttpStatus.OK);
        }

    }
}