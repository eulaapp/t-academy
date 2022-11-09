package br.com.atividade.atividade.repositorio;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import br.com.atividade.atividade.modelo.PlaylistModelo;

public interface PlaylistRepositorio extends CrudRepository<PlaylistModelo, Long> {
    PlaylistModelo findByCodigo(long codigo);

    Iterable<PlaylistModelo> findByNomeContaining(String nome);

    @Query(value = "DELETE FROM playlist_musica WHERE musica_codigo = ? AND playlist_codigo = ?", nativeQuery = true)
    void removerMusicaPlaylist(long codigoMusica, long codigoPlaylist);
}
