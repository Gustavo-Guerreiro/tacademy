package br.com.projeto.curso.modelo;

import org.springframework.stereotype.Component;

@Component
public class ErroModelo {

    // Atributo de mensagem
    private String mensagem;

    // Get e Set
    public String getMensagem() {
        return this.mensagem;
    }

    public void setMensagem(String mensagem) {
        this.mensagem = mensagem;
    }

    
}
