// O exemplo solicita um valor inteiro calcula e exibe:
// a) o resultado da divis�o  inteira por 2
// b) o resto de uma divis�o inteira por 3 (mod)
programa
{
	funcao inicio() 
	{
		inteiro metadeInteira, resto, valor  
		
		escreva("Digite um valor: ") 
		leia(valor) // l� o valor digitado pelo usu�rio

		metadeInteira = valor / 2 // calcula a metade inteira do valor
		resto = valor % 3 // calcula o resto do valor por 3
		
		// Exibe os resultados 
		escreva("\nA metade inteira do numero �: ", metadeInteira)
		escreva("\nO resto do n�mero (mod) ao ser dividido  por 3 �: ", metadeInteira, /*${cursor}*/"\n")
	}
}
