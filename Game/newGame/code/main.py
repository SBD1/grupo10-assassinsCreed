import pygame, sys
from settings import *
from level import Level
from config.conexao import Conexao


#Principal
class Game:
	def __init__(self):

		# Setup da janela windows
		pygame.init()
		self.screen = pygame.display.set_mode((WIDTH,HEIGTH))
		pygame.display.set_caption('Assasins Creed')
		self.clock = pygame.time.Clock()

		self.level = Level()


	def run(self):
		while True:
			for event in pygame.event.get():
				if event.type == pygame.QUIT:
					coordenada_x = Level.busca_coordenada_x(str(self.level.player.rect))
					coordenada_y = Level.busca_coordenada_y(str(self.level.player.rect))
					insere_coordenada = Conexao.update_db("UPDATE public.tbl_heroi SET coordenada_x_mapa="+ coordenada_x +", coordenada_y_mapa ="+ coordenada_y +" WHERE id_heroi = 1;")
					pygame.quit()
					sys.exit()

			self.screen.fill('black')
			self.level.run()
			pygame.display.update()
			self.clock.tick(FPS)


if __name__ == '__main__':
	game = Game()
	game.run()
