// Este exemplo declara um vetor j� com valores e percorre o vetor procurando pelo n�mero digitado pelo usu�rio 
programa
{
	funcao inicio() 
	{ 
		inteiro vet[5] = { 1, 3, 5, 7, 9/*${cursor}*/}  // cria o vetor com estes valores dentro
		inteiro i, num
		logico achou = falso  // variavel que ajuda a indicar se o numero foi encontrado ou n�o

		escreva ("Qual n�mero deseja procurar: ")
		leia (num)

		para (i=0; i<5; i++){
			se (vet[i] == num){
				escreva ("encontrado na posi��o: ", i)
				achou = verdadeiro  
			}
		}
		se (nao achou) {
			escreva ("O n�mero n�o est� no vetor")
		}
	}
}
