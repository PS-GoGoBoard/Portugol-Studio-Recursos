// Este exemplo pede ao usu�rio o tamanho de cada um dos lados de um tri�ngulo e ao fim exibe qual � o tipo deste tri�ngulo
programa 
{
	funcao inicio()
	{
		inteiro a,b,c
		
		escreva ("Entre com os dados do tri�ngulo: ")
		leia (a,b,c)

		se (a==b e a==c)
		{ // se os tres lados forem iguais � equilatero
			escreva ("Este tri�ngulo � equil�tero")
		}
		senao 
		{ // se chegou aqui � porque os tres n�o s�o iguais basta ver se dois deles s�o para saber se � isoceles
			se ( (a==b ou b==c) ){  
				escreva ("Este tri�ngulo � is�sceles")
			}
			senao {		
				escreva ("Este tri�ngulo � outro")
			}
		}
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta se��o do arquivo guarda informa��es do Portugol Studio.
 * Voc� pode apag�-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 237; 
 */