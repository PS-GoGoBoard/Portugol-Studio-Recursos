// O exemplo a seguir pede que o usu�rio que entre com uma letra e verifica se essa letra � um vogal.
programa  { 
	funcao inicio ()
	{ 	
		caracter letra 
		/*${cursor}*/
		escreva("Digite uma letra: ") 
		leia(letra) 
		
		se(letra == 'a' ou letra == 'e' ou letra == 'i' ou letra == 'o' ou letra == 'u') { // verifica se a letra � uma vogal
			escreva(letra," � uma vogal.") 
		}
	} 
}
