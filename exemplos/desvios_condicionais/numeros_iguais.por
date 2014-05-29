
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
 * 	Este exemplo pede ao usu�rio que informe um valor de 0 a 6. Logo ap�s, o programa
 * 	sorteia um valor tamb�m de 0 a 6 e exibe uma mensagem informando se o n�mero sorteado
 * 	e o n�mero digitado s�o iguais.
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
	inclua biblioteca Util --> util
	
	funcao inicio()
	{
		inteiro num_digitado, num_sorteado

		escreva("Informe um n�mero de 0 a 6: ")
		leia(num_digitado)

		num_sorteado = util.sorteia(0, 6)
		
		se (num_digitado == num_sorteado) // verifica se o valor sorteado � igual ao valor digitado pelo usu�rio 
		{
			escreva("Os n�meros s�o iguais")
		}
		senao
		{
			escreva("Os n�meros s�o diferentes")
		}
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta se��o do arquivo guarda informa��es do Portugol Studio.
 * Voc� pode apag�-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 782; 
 * @DOBRAMENTO-CODIGO = [1];
 */