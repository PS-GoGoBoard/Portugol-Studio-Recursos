
/* CLIQUE NO SINAL DE "+", � ESQUERDA, PARA EXIBIR A DESCRI��O DO EXEMPLO
 *  
 * Copyright (C) 2013 - UNIVALI - Universidade do Vale do Itaja�
 * 
 * Este arquivo de c�digo fonte � livre para utiliza��o, c�pia e/ou modifica��o
 * desde que este cabe�alho, contendo os direitos autorais e a descri��o do programa, 
 * seja mantido.
 * 
 * Descri��o:
 * 
 * 	Este exemplo pede ao usu�rio que informa a sua idade. Logo ap�s exibe uma mensagem
 * 	informando se ele � maior ou menor de idade.
 * 
 * Autores:
 * 
 * 	Giordana Maria da Costa Valle
 * 	Carlos Alexandre Krueger
 * 	
 * Data: 01/06/2013
 */
 
programa
{ 
	funcao inicio ()
	{ 	
		inteiro menor, idade
		
		escreva("Informe sua idade: ")
		leia(idade)
	
		se (idade < 18) 
		{
			escreva("Voc� � menor de idade")
		} 
		senao
		{
			escreva("Voc� � maior de idade")
		}

		escreva("\n")
	} 
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta se��o do arquivo guarda informa��es do Portugol Studio.
 * Voc� pode apag�-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 662; 
 * @DOBRAMENTO-CODIGO = [1];
 */