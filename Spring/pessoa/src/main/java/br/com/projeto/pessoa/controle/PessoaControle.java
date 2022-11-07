package br.com.projeto.pessoa.controle;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
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
}
