
/* CLIQUE NO SINAL DE "+", � ESQUERDA, PARA EXIBIR A DESCRI��O DO EXEMPLO
 *  
 * Copyright (C) 2014 - UNIVALI - Universidade do Vale do Itaja�
 * 
 * Este arquivo de c�digo fonte � livre para utiliza��o, c�pia e/ou modifica��o
 * desde que este cabe�alho, contendo os direitos autorais e a descri��o do programa, 
 * seja mantido.
 * 
 * Se tiver dificuldade em compreender este exemplo, acesse as v�deoaulas do Portugol 
 * Studio para auxili�-lo:
 * 
 * https://www.youtube.com/watch?v=K02TnB3IGnQ&list=PLb9yvNDCid3jQAEbNoPHtPR0SWwmRSM-t
 * 
 * Descri��o:
 * 
 * 	Este exemplo � um Jogo escrito em Portugol no qual o jogador controla uma nave que
 * 	deve pousar na lua o mais r�pido poss�vel. O exemplo demonstra como utilizar algumas 
 * 	das bibliotecas existentes no Portugol. Neste exemplo, tamb�m � poss�vel ver algumas
 * 	t�cnicas utilizadas na cria��o de jogos.
 *	
 *	As regras do jogo s�o as seguintes:
 *	
 *		a) O jogador perde se guiar a nave para fora da tela
 *		b) O jogador perde se pousar a nave fora da plataforma de pouso
 *		c) O jogador perde se pousar a nave muito r�pido
 * 	
 *   Jogo adaptado de http://www.gametutorial.net/article/Keyboard-input---Moon-lander
 * 	
 * Autores:
 * 
 * 	Fillipi Domingos Pelz
 *   Luiz Fernando Noschang (noschang@univali.br)
 *   
 * Data: 08/09/2013
 */

programa
{
	inclua biblioteca Graficos --> g
	inclua biblioteca Teclado --> t
	inclua biblioteca Util --> u
	inclua biblioteca Tipos --> tp
	inclua biblioteca Matematica --> m
	inclua biblioteca Sons --> sn

	/* Dimens�es da tela do jogo */ 
	const inteiro LARGURA_DA_TELA = 800, ALTURA_DA_TELA = 600

	
	/* 
	 * Constante que define quanto tempo o jogo deve aguardar na tela inicial at� iniciar 
	 * a demonstra��o caso nenhuma tecla seja pressionada.
	 * 
	 * Este tempo tamb�m � usado para decidir quanto tempo a intelig�ncia artifical deve
	 * aguardar para reiniciar a demonstra��o ap�s pousar, quebrar ou ir para o espa�o.
	 */
	const inteiro TEMPO_DE_ESPERA_DA_DEMONSTRACAO = 5000


	/* Constantes para controle da f�sica do jogo */
	const real ACELERACAO_GRAVIDADE = 0.1270, VELOCIDADE_MAXIMA_GRAVIDADE = 3.1760
	
	const real ACELERACAO_FOGUETE = 0.1412, VELOCIDADE_MAXIMA_FOGUETE = 14.1160
	
	const real PERCENTUAL_VELOCIDADE_HORIZONTAL = 0.7058, VELOCIDADE_MAXIMA_POUSO = 1.7645


	/* 
	 * Esta constante define a que dist�ncia ir� se considerarq que o foguete est� pr�ximo 
	 * da plataformma.
	 * 
	 * � utilizada pela intelig�ncia artificial da demonstra��o para saber quando o foguete 
	 * deve ser acelerado.
	 */
	const inteiro DISTANCIA_DE_PROXIMIDADE_DA_PLATAFORMA = 70

	/* Define quantos quadros ser�o desenhados por segundo (FPS) */
	const inteiro TAXA_DE_ATUALIZACAO = 85


	/* Constantes que definem as telas do jogo */
	const inteiro TELA_SAIR = 0, TELA_MENU = 1, TELA_JOGO = 2, TELA_POUSOU = 3
	
	const inteiro TELA_QUEBROU = 4, TELA_ESPACO = 5, TELA_DEMONSTRACAO = 6

	/* Vari�veis que controlam o fluxo de telas do jogo */
	inteiro tela_atual = TELA_MENU, tela_anterior = TELA_SAIR

	logico executando_demonstracao = falso
	
		
	/* 
	 * Vari�veis que armazenam as dimens�es e posi��es dos objetos no jogo. S�o calculadas
	 * de acordo com as imagens que s�o utilizadas.
	 */

	inteiro x_do_foguete = 0, y_do_foguete = 0, largura_do_foguete = 0, altura_do_foguete = 0
	
	inteiro x_da_plataforma = 0, y_da_plataforma = 0, largura_da_plataforma = 0, altura_da_plataforma = 0

	inteiro x_da_lua = 0, y_da_lua = 0, largura_da_lua = 0, altura_da_lua = 0

	inteiro centro_da_tela = LARGURA_DA_TELA / 2
	

	/* Vari�veis utilizadas para controlar a velocidade de foguete */
	real velocidade_vertical = 0.0, velocidade_horizontal = 0.0


	/* Vari�veis que controlam o estado do movimento do foguete */
	logico foguete_esta_acelerando = falso

	logico foguete_esta_movendo_para_a_direita = falso
	
	logico foguete_esta_movendo_para_a_esquerda = falso
	
	logico inteligencia_artificial_decidiu_acelerar = falso	
	
	
	/* Vari�veis utilizadas para controlar o FPS e o tempo de jogo */
	inteiro tempo_inicio_jogo = 0

	inteiro tempo_inicio = 0, tempo_decorrido = 0, tempo_restante = 0, tempo_quadro = 1000 / TAXA_DE_ATUALIZACAO
	
	inteiro tempo_inicio_fps = 0, tempo_fps = 0, frames = 0, fps = 0

	inteiro tempo_inicio_tela = 0, tempo_inicio_aceleracao = 0, tempo_escolhido_aceleracao = 0

	
	/* Vari�veis que armazenam o endere�o de mem�ria das imagens utilizadas no jogo */
	inteiro imagem_de_fundo_do_cenario = 0, imagem_de_fundo_do_menu = 0
	
	inteiro imagem_do_foguete = 0, imagem_foguete_quebrado = 0
	
	inteiro imagem_da_lua = 0, imagem_dos_planetas=0
	
	inteiro imagem_jato = 0, imagem_jato2 = 0, imagem_da_plataforma = 0, imagem_do_fogo = 0

	/* Var�veis que armazenam o endere�o da m�sica de fundo do jogo e dos sons */
	inteiro musica_de_fundo = -1, som_houston = -1


	/* Vari�veis que controlam a anima��o do fogo quando o foguete quebrou */
	inteiro indice_imagem_fogo = 0
	
	logico alternou_imagem_fogo = falso


	/* Vari�veis que controlam a anima��o das estrelas e dos planetas no fundo do cen�rio */
	inteiro indice_do_fundo_do_cenario = 0, indice_dos_planetas = 0, ultimo_giro_fundo = 0, ultimo_giro_planetas = 0
	
	
	funcao inicio()
	{
		inicializar()		

		enquanto (tela_atual != TELA_SAIR)
		{
			escolha (tela_atual)
			{
				caso TELA_MENU			: 	tela_menu() 			pare
				caso TELA_JOGO			:	tela_jogo()			pare
				caso TELA_POUSOU		:	tela_pousou()			pare
				caso TELA_QUEBROU		:	tela_quebrou()			pare
				caso TELA_ESPACO		:	tela_espaco()			pare
				caso TELA_DEMONSTRACAO	: 	tela_demonstracao() 	pare
			}
		}
		
		finalizar()
	}

	funcao tela_menu()
	{
		executando_demonstracao = falso
		tempo_inicio_tela = u.tempo_decorrido()
		
		enquanto (tela_atual == TELA_MENU)
		{
			se (tempo_dentro_da_tela() >= TEMPO_DE_ESPERA_DA_DEMONSTRACAO)
			{
				ir_para_a_tela(TELA_DEMONSTRACAO)
			}
			senao
			{			
				iniciar_sincronia_da_taxa_de_atualizacao()
			
				desenhar_tela_menu()
			
				finalizar_sincronia_da_taxa_de_atualizacao()

				navegacao_tela_menu()
			}
		}
	}

	funcao inteiro tempo_dentro_da_tela()
	{
		retorne u.tempo_decorrido() - tempo_inicio_tela
	}

	funcao navegacao_tela_menu()
	{		
		se (t.tecla_pressionada(t.TECLA_ENTER))
		{
			ir_para_a_tela(TELA_JOGO)
		}
		senao se (t.tecla_pressionada(t.TECLA_ESC))
		{
			ir_para_a_tela(TELA_SAIR)
		}
	}

	funcao desenhar_tela_menu()
	{
		inteiro y_opcoes = 340
		
		g.definir_fonte_texto("Poetsen One")
		g.definir_tamanho_texto(20.0)
		g.definir_cor(0xFFFFFF)
		g.definir_estilo_texto(falso, falso, falso)

		g.desenhar_imagem(0, 0, imagem_de_fundo_do_menu)
		
		g.definir_cor(0x333333)
		desenhar_texto_centralizado("Utilize as teclas W, A e D  ou as setas direcionais para jogar", y_opcoes + 225)
		
		g.definir_cor(0xFFFFFF)
		
		desenhar_texto_centralizado("Pressione ENTER para iniciar", y_opcoes + 70)
		desenhar_texto_centralizado("Pressione ESC para sair", y_opcoes + 100)

		g.renderizar()
	}

	funcao desenhar_texto_centralizado(cadeia texto, inteiro y)
	{
		g.desenhar_texto(centro_da_tela - g.largura_texto(texto) / 2, y, texto)
	}

	funcao tela_jogo()
	{
		executando_demonstracao = falso
		reiniciar_jogo()		
		
		enquanto (tela_atual == TELA_JOGO)
		{
			iniciar_sincronia_da_taxa_de_atualizacao()

			ler_controles_do_usuario()
			atualizar_fisica_do_jogo()
			desenhar_tela_do_jogo()
			
			finalizar_sincronia_da_taxa_de_atualizacao()

			se (t.tecla_pressionada(t.TECLA_ESC))
			{
				ir_para_a_tela(TELA_MENU)
			}
		}
	}

	funcao tela_pousou()
	{
		inteiro tempo_total_de_jogo = u.tempo_decorrido() - tempo_inicio_jogo

		tempo_inicio_tela = u.tempo_decorrido()
		
		enquanto (tela_atual == TELA_POUSOU)
		{
			iniciar_sincronia_da_taxa_de_atualizacao()
			 
			desenhar_tela_pousou(tempo_total_de_jogo)

			finalizar_sincronia_da_taxa_de_atualizacao()
			
			navegacao_tela_pouso()
		}
	}

	funcao tela_demonstracao()
	{
		executando_demonstracao = verdadeiro
		tempo_inicio_tela = u.tempo_decorrido()

		reiniciar_jogo()

		enquanto (tela_atual == TELA_DEMONSTRACAO)
		{
			iniciar_sincronia_da_taxa_de_atualizacao()

			reiniciar_variaveis_de_controle()
			aplicar_inteligencia_artificial()
			atualizar_fisica_do_jogo()
			desenhar_tela_do_jogo()
			
			finalizar_sincronia_da_taxa_de_atualizacao()

			navegacao_tela_demonstracao()
		}
	}

	funcao navegacao_tela_demonstracao()
	{
		se (t.alguma_tecla_pressionada())
		{
			ir_para_a_tela(TELA_MENU)
		}
	}

	funcao reiniciar_variaveis_de_controle()
	{
		foguete_esta_acelerando = falso
		foguete_esta_movendo_para_a_direita = falso
		foguete_esta_movendo_para_a_esquerda = falso
	}

	funcao aplicar_inteligencia_artificial()
	{
		decidir_movimentacao_horizontal()
		decidir_movimentacao_vertical()		
	}

	funcao decidir_movimentacao_horizontal()
	{
		se (foguete_esta_fora_da_plataforma())
		{
			se (foguete_esta_do_lado_direito_da_tela())
			{
				mover_foguete_para_a_esquerda()
			}
			senao se (foguete_esta_do_lado_esquerdo_da_tela())
			{
				mover_foguete_para_a_direita()
			}
		}
		senao
		{
			inteiro probabilidade = u.sorteia(1, 100)

			/* 
			 * Se o foguete estiver dentro da plataforma, move para um dos lados, com 50%
			 * de probabilidade para cada lado. 
			 * 
			 * Esta movimenta��o para fora da plataforma deixa a demonstra��o mais realista, 
			 * mais pr�xima da movimenta��o de um jogador real. 
			 * 
			 * Al�m disso, ela faz com que em alguns caso a intelig�ncia artifical perca por
			 * pousar fora da plataforma, o que tamb�m contribui para deixar a IA mais realista.
			 */
			
			se (probabilidade <= 50)
			{
				mover_foguete_para_a_esquerda()
			}
			senao
			{
				mover_foguete_para_a_direita()
			}
		}
	}

	funcao decidir_movimentacao_vertical()
	{
		se (inteligencia_artificial_decidiu_acelerar)
		{
			se (duracao_da_aceleracao_do_foguete() < tempo_escolhido_aceleracao)
			{			
				acelerar_foguete()
			}
			senao
			{
				inteligencia_artificial_decidiu_acelerar = falso
			}
		}
		senao se (foguete_esta_proximo_da_altura_de_pouso() e foguete_esta_acima_da_velocidade_de_pouso())
		{
			inteligencia_artificial_decidiu_acelerar = verdadeiro
			tempo_inicio_aceleracao = u.tempo_decorrido()

			inteiro probabilidade = u.sorteia(1, 100)

			/* 
			 * Cria uma probabilidade de 5% de o foguete acelerar por tempo demais e se perder 
			 * no espa�o. Esta movimenta��o deixa a IA mais realista.
			 */
			
			se (probabilidade <= 5) 
			{				
				tempo_escolhido_aceleracao = u.sorteia(500, 1000)
			}
			senao
			{
				tempo_escolhido_aceleracao = u.sorteia(150, 350)
			}
		}
	}

	funcao inteiro duracao_da_aceleracao_do_foguete()
	{
		retorne u.tempo_decorrido() - tempo_inicio_aceleracao
	}
	
	funcao navegacao_tela_pouso()
	{
		se (executando_demonstracao)
		{
			se (t.alguma_tecla_pressionada())
			{
				ir_para_a_tela(TELA_MENU)
			}
			senao se (tempo_dentro_da_tela() >= TEMPO_DE_ESPERA_DA_DEMONSTRACAO)
			{
				ir_para_a_tela(TELA_DEMONSTRACAO)
			}
		}
		senao
		{
			se (t.tecla_pressionada(t.TECLA_ENTER))
			{
				ir_para_a_tela(TELA_JOGO)
			}
			senao se (t.tecla_pressionada(t.TECLA_ESC))
			{
				ir_para_a_tela(TELA_MENU)
			}
		}
	}

	funcao desenhar_tela_pousou(inteiro tempo_total_de_jogo)
	{		
		desenhar_fundo_do_cenario()
		desenhar_planetas()
		desenhar_superficie_lunar()
		desenhar_foguete_pousado()
		desenhar_texto_tela_pousou(tempo_total_de_jogo)
		desenhar_taxa_de_fps()

		g.renderizar()
	}

	funcao desenhar_texto_tela_pousou(inteiro tempo_total_de_jogo)
	{
		inteiro segundos = tempo_total_de_jogo / 1000
		
		g.definir_fonte_texto("Poetsen One")
		g.definir_tamanho_texto(22.0)
		g.definir_cor(0xFFFFFF)
		g.definir_estilo_texto(falso, falso, falso)
		
		desenhar_texto_centralizado("Parab�ns, voc� venceu!", 240)

		se (segundos > 1)
		{
			desenhar_texto_centralizado("Voc� pousou em " + segundos  + " segundos!", 270)
		}
		senao
		{
			desenhar_texto_centralizado("Voc� pousou em 1 segundo!", 270)
		}
		
		desenhar_texto_centralizado("Pressione ENTER para jogar novamente", 300)
		desenhar_texto_centralizado("Pressione ESC para sair", 330)
	}

	funcao tela_quebrou()
	{
		sn.reproduzir_som(som_houston, falso)
		tempo_inicio_tela = u.tempo_decorrido()
		
		enquanto (tela_atual == TELA_QUEBROU)
		{
			iniciar_sincronia_da_taxa_de_atualizacao()
			
			desenhar_tela_quebrou()
			
			finalizar_sincronia_da_taxa_de_atualizacao()

			navegacao_tela_quebrou()
		}
	}

	funcao navegacao_tela_quebrou()
	{
		se (executando_demonstracao)
		{
			se (t.alguma_tecla_pressionada())
			{
				ir_para_a_tela(TELA_MENU)
			}
			senao se (tempo_dentro_da_tela() >= TEMPO_DE_ESPERA_DA_DEMONSTRACAO)
			{
				ir_para_a_tela(TELA_DEMONSTRACAO)
			}
		}
		senao
		{		
			se (t.tecla_pressionada(t.TECLA_ENTER))
			{
				ir_para_a_tela(TELA_JOGO)
			}
			senao se (t.tecla_pressionada(t.TECLA_ESC))
			{
				ir_para_a_tela(TELA_MENU)
			}
		}		
	}
	
	funcao desenhar_tela_quebrou()
	{
		desenhar_fundo_do_cenario()
		desenhar_planetas()
		desenhar_superficie_lunar()
		desenhar_foguete_pegando_fogo()
		desenhar_texto_tela_quebrou()
		desenhar_taxa_de_fps()
		
		g.renderizar()
	}

	funcao desenhar_texto_tela_quebrou()
	{
		g.definir_fonte_texto("Poetsen One")
		g.definir_tamanho_texto(22.0)
		g.definir_cor(0xFFFFFF)
		g.definir_estilo_texto(falso, falso, falso)

       	se (foguete_esta_fora_da_plataforma())
       	{
			desenhar_texto_centralizado("Que pena, voc� pousou fora da plataforma!", 270)
       	}
       	senao se (foguete_esta_acima_da_velocidade_de_pouso())
       	{
       		desenhar_texto_centralizado("Que pena, voc� pousou r�pido demais!", 270)
       	}
       	
		desenhar_texto_centralizado("Pressione ENTER para jogar novamente", 300)
		desenhar_texto_centralizado("Pressione ESC para sair", 330)
	}

	funcao desenhar_foguete_pegando_fogo()
	{
		desenhar_foguete_quebrado()
		desenhar_fogo_do_foguete_quebrado()
	}

	funcao desenhar_fogo_do_foguete_quebrado()
	{
		se (tempo_inicio % 150 < 75) // A cada 150 milissegundos, alterna a imagem do fogo
		{
			se (nao alternou_imagem_fogo)
			{
				indice_imagem_fogo = (indice_imagem_fogo + 1) % 6
				alternou_imagem_fogo = verdadeiro
			}
		}
		senao
		{
			alternou_imagem_fogo = falso
		}            	

		g.desenhar_porcao_imagem(x_do_foguete + 20, y_da_superficie_de_pouso() - 30, indice_imagem_fogo * 30, 0, 30, 45, imagem_do_fogo)
	}

	funcao desenhar_foguete_quebrado()
	{
		g.desenhar_imagem(x_do_foguete, y_da_superficie_de_pouso() - 43, imagem_foguete_quebrado)
	}

	funcao desenhar_foguete_voando()
	{	
		desenhar_sombra_do_foguete()
			
		se (foguete_esta_acelerando)
		{
			desenhar_jato_do_foguete()
		}
		
		g.desenhar_imagem(x_do_foguete, y_do_foguete, imagem_do_foguete)
	}

	funcao desenhar_foguete_pousado()
	{	
		desenhar_sombra_do_foguete()
		
		g.desenhar_imagem(x_do_foguete, y_do_foguete, imagem_do_foguete)
	}

	funcao tela_espaco()
	{
		sn.reproduzir_som(som_houston, falso)
		tempo_inicio_tela = u.tempo_decorrido()
		
		enquanto (tela_atual == TELA_ESPACO)
		{
			iniciar_sincronia_da_taxa_de_atualizacao()
			
			desenhar_tela_espaco()

			finalizar_sincronia_da_taxa_de_atualizacao()

			navegacao_tela_espaco()
		}
	}

	funcao navegacao_tela_espaco()
	{
		se (executando_demonstracao)
		{
			se (t.alguma_tecla_pressionada())
			{
				ir_para_a_tela(TELA_MENU)
			}
			senao se (tempo_dentro_da_tela() >= TEMPO_DE_ESPERA_DA_DEMONSTRACAO)
			{
				ir_para_a_tela(TELA_DEMONSTRACAO)
			}
		}
		senao 
		{
			se (t.tecla_pressionada(t.TECLA_ENTER))
			{
				ir_para_a_tela(TELA_JOGO)
			}
			senao se (t.tecla_pressionada(t.TECLA_ESC))
			{
				ir_para_a_tela(TELA_MENU)
			}
			
		}
	}

	funcao desenhar_tela_espaco()
	{
		desenhar_fundo_do_cenario()
		desenhar_planetas()
		desenhar_superficie_lunar()
		desenhar_texto_tela_espaco()
		desenhar_taxa_de_fps()		

		g.renderizar()
	}

	funcao desenhar_texto_tela_espaco()
	{
		g.definir_fonte_texto("Poetsen One")
		g.definir_tamanho_texto(22.0)
		g.definir_cor(0xFFFFFF)
		g.definir_estilo_texto(falso, falso, falso)
   		
       	desenhar_texto_centralizado("Que pena, voc� perdeu o controle e ficou � deriva no espa�o!", 270)
		desenhar_texto_centralizado("Pressione ENTER para jogar novamente", 300)
		desenhar_texto_centralizado("Pressione ESC para sair", 330)
	}

	funcao ir_para_a_tela(inteiro nova_tela)
	{
		se (nova_tela != tela_atual)
		{
			tela_anterior = tela_atual
			tela_atual = nova_tela

			se (nova_tela == TELA_MENU)
			{				
				u.aguarde(200)
			}
		}		
	}

	funcao atualizar_fisica_do_jogo()
	{				
		atualizar_velocidade_vertical()
		atualizar_velocidade_horizontal()
		atualizar_posicao_do_foguete()
		atualizar_estado_do_foguete()		
	}

	funcao atualizar_posicao_do_foguete()
	{
		y_do_foguete = y_do_foguete + tp.real_para_inteiro(m.arredondar(velocidade_vertical, 1))
		x_do_foguete = x_do_foguete + tp.real_para_inteiro(m.arredondar(velocidade_horizontal, 1))
	}

	funcao atualizar_velocidade_vertical()
	{
		se (foguete_esta_acelerando)
		{
			velocidade_vertical = velocidade_vertical - ACELERACAO_FOGUETE
	
	     	se (velocidade_vertical < -VELOCIDADE_MAXIMA_FOGUETE)
	     	{
				velocidade_vertical = -VELOCIDADE_MAXIMA_FOGUETE
	     	}
		}
		senao
		{
			velocidade_vertical = velocidade_vertical + ACELERACAO_GRAVIDADE
	
			se (velocidade_vertical > VELOCIDADE_MAXIMA_GRAVIDADE)
			{
				velocidade_vertical = VELOCIDADE_MAXIMA_GRAVIDADE
			}
		}			
	}

	funcao atualizar_velocidade_horizontal()
	{
		real aceleracao_horizontal = ACELERACAO_FOGUETE * PERCENTUAL_VELOCIDADE_HORIZONTAL
		
		se (foguete_esta_movendo_para_a_esquerda)
		{
			velocidade_horizontal = velocidade_horizontal - aceleracao_horizontal
		}
		senao se (velocidade_horizontal < 0)
		{
			velocidade_horizontal = velocidade_horizontal + aceleracao_horizontal			
		}


		se (foguete_esta_movendo_para_a_direita)
		{
			velocidade_horizontal = velocidade_horizontal + aceleracao_horizontal
		}
		senao se (velocidade_horizontal > 0)
		{
			velocidade_horizontal = velocidade_horizontal - aceleracao_horizontal
		}		
	}

	funcao ler_controles_do_usuario()
	{	
		reiniciar_variaveis_de_controle()
		
		se (t.tecla_pressionada(t.TECLA_W) ou t.tecla_pressionada(t.TECLA_SETA_ACIMA))
		{
	     	acelerar_foguete()
	     }

	     se (t.tecla_pressionada(t.TECLA_A) ou t.tecla_pressionada(t.TECLA_SETA_ESQUERDA))
		{
			mover_foguete_para_a_esquerda()
		}
		senao se (t.tecla_pressionada(t.TECLA_D) ou t.tecla_pressionada(t.TECLA_SETA_DIREITA))
		{
			mover_foguete_para_a_direita()	
		}
	}

	funcao mover_foguete_para_a_direita()
	{
		foguete_esta_movendo_para_a_direita = verdadeiro
	}

	funcao mover_foguete_para_a_esquerda()
	{
		foguete_esta_movendo_para_a_esquerda = verdadeiro
	}

	funcao acelerar_foguete()
	{
          foguete_esta_acelerando = verdadeiro
	}

	funcao atualizar_estado_do_foguete()
	{
		se (foguete_foi_para_o_espaco())
		{
			ir_para_a_tela(TELA_ESPACO)
		}
		senao se (foguete_pousou_fora_da_plataforma())
		{
			ir_para_a_tela(TELA_QUEBROU)
		}
		senao se (foguete_pousou_muito_rapido())
		{
			ir_para_a_tela(TELA_QUEBROU)
       	}
       	senao se (foguete_pousou_dentro_da_plataforma())
		{
			ir_para_a_tela(TELA_POUSOU)
		}
	}

	funcao logico foguete_pousou_dentro_da_plataforma()
	{
		logico foguete_esta_na_velocidade_ideal = velocidade_vertical <= VELOCIDADE_MAXIMA_POUSO
		
		retorne 
		
			foguete_esta_dentro_da_plataforma() e 
			foguete_esta_na_altura_de_pouso() e
			foguete_esta_na_velocidade_ideal
	}

	funcao logico foguete_pousou_muito_rapido()
	{
		retorne 
		
			foguete_esta_dentro_da_plataforma() e
			foguete_esta_na_altura_de_pouso() e
			foguete_esta_acima_da_velocidade_de_pouso()
	}

	funcao logico foguete_esta_acima_da_velocidade_de_pouso()
	{
		retorne velocidade_vertical > VELOCIDADE_MAXIMA_POUSO
	}

	funcao logico foguete_pousou_fora_da_plataforma()
	{
		retorne 
		
			foguete_esta_fora_da_plataforma() e
			foguete_esta_na_altura_de_pouso()
	}	

	funcao logico foguete_foi_para_o_espaco()
	{
		retorne 
		
			foguete_saiu_da_tela_na_esquerda() ou 
			foguete_saiu_da_tela_na_direita() ou
			foguete_saiu_da_tela_no_topo()
	}

	funcao logico foguete_esta_na_altura_de_pouso()
	{
		retorne base_do_foguete() - 5 >= y_da_superficie_de_pouso()
	}

	funcao logico foguete_esta_proximo_da_altura_de_pouso()
	{
		inteiro distancia_da_altura_de_pouso = (base_do_foguete() - 5 - y_da_superficie_de_pouso()) * -1

		retorne distancia_da_altura_de_pouso <= DISTANCIA_DE_PROXIMIDADE_DA_PLATAFORMA
	}

	funcao logico foguete_esta_dentro_da_plataforma()
	{		

		/*
		 * A imagem da plataforma possui bordas de 15 pixels na direita e na esquerda, por isso
		 * � preciso somar e subtrair estes pixels das bordas para que o c�lculo funcione.
		 * 
		 * Futuramente isto ser� corrigido na pr�pria imagem, eliminando as bordas
		 */
		
		inteiro borda_esquerda_da_plataforma = x_da_plataforma + 15
		inteiro borda_direita_da_plataforma = x_da_plataforma + largura_da_plataforma - 15

		retorne 
			
			borda_esquerda_do_foguete() > borda_esquerda_da_plataforma e 
			borda_direita_do_foguete() < borda_direita_da_plataforma
	}

	funcao logico foguete_esta_fora_da_plataforma()
	{
		retorne nao foguete_esta_dentro_da_plataforma()
	}

	funcao logico foguete_saiu_da_tela_no_topo()
	{
		inteiro topo_da_tela = 0

		retorne base_do_foguete() < topo_da_tela
	}

	funcao logico foguete_saiu_da_tela_na_esquerda()
	{
		inteiro borda_esquerda_da_tela = 0
		
		retorne borda_direita_do_foguete() < borda_esquerda_da_tela
	}

	funcao logico foguete_saiu_da_tela_na_direita()
	{
		inteiro borda_direita_da_tela = LARGURA_DA_TELA

		retorne borda_esquerda_do_foguete() > borda_direita_da_tela
	}

	funcao logico foguete_esta_do_lado_esquerdo_da_tela()
	{
		retorne borda_direita_do_foguete() < (LARGURA_DA_TELA / 2)
	}

	funcao logico foguete_esta_do_lado_direito_da_tela()
	{
		retorne borda_esquerda_do_foguete() >= (LARGURA_DA_TELA / 2)
	}

	funcao inteiro borda_direita_do_foguete()
	{
		retorne x_do_foguete + largura_do_foguete - 15
	}
	
	funcao inteiro borda_esquerda_do_foguete()
	{
		retorne x_do_foguete + 15
	}

	funcao contar_taxa_de_fps()
	{
		frames = frames + 1
		tempo_fps = u.tempo_decorrido() - tempo_inicio_fps

		se (tempo_fps >= 1000)
		{
			fps = frames
			tempo_inicio_fps = u.tempo_decorrido() - (tempo_fps - 1000)
			frames = 0
		}
	}

	funcao desenhar_taxa_de_fps()
	{
		g.definir_tamanho_texto(12.0)
		g.definir_cor(0xFFFFFF)
		g.definir_estilo_texto(falso, verdadeiro, falso)
		g.desenhar_texto(25, 40, "FPS: " + fps)
	}

	funcao desenhar_fundo_do_cenario()
	{				
		se (indice_do_fundo_do_cenario > LARGURA_DA_TELA)
		{
			inteiro delta = LARGURA_DA_TELA - (indice_do_fundo_do_cenario - LARGURA_DA_TELA)
			
			g.desenhar_porcao_imagem(0, 0, indice_do_fundo_do_cenario, 0, delta, ALTURA_DA_TELA, imagem_de_fundo_do_cenario)
			g.desenhar_porcao_imagem(delta, 0, 0, 0, LARGURA_DA_TELA, ALTURA_DA_TELA, imagem_de_fundo_do_cenario)
		}
		senao
		{
			g.desenhar_porcao_imagem(0, 0, indice_do_fundo_do_cenario, 0, LARGURA_DA_TELA, ALTURA_DA_TELA, imagem_de_fundo_do_cenario)
		}
		
		atualizar_indice_do_fundo_do_cenario()
	}

	funcao atualizar_indice_do_fundo_do_cenario()
	{
		se (tempo_inicio - ultimo_giro_fundo > 35)
		{
			indice_do_fundo_do_cenario = (indice_do_fundo_do_cenario + 1) % (LARGURA_DA_TELA * 2)
			ultimo_giro_fundo = tempo_inicio
		}
	}
	
	funcao desenhar_planetas()
	{
		se (indice_dos_planetas > LARGURA_DA_TELA)
		{
			inteiro delta = LARGURA_DA_TELA - (indice_dos_planetas - LARGURA_DA_TELA)
			
			g.desenhar_porcao_imagem(0, 0, indice_dos_planetas, 0, delta, ALTURA_DA_TELA, imagem_dos_planetas)
			g.desenhar_porcao_imagem(delta, 0, 0, 0, LARGURA_DA_TELA, ALTURA_DA_TELA, imagem_dos_planetas)
		}
		senao
		{
			g.desenhar_porcao_imagem(0, 0, indice_dos_planetas, 0, LARGURA_DA_TELA, ALTURA_DA_TELA, imagem_dos_planetas)
		}
		
		atualizar_indice_dos_planetas()	
	}

	funcao atualizar_indice_dos_planetas()
	{
		se (tempo_inicio - ultimo_giro_planetas > 100)
		{
			indice_dos_planetas = (indice_dos_planetas + 1) % (LARGURA_DA_TELA * 2)
			ultimo_giro_planetas = tempo_inicio
		}
	}
	
	funcao desenhar_tela_do_jogo()
	{		
		desenhar_fundo_do_cenario()
		desenhar_planetas()
		desenhar_superficie_lunar()
		desenhar_foguete_voando()
        	desenhar_taxa_de_fps()
        	
		g.renderizar()
	}

	funcao desenhar_jato_do_foguete()
	{
		inteiro largura_do_jato = g.largura_imagem(imagem_jato)
		inteiro y_do_jato = base_do_foguete() - 20
		inteiro x_do_jato = x_do_centro_do_foguete() - (largura_do_jato / 2)
		
		se (tempo_inicio % 100 < 50) // Alterna a imagem do jato do foguete a cada 100 milisegundos
		{
			g.desenhar_imagem(x_do_jato, y_do_jato, imagem_jato)
		}
		senao
		{
			g.desenhar_imagem(x_do_jato, y_do_jato, imagem_jato2)
		}
	}

	funcao desenhar_superficie_lunar()
	{
		g.desenhar_imagem(x_da_lua, y_da_lua, imagem_da_lua)
		g.desenhar_imagem(x_da_plataforma, y_da_plataforma, imagem_da_plataforma)
	}

	funcao desenhar_sombra_do_foguete()
	{
		inteiro x_da_sombra = x_do_centro_do_foguete() - (largura_da_sombra() / 2)
		inteiro y_da_sombra = y_da_superficie_de_pouso()
		
		g.definir_cor(g.COR_PRETO)
		g.definir_opacidade(128)
		g.desenhar_elipse(x_da_sombra, y_da_sombra, largura_da_sombra(), altura_da_sombra(), verdadeiro)		
		g.definir_opacidade(255)
	}

	funcao inteiro largura_da_sombra()
	{
		retorne largura_do_foguete - (distancia_entre_o_foguete_e_a_plataforma() / 14)
	}

	funcao inteiro altura_da_sombra()
	{
		retorne largura_da_sombra() / 10
	}

	funcao inteiro distancia_entre_o_foguete_e_a_plataforma()
	{
		retorne y_do_centro_da_plataforma() - base_do_foguete()
	}

	funcao inteiro y_da_superficie_de_pouso()
	{		
		real meio_da_tela = LARGURA_DA_TELA / 2.0
		real distancia_do_meio_da_tela = m.valor_absoluto(meio_da_tela - x_do_centro_do_foguete())
		
		inteiro deslocamento_em_relacao_a_superficie = tp.real_para_inteiro(distancia_do_meio_da_tela / 9.0)
		
		retorne y_do_centro_da_plataforma() + deslocamento_em_relacao_a_superficie - (altura_da_sombra() / 2)
	}

	funcao inteiro x_do_centro_do_foguete()
	{
		/* 
		 *  A imagem do foguete tem bordas diferentes na esquerda e na direita, por isso �
		 *  necess�rio acrescentar 4 pixels para corrigir esta diferen�a.
		 *  
		 *  Isto dever� ser corrigido na pr�pria imagem futuramente
		 */
		
		retorne x_do_foguete + (largura_do_foguete / 2) + 4
	}

	funcao inteiro base_do_foguete()
	{
		retorne y_do_foguete + altura_do_foguete
	}

	funcao inteiro y_do_centro_da_plataforma()
	{
		retorne y_da_plataforma + (altura_da_plataforma / 2)
	}

	funcao iniciar_sincronia_da_taxa_de_atualizacao()
	{
		tempo_inicio = u.tempo_decorrido() + tempo_restante
	}

	funcao finalizar_sincronia_da_taxa_de_atualizacao()
	{
		tempo_decorrido = u.tempo_decorrido() - tempo_inicio
		tempo_restante = tempo_quadro - tempo_decorrido 

		enquanto (TAXA_DE_ATUALIZACAO > 0 e tempo_restante > 0)
		{
			tempo_decorrido = u.tempo_decorrido() - tempo_inicio
			tempo_restante = tempo_quadro - tempo_decorrido
		}

		contar_taxa_de_fps()
	}

	funcao reiniciar_jogo()
	{
		x_do_foguete = u.sorteia(10, LARGURA_DA_TELA - largura_do_foguete - 10)
		y_do_foguete = 0
		
		reiniciar_variaveis_de_controle()
		
		velocidade_vertical = 0.0
		velocidade_horizontal = 0.0

		tempo_restante = 0		
		tempo_inicio_jogo = u.tempo_decorrido()
		
		frames = 0
		
		// Hack para n�o exibir o FPS zerado na primeira vez que desenhar a tela
		tempo_inicio_fps = u.tempo_decorrido() - 1000
	}

	funcao inicializar()
	{
		carregar_imagens()
		carregar_fontes()
		carregar_sons()
		
		inicializar_janela()		
		calcular_posicoes_e_dimensoes_dos_objetos()

		inteiro reproducao = sn.reproduzir_som(musica_de_fundo, verdadeiro)
		sn.definir_volume_reproducao(reproducao, 65)
	}

	funcao carregar_imagens()
	{
		cadeia pasta_imagens = "./moon_lander/"

		imagem_de_fundo_do_menu = g.carregar_imagem(pasta_imagens + "menu.jpg")
		
		imagem_de_fundo_do_cenario = g.carregar_imagem(pasta_imagens + "fundo.jpg")
		imagem_dos_planetas = g.carregar_imagem(pasta_imagens + "planetas.png")

		imagem_da_lua = g.carregar_imagem(pasta_imagens + "moon.png")
		imagem_da_plataforma = g.carregar_imagem(pasta_imagens + "plataforma_pouso.png")

		imagem_do_foguete = g.carregar_imagem(pasta_imagens + "foguete.png")
		imagem_foguete_quebrado = g.carregar_imagem(pasta_imagens + "foguete_quebrado.png")
		
		imagem_jato = g.carregar_imagem(pasta_imagens + "jato_foguete1.png")
		imagem_jato2 = g.carregar_imagem(pasta_imagens + "jato_foguete2.png")
		
		imagem_do_fogo = g.carregar_imagem(pasta_imagens + "fogo.png")
	}

	funcao carregar_sons()
	{
		som_houston = sn.carregar_som("./moon_lander/houston.mp3")
		musica_de_fundo = sn.carregar_som("./moon_lander/musica_de_fundo.mp3")		
	}

	funcao calcular_posicoes_e_dimensoes_dos_objetos()
	{
		/* 
		 * Ao diminuir 11 pixels, eliminamos as bordas em volta da imagem do foguete. 
		 * 
		 * A imagem n�o deveria ter estas bordas. A imagem dever� ser editada futuramente
		 * para remover estas bordas.
		 */
		
		largura_do_foguete = g.largura_imagem(imagem_do_foguete) - 11
		altura_do_foguete = g.altura_imagem(imagem_do_foguete)

		largura_da_plataforma = g.largura_imagem(imagem_da_plataforma)
		altura_da_plataforma = g.altura_imagem(imagem_da_plataforma)

		largura_da_lua = g.largura_imagem(imagem_da_lua)
		altura_da_lua = g.altura_imagem(imagem_da_lua)

		x_da_lua = 0
		y_da_lua = ALTURA_DA_TELA - altura_da_lua

		x_da_plataforma = (LARGURA_DA_TELA - largura_da_plataforma) / 2
		y_da_plataforma = y_da_lua + (altura_da_lua / 2) - (altura_da_plataforma / 2)
	}

	funcao inicializar_janela()
	{
		g.iniciar_modo_grafico(verdadeiro)
		g.definir_dimensoes_janela(LARGURA_DA_TELA, ALTURA_DA_TELA)
		g.definir_titulo_janela("Moon Lander")
	}

	funcao carregar_fontes()
	{
		g.carregar_fonte("./fontes/poetsen_one_regular.ttf")
	}

	funcao finalizar()
	{
		liberar_imagens()
		liberar_sons()
		g.encerrar_modo_grafico()
	}

	funcao liberar_imagens()
	{
		g.liberar_imagem(imagem_de_fundo_do_menu)

		g.liberar_imagem(imagem_de_fundo_do_cenario)
		g.liberar_imagem(imagem_dos_planetas)
		
		g.liberar_imagem(imagem_da_lua)
		g.liberar_imagem(imagem_da_plataforma)
		
		g.liberar_imagem(imagem_do_foguete)
		g.liberar_imagem(imagem_foguete_quebrado)

		g.liberar_imagem(imagem_jato)
		g.liberar_imagem(imagem_jato2)
		
		g.liberar_imagem(imagem_do_fogo)
	}

	funcao liberar_sons()
	{
		sn.liberar_som(musica_de_fundo)
		sn.liberar_som(som_houston)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta se��o do arquivo guarda informa��es do Portugol Studio.
 * Voc� pode apag�-la se estiver utilizando outro editor.
 * 
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */