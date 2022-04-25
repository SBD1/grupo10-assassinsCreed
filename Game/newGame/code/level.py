import pygame 
from settings import *
from tile import Tile
from player import Player
from debug import debug
from debug import debug

class Level:
	def __init__(self):

		# Local de movimento do boneco
		self.display_surface = pygame.display.get_surface()

		# configurações de câmera e obstáculo
		self.visible_sprites = YSortCameraGroup()
		self.obstacle_sprites = pygame.sprite.Group()

		# abre o mapa
		self.create_map()

	def create_map(self):
		for row_index,row in enumerate(WORLD_MAP):
			for col_index, col in enumerate(row):
				x = col_index * TILESIZE # Tamanho coluna e linha
				y = row_index * TILESIZE # Tamanho coluna e linha
				if col == 'x':
					Tile((x,y),[self.visible_sprites,self.obstacle_sprites])
				if col == 'p': # PLAYER LOCALIZAÇÃO SPAWN
					self.player = Player((1376,406),[self.visible_sprites],self.obstacle_sprites)

	def run(self):
		# Atualização coordenada enquanto move
		self.visible_sprites.custom_draw(self.player)
		self.visible_sprites.update()
		print(self.player.rect)
		debug(self.player.direction)


class YSortCameraGroup(pygame.sprite.Group):
	def __init__(self):

		# Configuração geral do tamanho
		super().__init__()
		self.display_surface = pygame.display.get_surface()
		self.half_width = self.display_surface.get_size()[0] // 2
		self.half_height = self.display_surface.get_size()[1] // 2
		self.offset = pygame.math.Vector2()

		# Criação do mapa
		self.floor_surf = pygame.image.load('../imagens/mapa/mapa.png').convert() # Imagem mapa
		self.floor_rect = self.floor_surf.get_rect(topleft = (0,0))

	def custom_draw(self,player):

		# Deslocamento coordenada
		self.offset.x = player.rect.centerx - self.half_width
		self.offset.y = player.rect.centery - self.half_height

		# Desenhando o chão e colisões
		floor_offset_pos = self.floor_rect.topleft - self.offset
		self.display_surface.blit(self.floor_surf,floor_offset_pos)

		# Colisões
		for sprite in sorted(self.sprites(),key = lambda sprite: sprite.rect.centery):
			offset_pos = sprite.rect.topleft - self.offset
			self.display_surface.blit(sprite.image,offset_pos)
