// O exemplo a seguir pede ao usu�rio um valor inteiro e soma o intervalo de 1 at� o n�mero digitado

programa
{
	funcao inicio() 
	{
		inteiro soma, x, cont
		/*${cursor}*/
		escreva("Digite o n�mero at� o qual deseja somar: ")
		leia(x)

		soma = 0
		para(cont = 0; cont <= x; cont ++) // repete at� cont atingir o valor de x
		{
			soma = soma + cont // soma cada um dos valores de cont
		}
		escreva("A soma de 1 at� ", x, " �: ", soma)
	}
}
