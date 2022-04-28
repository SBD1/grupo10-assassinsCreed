import pygame
from settings import * 

class UI:
	def __init__(self):
		
		# configuração da barra de vida
		self.display_surface = pygame.display.get_surface()
		self.font = pygame.font.Font(FONTE,TAMANHO_FONTE)

		# barra de vida tamanho
		self.health_bar_rect = pygame.Rect(10,10,TAMANHO_BARRA,BAR_HEIGHT)



	def mostrar_barra(self,valor_atual,valor_maximo,bg_rect,color):

		# Plotar a barra
		pygame.draw.rect(self.display_surface,COR_FUNDO,bg_rect) # Retângulo barra de vida

		# Converter o pixel da tela para quantidade de vida
		ratio = valor_atual / valor_maximo
		largura_atual = bg_rect.width * ratio
		rect_atual = bg_rect.copy()
		rect_atual.width = largura_atual

		# Plotando a barra 2
		pygame.draw.rect(self.display_surface,color,rect_atual)


	def display(self,player):
		self.mostrar_barra(player.health,player.stats['vida'],self.health_bar_rect,COR_VIDA)
