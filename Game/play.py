import pygame, sys
from pathfinding.core.grid import Grid
from pathfinding.finder.a_star import AStarFinder
from pathfinding.core.diagonal_movement import DiagonalMovement

class Pathfinder:
	def __init__(self,matriz):

		# inicial
		self.matriz = matriz
		self.grid = Grid(matrix = matriz)
		self.modelo_icone = pygame.image.load('img\selection.png').convert_alpha()

		# busca do caminho
		self.caminho = []

		# Roomba
		self.roomba = pygame.sprite.GroupSingle(Roomba(self.caminho_vazio))

	def caminho_vazio(self):
		self.caminho = []

	def mostra_rastro(self):
		mouse_pos = pygame.mouse.get_pos()
		fila =  mouse_pos[1] // 32 # Posição exata do mouse na linha
		col =  mouse_pos[0] // 32 # Posição exata do mouse na coluna
		valor_atual = self.matriz[fila][col]
		if valor_atual == 1:
			rect = pygame.Rect((col * 32,fila * 32),(32,32))
			screen.blit(self.modelo_icone,rect)

	def cria_caminho(self):

		# início
		inicio_x, inicio_y = self.roomba.sprite.get_coordenada()
		inicio = self.grid.node(inicio_x,inicio_y)

		# Fim
		mouse_pos = pygame.mouse.get_pos()
		fim_x,fim_y =  mouse_pos[0] // 32, mouse_pos[1] // 32
		fim = self.grid.node(fim_x,fim_y)

		# o caminho é recalculado a cada click
		finder = AStarFinder(diagonal_movement = DiagonalMovement.always)
		self.caminho,_ = finder.find_path(inicio,fim,self.grid)
		self.grid.cleanup()
		self.roomba.sprite.define_caminho(self.caminho)

	def desenha_rastro(self): # Mostra o caminho a ser percorrido
		if self.caminho:
			points = []
			for point in self.caminho:
				x = (point[0] * 32) + 16
				y = (point[1] * 32) + 16
				points.append((x,y))

			pygame.draw.lines(screen,'#4a4a4a',False,points,5)

	def update(self):
		self.mostra_rastro()
		self.desenha_rastro()

		# roomba updating and drawing
		self.roomba.update()
		self.roomba.draw(screen)

class Roomba(pygame.sprite.Sprite):
	def __init__(self,caminho_vazio):

		# base
		super().__init__()
		self.image = pygame.image.load('img/boneco.png').convert_alpha()
		self.rect = self.image.get_rect(center = (60,60))

		# movimento
		self.pos = self.rect.center
		self.velocidade = 3
		self.direction = pygame.math.Vector2(0,0)

		# caminho
		self.caminho = []
		self.collision_rects = []
		self.caminho_vazio = caminho_vazio

	def get_coordenada(self): #Transforma a posição atual em uma coordenada
		col = self.rect.centerx // 32
		fila = self.rect.centery // 32
		return (col,fila)

	def define_caminho(self,caminho):
		self.caminho = caminho
		self.create_collision_rects()
		self.get_direcao()

	def create_collision_rects(self): # Identificando colisão no mapa
		if self.caminho:
			self.collision_rects = []
			for point in self.caminho:
				x = (point[0] * 32) + 16
				y = (point[1] * 32) + 16
				rect = pygame.Rect((x - 2,y - 2),(4,4))
				self.collision_rects.append(rect)

	def get_direcao(self):
		if self.collision_rects:
			inicio = pygame.math.Vector2(self.pos)
			fim = pygame.math.Vector2(self.collision_rects[0].center)
			self.direction = (fim - inicio).normalize()
		else:
			self.direction = pygame.math.Vector2(0,0)
			self.caminho = []

	def check_collisions(self):
		if self.collision_rects:
			for rect in self.collision_rects:
				if rect.collidepoint(self.pos):
					del self.collision_rects[0] # Remove o caminho quando alcança o objetivo
					self.get_direcao()
		else:
			self.caminho_vazio()

	def update(self):
		self.pos += self.direction * self.velocidade
		self.check_collisions()
		self.rect.center = self.pos

# base inicial
pygame.init()
screen = pygame.display.set_mode((1280,736))
clock = pygame.time.Clock()

# mapa
bg_surf = pygame.image.load('img\map.png').convert()
matriz = [
	[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
	[0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0],
	[0,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0],
	[0,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0],
	[0,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0],
	[0,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0],
	[0,1,1,1,0,1,1,1,0,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0],
	[0,1,1,1,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0],
	[0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0],
	[0,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0],
	[0,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0],
	[0,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0],
	[0,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0],
	[0,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0],
	[0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0],
	[0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0],
	[0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0],
	[0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0],
	[0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0],
	[0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0],
	[0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0],
	[0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0],
	[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]]
pathfinder = Pathfinder(matriz)

while True:
	for event in pygame.event.get():
		if event.type == pygame.QUIT:
			pygame.quit()
			sys.exit()
		if event.type == pygame.MOUSEBUTTONDOWN: # Cria o caminho a cada click
			pathfinder.cria_caminho()


	screen.blit(bg_surf,(0,0))
	pathfinder.update()

	pygame.display.update()
	clock.tick(60)