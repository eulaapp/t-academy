package br.com.projeto.curso.repositorio;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import br.com.projeto.curso.modelo.CursoModelo;

@Repository
public interface CursoRepositorio extends CrudRepository<CursoModelo, Long> {
    // retorna a quantidade de cursos com determinado nome
    int countByNome(String nome);

    // retorna a quantidade de cursos com determinado codigo
    long countByCodigo(long codigo);
}
