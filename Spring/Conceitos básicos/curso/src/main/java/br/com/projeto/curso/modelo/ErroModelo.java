package br.com.projeto.curso.modelo;

import org.springframework.stereotype.Component;

@Component // modelo que não gera tabela no banco
public class ErroModelo {
    
    // atributo de mensagem
    private String mensagem;

    public String getMensagem() {
        return this.mensagem;
    }

    public void setMensagem(String mensagem) {
        this.mensagem = mensagem;
    }

}
