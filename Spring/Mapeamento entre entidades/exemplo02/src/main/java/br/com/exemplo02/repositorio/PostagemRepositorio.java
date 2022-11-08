package br.com.exemplo02.repositorio;

import org.springframework.data.repository.CrudRepository;

import br.com.exemplo02.modelo.PostagemModelo;

public interface PostagemRepositorio extends CrudRepository<PostagemModelo, Long> {
    
}
