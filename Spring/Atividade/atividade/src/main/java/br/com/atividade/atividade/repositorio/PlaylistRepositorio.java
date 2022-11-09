package br.com.atividade.atividade.repositorio;

import org.springframework.data.repository.CrudRepository;

import br.com.atividade.atividade.modelo.PlaylistModelo;

public interface PlaylistRepositorio extends CrudRepository<PlaylistModelo, Long> {
    PlaylistModelo findByCodigo(long codigo);

    Iterable<PlaylistModelo> findByNomeContaining(String nome);
}
