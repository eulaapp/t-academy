package br.com.atividade.atividade.repositorio;

import org.springframework.data.repository.CrudRepository;

import br.com.atividade.atividade.modelo.MusicaModelo;

public interface MusicaRepositorio extends CrudRepository<MusicaModelo, Long> {
    
}
