// O exemplo a seguir exibe a tabuada de um N�mero de 1 a 10 digitados pelo usu�rio 
programa 
{
	funcao inicio() 
	{
		inteiro numero, result, contador
		/*${cursor}*/
		escreva("Informe o n�mero para ver sua tabuada: ")
		leia(numero)
		
		para (contador = 1; contador <= 10; contador ++) {
		  result = numero * contador 
		  escreva (numero, " X ", contador, " = ", result , "\n")
		}
	}
}
