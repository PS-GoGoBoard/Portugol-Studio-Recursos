// Este exemplo preenche um vetor com n�meros sorteados e exibe-os na tela de duas formas
programa
{
	inclua biblioteca Util --> util
	funcao inicio() 
	{
		inteiro vet[10], i
		/*${cursor}*/
		// preenche o vetor
		para(i = 0; i < 10; i++){
			vet [i] = util.sorteia(1,100)			
		}

		// exibe o vetor
		escreva ("Vetor Preenchido\n")
		para(i = 0; i < 10; i++){
			escreva (vet [i], " ")			
		}
		
		// exibe o vetor ao contrario
		escreva ("\nVetor ao Contr�rio\n")
		para(i = 9; i >=0; i--){
			escreva (vet [i], " ")			
		}
		

		
	}
}
