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

		

		self.obstacle_sprites = obstacle_sprites


	# configurações do player
		self.stats = {'vida': 100} # STATUS DO JOGADOR
		self.name =Player.nomeHeroi()
		self.coins = Player.moedasHeroi()
		self.health = Player.vidaHeroi()
		self.force = Player.forcaHeroi()
		self.exp = Player.xpHeroi()
		self.speed = Player.velocidadeHeroi() # VELOCIDADE PADRÃO

		print(self.name)

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

	def vidaHeroi():
		x = str(Conexao.consultar_db("SELECT vida, nomecompleto FROM public.tbl_heroi WHERE id_heroi = 1;"))
		x = x.split(",")
		x = x[0].replace("[(","")
		return int(x)

	def moedasHeroi():
		x = str(Conexao.consultar_db("SELECT moedas, nomecompleto FROM public.tbl_heroi WHERE id_heroi = 1;"))
		x = x.split(",")
		x = x[0].replace("[(","")
		return int(x)

	def velocidadeHeroi():
		x = str(Conexao.consultar_db("SELECT velocidade, nomecompleto FROM public.tbl_heroi WHERE id_heroi = 1;"))
		x = x.split(",")
		x = x[0].replace("[(","")
		return int(x)

	def forcaHeroi():
		x = str(Conexao.consultar_db("SELECT forca, nomecompleto FROM public.tbl_heroi WHERE id_heroi = 1;"))
		x = x.split(",")
		x = x[0].replace("[(","")
		return int(x)
	
	def xpHeroi():
		x = str(Conexao.consultar_db("SELECT xp, nomecompleto FROM public.tbl_heroi WHERE id_heroi = 1;"))
		x = x.split(",")
		x = x[0].replace("[(","")
		return int(x)
	
	def nomeHeroi():
		x = str(Conexao.consultar_db("SELECT nomecompleto FROM public.tbl_heroi WHERE id_heroi = 1;"))
		x = x.split(",")
		x = x[0].replace("[(","")
		return str(x)

	def valorUtilitarios(tipo, nome):
		x = str(Conexao.consultar_db("SELECT valor FROM public.tbl_"+ tipo +" WHERE descricao = '"+ nome +"';"))
		x = x.split(",")
		x = x[0].replace("[(","")
		return str(x)

	def updateVidaHeroi(vida):
		Conexao.insert_db("UPDATE public.tbl_heroi SET vida="+ str(vida) +" WHERE id_heroi=1;")
		return Player.vidaHeroi();

	def updateMoedasHeroi(moedas):
		Conexao.insert_db("UPDATE public.tbl_heroi SET moedas= "+ str(moedas) +" WHERE id_heroi=1;")
		return Player.moedasHeroi();
	
	def updateVelocidadeHeroi(velocidade):
		Conexao.insert_db("UPDATE public.tbl_heroi SET velocidade="+ str(velocidade) +" WHERE id_heroi=1;")
		return Player.velocidadeHeroi();
	
	def updateForcaHeroi(forca):
		Conexao.insert_db("UPDATE public.tbl_heroi SET forca="+ str(forca) +" WHERE id_heroi=1;")
		return Player.forcaHeroi();
	
	def updateXPHeroi(xp):
		Conexao.insert_db("UPDATE public.tbl_heroi SET xp="+ str(xp) +" WHERE id_heroi=1;")
		return Player.xpHeroi();
	
	def updateCoordenadaXYHeroi(coordenada_x, coordenada_y):
		Conexao.insert_db("UPDATE public.tbl_heroi SET coordenada_x_mapa="+ coordenada_x +", coordenada_y_mapa ="+ coordenada_y +" WHERE id_heroi = 1;")
	
	 
