// O exemplo a seguir usa um contador para exibir uma contagem regressiva na tela 
// tire o coment�rio das linha 5 e 14 para ver um efeito melhor
programa 
{
//	inclua biblioteca Util
	
	funcao inicio() 
	{
		inteiro contador = 10/*${cursor}*/
		
		enquanto (contador > 0) {
		  escreva (contador,  " ") // exibe o n�mero e um espa�o ao lado 
		  contador--
//		  Util.aguarde(1000)
		}
		escreva ("Booom !")
	}
}
