// Este exemplo solicita dez n�meros au usu�rio e exibe a m�dia dos n�meros digitados
programa
{
	funcao inicio() 
	{
		real numero, soma, media
		inteiro cont = 0/*${cursor}*/
		soma = 0.0
		enquanto(cont < 10) // la�o que verifica se o valor digitado � menor ou igual ao valor da condi��o
		{
			escreva("Digite o n�mero: ")
			leia(numero)
			soma = soma + numero  // a variavel soma � o acumulador deste exemplo
			cont++  // incrementa o contador
		}
		media = soma / 10
		escreva("A m�dia dos n�meros �: ", media)
	}
}
