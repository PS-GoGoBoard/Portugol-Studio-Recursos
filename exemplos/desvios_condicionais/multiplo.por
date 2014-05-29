
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
 * 	Este exemplo pede ao usu�rio que informe um valor inteiro, logo ap�s, exibe uma 
 * 	mensagem indicando se o n�mero informado � multiplo de 5 ou n�o.
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
	funcao inicio()
	{
		inteiro num, multiplo
		
		escreva("Digite um n�mero: ")
		leia(num)

		/* 
		 *  Para verificar se um n�mero � m�ltiplo de outro utiliza-se a opera��o
		 *  m�dulo, representada no Portugol pela operador %.
		 *  
		 *  Se o resultado da opera��o for 0, ent�o um n�mero � m�ltiplo do outro.
		 */

		limpa()
		
		se (num % 5 == 0) 
		{
			escreva("O n�mero ", num, " � multiplo de 5")	
		}
		senao
		{
			escreva("O n�mero ", num, " n�o � multiplo de 5")
		}

		escreva("\n")
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta se��o do arquivo guarda informa��es do Portugol Studio.
 * Voc� pode apag�-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 676; 
 * @DOBRAMENTO-CODIGO = [1];
 */