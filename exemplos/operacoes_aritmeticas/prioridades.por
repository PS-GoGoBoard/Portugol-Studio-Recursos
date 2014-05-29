/**
 * /*${cursor}*/Copyright (C) 2013 - UNIVALI - Universidade do Vale do Itaja�
 * 
 * Este arquivo de c�digo fonte � livre para utiliza��o, c�pia e/ou modifica��o
 * desde que este cabe�alho, contendo os direitos autorais e a descri��o do programa, 
 * seja mantido.
 * 
 * Descri��o:
 * 
 * 	Este exemplo demonstra a prioridade das opera��es aritm�ticas no Portugol. As
 * 	opera��es de multiplica��o (*), divis�o (/) e m�dulo (%) t�m prioridade sobre
 * 	as opera��es de soma (+) e subtra��o (-). Al�m disso, o exemplo demonstra como
 * 	os parenteses podem ser utilizados para alterar esta prioridade, fazendo com 
 * 	que uma opera��o de soma ocorra antes de uma opera��o de multiplica��o.
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
		real a

		// Neste exemplo, a opera��o de multiplica��o (*) ser� executada primeiro
		a = 5.0 + 4.0 * 2.0
		escreva("5 + 4 * 2 = ", a) 


		// Neste exemplo, a opera��o de soma (+) ser� executada primeiro
		a = (5.0 + 4.0) * 2.0
		escreva("\n(5 + 4) * 2 = ", a)		

		/*
		 * Neste exemplo, a opera��o de divis�o (/) ser� executada primeiro, 
		 * seguida pela opera��o de multiplica��o (*). Por �ltimo, ser� 
		 * executada a opera��o de soma (+)
		 */
		a = 1.0 + 2.0 / 3.0 * 4.0 
		escreva("\n1 + 2 / 3 * 4 = ", a) // exibe o resultado

		/*
		 * Neste exemplo, a opera��o de soma (+) ser� executada primeiro, 
		 * seguida pela opera��o de multiplica��o (*). Por �ltimo, ser� 
		 * executada a opera��o de divis�o (/).
		 */
		a = (1.0 + 2.0) / (3.0 * 4.0)
		escreva("\n(1 + 2) / (3 * 4) = ", a) // exibe o resultado	
	}
}
