import pygame
from settings import * 

class UI:
	def __init__(self):
		
		# configuração da barra de vida
		self.display_surface = pygame.display.get_surface()
		self.font = pygame.font.Font(FONTE,TAMANHO_FONTE)

		# barra de vida tamanho
		self.health_bar_rect = pygame.Rect(10,10,TAMANHO_BARRA,BAR_HEIGHT)
		
		# Mostra imagem e localização moedas na tela
		self.inventario = pygame.image.load('../imagens/jogador/moeda.png').convert_alpha() # Imagem moeda
		self.inventario_rect = self.inventario.get_rect(topleft = (20,30)) # Localização na tela moeda
		
	def mostrar_inventario(self, quantidade):
		self.display_surface.blit(self.inventario,self.inventario_rect) 
		inv_quantidade_surf = self.font.render(str(quantidade),False, '#33323d') # fonte da moeda
		inv_quantidade_rect = inv_quantidade_surf.get_rect(midleft = (self.inventario_rect.right + 4, self.inventario_rect.centery)) 
		self.display_surface.blit(inv_quantidade_surf, inv_quantidade_rect)



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
		self.mostrar_barra(player.health,100,self.health_bar_rect,COR_VIDA)
