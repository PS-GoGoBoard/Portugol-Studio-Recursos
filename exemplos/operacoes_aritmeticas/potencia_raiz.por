// O exemplo solicita um valor real calcula e exibe:
// a) o n�mero elevado ao cubo
// b) a raiz quadrada do n�mero 
// O programa usa a biblioteca matem�tica para fazer estes calculos 
programa
{
	inclua biblioteca Matematica --> mat  // inclui a biblioteca matem�tica
	funcao inicio() 
	{
		real valor, pot, raizq
		/*${cursor}*/
		escreva("Digite um valor: ") 
		leia(valor) // l� o valor digitado pelo usu�rio

		pot = mat.potencia(valor, 3.0) // calcula o valor elevado ao cubo
		raizq = mat.raiz (valor, 2.0) // calcula a raiz quadrada do valor

		// Exibi��o dos resultados finais
		escreva("\nO n�mero ao cubo �: ",pot,"\n")
		escreva("A raiz quadrada do n�mero �: ",raizq,"\n")
	}
}
