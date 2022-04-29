import pygame 
from settings import *
from entidade import Entidade
from config.conexao import Conexao


class Player(Entidade):
	def __init__(self,pos,groups,obstacle_sprites):
		super().__init__(groups)
		self.image = pygame.image.load('../imagens/jogador/jogador.png').convert_alpha() # IMAGEM DO BONECO 64x64, sem fundo transparente
		self.rect = self.image.get_rect(topleft = pos)
		self.hitbox = self.rect.inflate(0,-26) # Retângulo de colisão

		self.speed = 5 # VELOCIDADE PADRÃO

		self.obstacle_sprites = obstacle_sprites


	# configurações do player
		self.stats = {'vida': 100, 'energia': 60, 'ataque':10, 'magica': 4, 'speed': 6} # STATUS DO JOGADOR
		vidaheroi = str(Conexao.consultar_db("SELECT vida, nomecompleto FROM public.tbl_heroi WHERE id_heroi = 1;"))
		vidaheroi = vidaheroi.split(",")
		vidaheroi = vidaheroi[0].replace("[(","")
		self.health = int(vidaheroi)

	def get_health(self):
		return self.health

	def set_health(self, x):
		return self.health == x 

	# MOVIMENTO NAS SETAS DO TECLADO
	def input(self):
		keys = pygame.key.get_pressed()

		if keys[pygame.K_UP]:
			self.direction.y = -1
		elif keys[pygame.K_DOWN]:
			self.direction.y = 1
		else:
			self.direction.y = 0

		if keys[pygame.K_RIGHT]:
			self.direction.x = 1
		elif keys[pygame.K_LEFT]:
			self.direction.x = -1
		else:
			self.direction.x = 0

	def update(self):
		self.input() # ENTRADA NO TECLADO
		self.move(self.speed) # DEFININDO A VELOCIDADE
