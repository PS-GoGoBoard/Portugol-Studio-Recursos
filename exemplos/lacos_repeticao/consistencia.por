// este exemplo mostra o uso do la�o faca enquanto para uma consistencia de entrada de dados
programa
{
	funcao inicio()
	{
		inteiro idade/*${cursor}*/
		faca {
			escreva ("Por favor sua idade (valores aceito de 0 a 150):")
			leia (idade)
		} enquanto (idade < 0 ou idade > 150)
		escreva ("Correto !")
		// a partir deste ponto do c�digo � garantido que a idade ter� um valor v�lido e n�o causar� erros inesperados
		
	}
}
