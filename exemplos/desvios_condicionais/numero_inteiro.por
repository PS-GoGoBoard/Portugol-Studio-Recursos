
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
 * 	Este exemplo pede ao usu�rio que informe um n�mero inteiro. Logo ap�s, exibe uma
 * 	mensagem indicando se o n�mero informado � positivo, negativo ou igual a zero.
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
		inteiro num
		
		escreva("Digite um n�mero inteiro: ")
		leia(num)

		se(num > 0) // Verifica se o n�mero � positivo
		{ 
			escreva("O n�mero � positivo")
		}
		senao se(num < 0) // Verifica se o n�mero � negativo
		{ 
			escreva("O n�mero � negativo")
		}
		senao // Se n�o � positivo nem negativo, s� pode ser igual a zero 
		{
			escreva("O n�mero � igual zero")
		}

		escreva("\n")		
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta se��o do arquivo guarda informa��es do Portugol Studio.
 * Voc� pode apag�-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 680; 
 * @DOBRAMENTO-CODIGO = [1];
 */