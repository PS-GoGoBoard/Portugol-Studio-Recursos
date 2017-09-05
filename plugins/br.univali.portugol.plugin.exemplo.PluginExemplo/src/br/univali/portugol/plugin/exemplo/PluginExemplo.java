package br.univali.portugol.plugin.exemplo;

import br.univali.portugol.nucleo.Portugol;
import br.univali.portugol.nucleo.bibliotecas.base.ErroCarregamentoBiblioteca;
import br.univali.portugol.nucleo.bibliotecas.base.GerenciadorBibliotecas;
import br.univali.portugol.plugin.exemplo.acoes.AcaoPersonalizadaEstatica;
import br.univali.ps.plugins.base.Plugin;
import br.univali.ps.plugins.base.UtilizadorPlugins;
import br.univali.ps.plugins.base.VisaoPlugin;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Luiz Fernando Noschang
 */
public final class PluginExemplo extends Plugin
{
    private final VisaoPlugin visao = new VisaoPluginExemplo(this);
    
    private UtilizadorPlugins utilizador;
    
    public PluginExemplo()
    {
        carregarBibliotecas();
    }

    @Override
    protected void inicializar(UtilizadorPlugins utilizador)
    {
        this.utilizador = utilizador;
        this.utilizador.instalarAcaoPlugin(this, new AcaoPersonalizadaEstatica());
        
        //GerenciadorBibliotecas.getInstance().registrarBibliotecaExterna(biblioteca);
    }

    @Override
    public VisaoPlugin getVisao()
    {
        return visao;
    }

    public UtilizadorPlugins getUtilizador()
    {
        return utilizador;
    }
    
    private void carregarBibliotecas()
    {
        try 
        {
            Portugol.getGerenciadorBibliotecas().registrarBibliotecaExterna(br.univali.portugol.plugin.exemplo.biblioteca.MinhaBiblioteca.class);
        }
        catch (ErroCarregamentoBiblioteca ex)
        {
            //Logger.getLogger(PortugolStudio.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
