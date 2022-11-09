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

import br.com.atividade.atividade.modelo.MusicaModelo;
import br.com.atividade.atividade.modelo.PlaylistModelo;
import br.com.atividade.atividade.repositorio.PlaylistRepositorio;

@RestController
@RequestMapping("/playlists")
@CrossOrigin(origins = "*")
public class PlaylistControle {
    
    @Autowired
    private PlaylistRepositorio acao;

    @PostMapping("/cadastrar")
    public PlaylistModelo cadastrar(@RequestBody PlaylistModelo obj) {
        return acao.save(obj);
    }

    @GetMapping("")
    public Iterable<PlaylistModelo> listar() {
        return acao.findAll();
    }

    @PutMapping("/adicionarMusica/{codigo}")
    public PlaylistModelo adicionarMusicaPlaylist(@PathVariable long codigo, @RequestBody MusicaModelo obj) {
        PlaylistModelo pm = acao.findByCodigo(codigo);

        pm.getMusicas().add(obj);

        acao.save(pm);

        return pm;
    }

    @PutMapping("/removerMusica/{codigo}")
    public int removerMusicaPlaylist(@PathVariable long codigo, @RequestBody MusicaModelo obj) {
        
        PlaylistModelo pm = acao.findByCodigo(codigo);

        int indice = -1;

        for(int i=0; i<pm.getMusicas().size(); i++){
            if(obj.getCodigo() == pm.getMusicas().get(i).getCodigo()){
                pm.getMusicas().remove(i);
            }
        }

       acao.save(pm);

        return indice;
    }

    @GetMapping("/pesquisa/{nome}")
    public Iterable<PlaylistModelo> pesquisar(@PathVariable String nome) {
        return acao.findByNomeContaining(nome);
    }

    @PutMapping("/alterarNome")
    public PlaylistModelo editarPlaylist(@RequestBody PlaylistModelo obj) {
        return acao.save(obj);
    }

    @DeleteMapping("/remover/{codigo}")
    public void remover(@PathVariable long codigo) {
        acao.deleteById(codigo);
    }
}
