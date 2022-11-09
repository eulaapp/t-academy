package br.com.atividade.atividade.controle;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.atividade.atividade.modelo.ArtistaModelo;
import br.com.atividade.atividade.modelo.MusicaModelo;
import br.com.atividade.atividade.repositorio.ArtistaRepositorio;

@RestController
@RequestMapping("/artistas")
@CrossOrigin(origins = "*")
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

    @PutMapping("/{codigo}")
    public ArtistaModelo alterar(@PathVariable long codigo, @RequestBody MusicaModelo obj) {

        ArtistaModelo am = acao.findByCodigo(codigo);

        am.getMusicas().add(obj);

        acao.save(am);

        return am;
    }

    @DeleteMapping("{codigo}")
    public void remover(@PathVariable long codigo) {
        acao.deleteById(codigo);
    }

    @GetMapping("/pesquisa/{nome}")
    public Iterable<ArtistaModelo> pesquisar(@PathVariable String nome) {
        return acao.findByNomeContaining(nome);
    }

    @PutMapping("/alterarNome")
    public ArtistaModelo editarPlaylist(@RequestBody ArtistaModelo obj) {
        return acao.save(obj);
    }
    
}
