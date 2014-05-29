// Este exemplo demostra a sequencia de Fibonacci gerada recursivamente.
// O exemplo pede ao usu�rio um valor 'n' e exibe 'n' termos da s�rie de Fibonacci.
programa
{
	// Fun��o recursiva que calcula a o valor 'n' da sequencia, sendo que o valor a ser retornado � determinado pelo parametro passado.
	// Exemplo: caso seja passado 3 por parametro a fun��o ir� retornar 2, ou seja, o terceiro valor da sequencia de Fibonacci
	funcao inteiro fibonacci(inteiro numero){
		se(numero == 1 ou numero == 2){
			retorne 1
		}
		retorne fibonacci(numero-1) + fibonacci(numero-2)
	}
	
	funcao inicio()
	{
		inteiro numero
		/*${cursor}*/ 
		escreva("Digite quantos termos da s�rie de Fibonacci voc� deseja ver: ")
		leia(numero)
		
		para(inteiro i = 0; i < numero ; i++)// la�o responsavel por pegar todos os valores da sequencia at� que seja atingida a posis�o passada pelo usu�rio.
		{
			escreva(fibonacci(i+1)," ")	// chama a fun��o recursiva e exibe o valor retornado.
		}
	}
}
