package br.com.atividade.atividade.repositorio;

import org.springframework.data.repository.CrudRepository;

import br.com.atividade.atividade.modelo.ArtistaModelo;

public interface ArtistaRepositorio extends CrudRepository<ArtistaModelo, Long> {
    Iterable<ArtistaModelo> findByNomeContaining(String nome);

    ArtistaModelo findByCodigo(long codigo);
}
