// O exemplo a seguir pede ao usu�rio um n�mero inteiro e exibe o fatorial do n�mero passado
programa
{
	funcao inicio()
	{
		inteiro n, i
		real fat
		/*${cursor}*/
		escreva("Digite um numero \n")
		leia(n)
		
		fat=1
		i=2

		enquanto(i<=n) // intera 'i' at� o valor passado
		{
			fat = fat * i // calculo do fatorial
			i=i+1 // incremento do 'i', pode ser usado 'i++' tamb�m.
		}
		escreva("O fatorial de ",n, " �: ", fat)
	}
}
