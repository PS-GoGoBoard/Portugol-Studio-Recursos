// Este exemplo demostra um fatorial calculado  recursivamente.
// O exemplo pede ao usu�rio um valor e ao fim � exibido o fatorial deste n�mero.
programa
{

	// Fun��o recursiva que calcula o fatorial do n�mero passado
	funcao inteiro fatorial(inteiro numero){
		se(numero == 1 ou numero == 0){
			retorne 1 
		}
		retorne numero*fatorial(numero-1)
	}
	
	funcao inicio()
	{
		inteiro valor
		/*${cursor}*/		
		escreva("Digite um n�mero inteiro para saber o fatorial dele: ")
		leia(valor)
		
		escreva("O fatorial do n�mero digitado �: ",fatorial(valor)) // chama a fun��o recursiva e exibe o valor final
	}
}
