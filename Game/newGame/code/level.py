import pygame 
from settings import *
from tile import Tile
from player import Player
from debug import debug
from ui import UI
from support import *

class Level:
	def __init__(self):

		# Local de movimento do boneco
		self.display_surface = pygame.display.get_surface()

		# configurações de câmera e obstáculo
		self.visible_sprites = YSortCameraGroup()
		self.obstacle_sprites = pygame.sprite.Group()

		# abre o mapa
		self.cria_mapa()

		# interface (UI)
		self.ui = UI()

	def cria_mapa(self):
		layouts = {
			'bloqueado': import_csv_layout('../code/mapa/Block_Bloqueado.csv'), # CSV do local em que o boneco não pode passar
		}
		# Leitor de CSV
		for style, layout in layouts.items():
			for row_index, row in enumerate(layout):
				for col_index, col in enumerate(row):
					if col != '-1':
						x = col_index * TILESIZE
						y = row_index * TILESIZE
						if style == 'bloqueado':
							Tile((x, y), [self.obstacle_sprites], 'invisible')

		self.player = Player((700, 500), [self.visible_sprites], self.obstacle_sprites) # Local de SPAWN boneco

	def run(self):
		# Atualização coordenada enquanto move
		self.visible_sprites.custom_draw(self.player)
		self.visible_sprites.update()
		debug(self.player.direction)
		self.ui.display(self.player)

	def busca_coordenada_x(rect):
		array = rect.split(",")
		coordenada_x = array[0]
		return coordenada_x[6:] 

	def busca_coordenada_y(rect):
		array = rect.split(",")
		coordenada_x = array[1]
		return coordenada_x[1:] 

class YSortCameraGroup(pygame.sprite.Group): # Movimento da câmera junto com o player
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
