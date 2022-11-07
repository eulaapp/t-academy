package br.com.projeto.pessoa.repositorio;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import br.com.projeto.pessoa.modelo.PessoaModelo;

@Repository
public interface PessoaRepositorio extends CrudRepository<PessoaModelo, Long> {
    // Retorna todos os registros com uma determinada idade
    Iterable<PessoaModelo>findByIdade(int idade);

    // Lista os registros atráves da coluna nome (A - Z)
    Iterable<PessoaModelo> findByOrderByNome();

    // Lista os registros atráves da coluna nome (Z - A)
    Iterable<PessoaModelo> findByOrderByNomeDesc();

    //Lista todas as pessoas com uma determinada idade em ordem decrescente de nome (Z - A)
    Iterable<PessoaModelo> findByIdadeOrderByNomeDesc(int idade);

    // Lista pessoas onde o nome possui determinado termo
    Iterable<PessoaModelo> findByNomeContaining(String termo);

    //Listar pessoas onde o nome inicia com determinado termo
    Iterable<PessoaModelo> findByNomeStartsWith(String termo);

    //Listar pessoas onde o nome termina com determinado termo
    Iterable<PessoaModelo> findByNomeEndsWith(String termo);

    // método para retornar as somas das idades (JPQL)
    @Query(value = "SELECT SUM(idade) FROM pessoas", nativeQuery = true)
    int somaIdades();

    // método para retornar pesssoas com idade superior a 25 anos
    @Query(value = "SELECT * FROM pessoas WHERE idade >= ?", nativeQuery = true)
    Iterable<PessoaModelo> idadeSuperior(int idade);
}
