package br.com.atividade.atividade.repositorio;

import org.springframework.data.repository.CrudRepository;

import br.com.atividade.atividade.modelo.UsuarioModelo;

public interface UsuarioRepositorio extends CrudRepository<UsuarioModelo, Long> {
    
}
