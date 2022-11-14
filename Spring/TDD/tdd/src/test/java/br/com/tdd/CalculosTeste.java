package br.com.tdd;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotEquals;

import org.junit.Test;

public class CalculosTeste {
    
    @Test(expected = NumberFormatException.class)
    public void efetuarTeste() {
        Calculos c = new Calculos();
        double resultado = c.divisao("a", "2");

        assertEquals(resultado, 5);
    }

    @Test
    public void testeControle() {
        Controle c = new Controle();
        String retorno = c.retornaNome("Ana");

        // assertEquals(retorno, null);
        assertNotEquals(retorno, null);
    }
}
