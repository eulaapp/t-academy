package br.com.atividade.atividade.controle;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.atividade.atividade.modelo.MusicaModelo;
import br.com.atividade.atividade.modelo.PlaylistModelo;
import br.com.atividade.atividade.repositorio.PlaylistRepositorio;

@RestController
@RequestMapping("/playlists")
public class PlaylistControle {
    
    @Autowired
    private PlaylistRepositorio acao;

    @PostMapping("")
    public PlaylistModelo cadastrar(@RequestBody PlaylistModelo obj) {
        return acao.save(obj);
    }

    @GetMapping("")
    public Iterable<PlaylistModelo> listar() {
        return acao.findAll();
    }

    @PutMapping("/{codigo}")
    public PlaylistModelo adicionarMusicaPlaylist(@PathVariable long codigo, @RequestBody MusicaModelo obj) {
        PlaylistModelo pm = acao.findByCodigo(codigo);

        pm.getMusicas().add(obj);

        acao.save(pm);

        return pm;
    }

    @GetMapping("/pesquisa/{nome}")
    public Iterable<PlaylistModelo> pesquisar(@PathVariable String nome) {
        return acao.findByNomeContaining(nome);
    }
}
