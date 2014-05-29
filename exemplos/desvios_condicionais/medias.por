
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
 * 	Este exemplo pede ao usu�rio que informe tr�s m�dias. Logo ap�s, calcula 
 * 	e exibe a m�dia final destas notas. Por �ltmo, verifica se alguma das 
 * 	m�dias parciais � menor que a m�dia final e a exibe (caso exista).
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
		real m1, m2, m3, media

		escreva ("Informe a m�dia 1: " )
		leia (m1)
		escreva( "Informe a m�dia 2: ")
		leia (m2)
		escreva ("Informe a m�dia 3: ")
		leia (m3)

		media = (m1 + m2 + m3) / 3 

		limpa()
		escreva ("A m�dia final �: ", media, "\n") 


		se (m1 < media)
		{ 
			escreva ("A m�dia 1 � menor que a m�dia final\n") 
		}
		
		se (m2 < media) 
		{
			escreva ("A m�dia 2 � menor que a m�dia final\n")
		}
		
		se (m3 < media)
		{
			escreva ("A m�dia 3 � menor que a m�dia final\n")
		}		
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta se��o do arquivo guarda informa��es do Portugol Studio.
 * Voc� pode apag�-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 748; 
 * @DOBRAMENTO-CODIGO = [1];
 */