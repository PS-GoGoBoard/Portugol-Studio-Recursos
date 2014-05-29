
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
 * 	Este exemplo ilustra o uso da instru��o "escolha". Para isso, o programa pede
 * 	ao usu�rio que escolha uma op��o e exibe uma frase correspondente � op��o
 * 	escolhida.
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
		inteiro opcao
		
		escreva("1) Elogio \n")
		escreva("2) Ofensa \n")
		escreva("3) Sair \n\n")

		escreva("Escolha uma op��o: ")
		leia(opcao)

		limpa()

		escolha (opcao)	
		{
			caso 1: 
		 		escreva ("Voce � lindo(a)!")
		 		pare   // Impede que as instru��es do caso 2 sejam executadas
		 	caso 2: 
		 		escreva ("Voce � um monstro!")
		 		pare   // Impede que as instru��es do caso 2 sejam executadas
		 	caso 3: 
		 		escreva ("Tchau!")
		 		pare
		 	caso contrario: // Ser� executado para qualquer op��o diferente de 1, 2 ou 3
		 		escreva ("Op��o Inv�lida !")
		}

		escreva("\n")
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta se��o do arquivo guarda informa��es do Portugol Studio.
 * Voc� pode apag�-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 689; 
 * @DOBRAMENTO-CODIGO = [1];
 */