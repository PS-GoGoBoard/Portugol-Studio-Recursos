/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.univali.portugol.plugin.exemplo.biblioteca;

import br.univali.portugol.nucleo.bibliotecas.base.Biblioteca;
import br.univali.portugol.nucleo.bibliotecas.base.ErroExecucaoBiblioteca;
import br.univali.portugol.nucleo.bibliotecas.base.TipoBiblioteca;
import br.univali.portugol.nucleo.bibliotecas.base.anotacoes.Autor;
import br.univali.portugol.nucleo.bibliotecas.base.anotacoes.DocumentacaoBiblioteca;
import br.univali.portugol.nucleo.bibliotecas.base.anotacoes.DocumentacaoFuncao;
import br.univali.portugol.nucleo.bibliotecas.base.anotacoes.PropriedadesBiblioteca;
import javax.swing.JOptionPane;

/**
 *
 * @author noschang
 */
@DocumentacaoBiblioteca(descricao = "test", versao = "1.0")
@PropriedadesBiblioteca(tipo = TipoBiblioteca.RESERVADA)
public final class MinhaBiblioteca extends Biblioteca{

    public MinhaBiblioteca() {
        JOptionPane.showMessageDialog(null, "Hello from Portugol!!");
    }
    
    
 
    @DocumentacaoFuncao(descricao = "Exibe uma mensagem de oi através do Portugol", autores = {@Autor(nome = "Luiz Fernando Noschang", email = "meuemail@univali.br")})
    public void sayHello() throws ErroExecucaoBiblioteca, InterruptedException
    {
        JOptionPane.showMessageDialog(null, "Hello from Portugol!!");
    }
    
}
