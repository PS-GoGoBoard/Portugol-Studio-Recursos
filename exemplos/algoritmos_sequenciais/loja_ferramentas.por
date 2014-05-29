
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
 * 	Este exemplo pede o nome do usu�rio e tr�s valores inteiros, os quais 
 * 	representam a quantidade de porcas, parafusos e arruelas compradas. 
 * 	Ap�s, exibe o nome do usu�rio seguido da quantidade de cada item comprado
 * 	e o valor total a ser pago.
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
		// Os pre�os dos produtos s�o definidos em constantes
		
		const real PRECO_PARAFUSO = 1.50
		const real PRECO_ARRUELA  = 2.00
		const real PRECO_PORCA    = 2.50

		cadeia nome
		inteiro quantidadeParafusos, quantidadeArruelas, quantidadePorcas 
		real totalParafusos, totalArruelas, totalPorcas, totalPagar 

		escreva("Digite seu nome: ") 
		leia(nome) 
		
		escreva("\nDigite a quantidade de parafusos que deseja comprar: ") 
		leia(quantidadeParafusos)
		
		escreva("Digite a quantidade de arruelas que deseja comprar: ") 
		leia(quantidadeArruelas)

		escreva("Digite a quantidade de porcas que deseja comprar: ") 
		leia(quantidadePorcas)

		/*
		 * C�lculo dos valores a serem pagos. O c�lculo � feito multiplicando
		 * a quantidade de itens vendidos pelo pre�o de cada item
		 */		
		totalParafusos = PRECO_PARAFUSO * quantidadeParafusos
		totalArruelas = PRECO_ARRUELA * quantidadeArruelas
		totalPorcas = PRECO_PORCA * quantidadePorcas
		
		totalPagar = totalParafusos + totalPorcas + totalArruelas 

		limpa()
		
		escreva("Cliente: ", nome, "\n")
		escreva("===============================\n")
		escreva("Parafusos: ", quantidadeParafusos, "\n")
		escreva("Arruelas: " , quantidadeArruelas, "\n")
		escreva("Porcas: ", quantidadePorcas, "\n")
		escreva("===============================\n")
		escreva("Total a pagar:  R$ ", totalPagar)
	} 
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta se��o do arquivo guarda informa��es do Portugol Studio.
 * Voc� pode apag�-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 815; 
 * @DOBRAMENTO-CODIGO = [1];
 */