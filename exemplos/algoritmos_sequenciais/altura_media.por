
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
 * 	Este exemplo exemplo pede ao usu�rio a altura de 3 pessoas. Logo ap�s,
 * 	calcula e exibe a media das alturas informadas.
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
	inclua biblioteca Matematica --> mat

	funcao inicio()
	{
		real altura1, altura2, altura3, mediaAltura

		escreva("Digite a altura da primeira pessoa: ")
		leia(altura1)

		escreva("Digite a altura da segunda pessoa: ")
		leia(altura2)

		escreva("Digite a altura da terceira pessoa: ")
		leia(altura3)

		mediaAltura = (altura1 + altura2 + altura3) / 3

		escreva("\nA m�dia das alturas �:  ", mat.arredondar(mediaAltura, 2), " metros\n")
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta se��o do arquivo guarda informa��es do Portugol Studio.
 * Voc� pode apag�-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 710; 
 * @DOBRAMENTO-CODIGO = [1];
 */