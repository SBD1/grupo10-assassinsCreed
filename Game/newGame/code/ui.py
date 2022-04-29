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
		self.mostrar_barra(player.health,player.stats['vida'],self.health_bar_rect,COR_VIDA)


    def inventario_na_tela (self,player):
    
         import sys
         import random
         import pygame

        from pygame.locals import *

         
        #DIRT, GRASS, WATER, COAL, CLOUD, WOOD = 0, 1, 2, 3, 4, 5
        #FIRE, SAND, GLASS, ROCK, STONE, BRICK, DIAMOND = 6, 7, 8, 9 , 10, 11, 12
         
        ArmadAncestral, ArmadAssassina, ArmadCouro, Espada, Machado, Peixeira, Arco, MinerioForca = 1,1,1,1,1,1,1,1
        # declare resources for inventory interface
        resources = [ ArmadAncestral, ArmadAssassina, ArmadCouro, Espada, Machado, Peixeira, Arco, MinerioForca ]
        # white color for number in inventory
        WHITE = (255,255,255)
        BLACK = (0,0,0)
        TILESIZE = 40
        MAPWIDTH = 30
        MAPHEIGHT = 20

        # intialize an inventory
        # empty when starting
        inventory = {
        ArmadAncestral: 0,
        ArmadAssassina: 0,
        ArmadCouro: 0,
        Espada: 0, 
        Machado: 0,                                                                                          
        Peixeira: 0,
        Arco: 0,
        MinerioForca: 0 
        }

       textures = {
       ArmadAncestral: pygame.image.load('ArmaduraAncestral.png'),
       ArmadAssassina: pygame.image.load('ArmaduraAssassino.png'),
       ArmadCouro: pygame.image.load('ArmaduraDeCouro.png'),
       Espada: pygame.image.load('Espada.png'),
       Machado: pygame.image.load('Machado.png'),
       Peixeira: pygame.image.load('Peixeira.png'),
       Arco: pygame.image.load('Arco.png'),
       MinerioForca: pygame.image.load('MinerioDaForca.png') 
       }

       player = pygame.image.load('jogador.png')
       playerPos = [0,0]
  
       pygame.init()
       # add 50 pixels to the height for the inventory
       DISPLAYSURF = pygame.display.set_mode((MAPWIDTH*TILESIZE,MAPHEIGHT*TILESIZE+50))
       # setup a font for displaying inventory numbers
       INVFONT = pygame.font.Font('freesansbold.ttf', 18)

        while True:
              DISPLAYSURF.fill(BLACK) 

            # render inventory
            placePosition = 10
            for item in resources:
                DISPLAYSURF.blit(textures[item], (placePosition, MAPHEIGHT*TILESIZE+20))
                placePosition += 30
                textObj = INVFONT.render(str(inventory[item]), True, WHITE, BLACK)
                DISPLAYSURF.blit(textObj,(placePosition,MAPHEIGHT*TILESIZE+20))
                placePosition += 50

            DISPLAYSURF.blit(player,(playerPos[0]*TILESIZE, playerPos[1]*TILESIZE))
            pygame.display.update()