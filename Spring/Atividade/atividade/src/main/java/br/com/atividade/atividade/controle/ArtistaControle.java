package br.com.atividade.atividade.controle;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.atividade.atividade.modelo.ArtistaModelo;
import br.com.atividade.atividade.repositorio.ArtistaRepositorio;

@RestController
@RequestMapping("/artistas")
public class ArtistaControle {

    @Autowired
    private ArtistaRepositorio acao;

    @PostMapping("")
    public ArtistaModelo cadastrar(@RequestBody ArtistaModelo obj) {
        return acao.save(obj);
    }

    @GetMapping("")
    public Iterable<ArtistaModelo> selecionar() {
        return acao.findAll();
    }
    
}
