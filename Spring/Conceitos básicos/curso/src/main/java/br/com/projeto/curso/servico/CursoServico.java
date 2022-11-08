package br.com.projeto.curso.servico;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import br.com.projeto.curso.modelo.CursoModelo;
import br.com.projeto.curso.modelo.ErroModelo;
import br.com.projeto.curso.repositorio.CursoRepositorio;

@Service
public class CursoServico {
    
    @Autowired
    private ErroModelo erroModelo;

    @Autowired
    private CursoRepositorio acao;

    // método para cadastrar
    public ResponseEntity<?> cadastrar(CursoModelo obj) {
        if (obj.getNome().equals("")) {
            erroModelo.setMensagem("O nome do curso é obrigatório.");
            return new ResponseEntity<ErroModelo>(erroModelo, HttpStatus.BAD_REQUEST);
        } else if (obj.getNome().length() < 5) {
            erroModelo.setMensagem("O nome do curso precisa conter pelo menos cinco caracteres.");
            return new ResponseEntity<ErroModelo>(erroModelo, HttpStatus.BAD_REQUEST);
        } else if (obj.getValor() <= 0) {
            erroModelo.setMensagem("Informe um valor válido.");
            return new ResponseEntity<ErroModelo>(erroModelo, HttpStatus.BAD_REQUEST);
        } else if (acao.countByNome(obj.getNome()) > 0) {
            erroModelo.setMensagem("O curso informado já está cadastrado.");
            return new ResponseEntity<ErroModelo>(erroModelo, HttpStatus.BAD_REQUEST);
        } else {
            return new ResponseEntity<CursoModelo>(acao.save(obj), HttpStatus.OK);
        }
    }

    // método para selecionar todos os cursos
    public ResponseEntity<?> selecionarCursos() {
        if (acao.count() == 0) {
            erroModelo.setMensagem("Não há cursos cadastrados.");
            return new ResponseEntity<ErroModelo>(erroModelo, HttpStatus.OK);
        } else {
            return new ResponseEntity<Iterable<CursoModelo>>(acao.findAll(), HttpStatus.OK);
        }
    }

    // método responsável por remover um curso
    public ResponseEntity<?> remover(long codigo) {
        if (acao.countByCodigo(codigo) == 0) {
            erroModelo.setMensagem("O código informado não existe.");
            return new ResponseEntity<ErroModelo>(erroModelo, HttpStatus.NOT_FOUND);
        } else {
            acao.deleteById(codigo);
            erroModelo.setMensagem("Curso removido com sucesso!");
            return new ResponseEntity<ErroModelo>(erroModelo, HttpStatus.OK);
        }
    }
}
