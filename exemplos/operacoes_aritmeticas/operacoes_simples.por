// O exemplo a seguir pede ao usu�rio dois valores e exibe a soma.
programa
{
	funcao inicio()
	{
		real a, b, soma, sub, mult, div
		
		escreva("Digite um n�mero inteiro: ")
		leia(a) // l� o primeiro valor digitado pelo usu�rio e armazena na vari�vel a

		escreva("Digite outro n�mero inteiro: ")
		leia(b) // l� o segundo valor digitado pelo usu�rio e armazena na vari�vel b

		soma = a + b // soma os dois valores
		sub  = a - b // subtrai os dois valores
		mult = a * b // multiplica os dois valores
		div  = a / b // divide os dois valores
		
		escreva("\nA soma dos n�meros � igual a: ", soma) // exibe o resultado/*${cursor}*/
		escreva("\nA subtra��o dos n�meros � igual a: ", sub) // exibe o resultado
		escreva("\nA multiplica��o dos n�meros � igual a: ", mult) // exibe o resultado
		escreva("\nA divis�o dos n�meros � igual a: ", div) // exibe o resultado
	
	}
}
