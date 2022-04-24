import pygame 
from settings import *

class Tile(pygame.sprite.Sprite):
	def __init__(self,pos,groups):
		super().__init__(groups)
		self.image = pygame.image.load('../imagens/jogador/pedra.png').convert_alpha()
		self.rect = self.image.get_rect(topleft = pos)
		self.hitbox = self.rect.inflate(0,-10)