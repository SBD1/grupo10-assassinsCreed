import pygame
from pyparsing import col
from pytest import console_main 
from settings import *
from tile import Tile
from player import Player
from debug import debug
from debug import debug
from config.conexao import Conexao
import tkinter as tk
from tkinter import *
from tkinter import Entry, Label, messagebox

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
					coordenada_x_mapa = Conexao.consultar_unico_db("Select coordenada_x_mapa from tbl_heroi where id_heroi = 1")
					coordenada_y_mapa = Conexao.consultar_unico_db("Select coordenada_y_mapa from tbl_heroi where id_heroi = 1")
					self.player = Player((int(coordenada_x_mapa),int(coordenada_y_mapa)),[self.visible_sprites],self.obstacle_sprites)

	def run(self):
		# Atualização coordenada enquanto move
		self.visible_sprites.custom_draw(self.player)
		self.visible_sprites.update()
		coordenada_x = Level.busca_coordenada_x(str(self.player.rect))
		coordenada_y = Level.busca_coordenada_y(str(self.player.rect))
		if int(coordenada_x) > 1100 and int(coordenada_x) < 1300:
			if int(coordenada_y) > 650 and int(coordenada_y) < 820:
				tecla = pygame.key.get_pressed()
				if tecla[97] == 1:
					sql = "SELECT utilitario.idutilitario, utilitario.descricao, utilitario.valor FROM tbl_instancia_Item instItem "
					sql += "JOIN tbl_mercado_possui_item possuiItem ON instItem.id_instancia_item = possuiItem.id_instancia " 
					sql += "JOIN tbl_tipo_item tipoItem ON instItem.id_item = tipoItem.id_item "
					sql += "JOIN tbl_utilitario utilitario ON instItem.id_item = utilitario.idutilitario "
					sql += "WHERE id_mercado = 1;" 
					lista_inventario_mercado = Conexao.consultar_db(sql)
					inventario_mercado = str(lista_inventario_mercado)
					inventario_mercado = Level.formata_string(inventario_mercado)
					print(inventario_mercado)

					mercado = tk.Tk()
					label1 = Label(mercado, text = "Itens do mercado (ID | ITEM | VALOR)")
					label1.grid(column=0, row=0, padx=10, pady=2)
					label2 = Label(mercado, text = inventario_mercado)
					label2.grid(column=0, row=1, padx=10, pady=2)
					box = Entry(mercado)
					box.grid(column=0, row=2, padx=10, pady=2)
					print(box.get())

					botao = Button(mercado, text="Comprar", command=Level.comprarItem(box.get()))
					botao.grid(column=0, row=3, padx=10, pady=2)
					
					mercado.mainloop()

		if int(coordenada_x) > 1560 and int(coordenada_x) < 1610:
			if int(coordenada_y) > 1050 and int(coordenada_y) < 1100:
				tecla = pygame.key.get_pressed()
				if tecla[97] == 1:
					sql = "SELECT utilitario.idutilitario, utilitario.descricao, utilitario.valor FROM tbl_instancia_Item instItem "
					sql += "JOIN tbl_mercado_possui_item possuiItem ON instItem.id_instancia_item = possuiItem.id_instancia " 
					sql += "JOIN tbl_tipo_item tipoItem ON instItem.id_item = tipoItem.id_item "
					sql += "JOIN tbl_utilitario utilitario ON instItem.id_item = utilitario.idutilitario "
					sql += "WHERE id_mercado = 1;" 
					lista_inventario_mercado = Conexao.consultar_db(sql)
					inventario_mercado = str(lista_inventario_mercado)
					inventario_mercado = Level.formata_string(inventario_mercado)
					print(inventario_mercado)

					mercado = tk.Tk()
					label1 = Label(mercado, text = "Itens do mercado (ID | ITEM | VALOR)")
					label1.grid(column=0, row=0, padx=10, pady=2)
					label2 = Label(mercado, text = inventario_mercado)
					label2.grid(column=0, row=1, padx=10, pady=2)
					box = Entry(mercado)
					box.grid(column=0, row=2, padx=10, pady=2)
					print(box.get())

					botao = Button(mercado, text="Comprar", command=Level.comprarItem(box.get()))
					botao.grid(column=0, row=3, padx=10, pady=2)
					
					mercado.mainloop()

		if int(coordenada_x) > 1560 and int(coordenada_x) < 1870:
			if int(coordenada_y) > 1600 and int(coordenada_y) < 1940:
				tecla = pygame.key.get_pressed()
				if tecla[97] == 1:
					sql = "SELECT utilitario.idutilitario, utilitario.descricao, utilitario.valor FROM tbl_instancia_Item instItem "
					sql += "JOIN tbl_mercado_possui_item possuiItem ON instItem.id_instancia_item = possuiItem.id_instancia " 
					sql += "JOIN tbl_tipo_item tipoItem ON instItem.id_item = tipoItem.id_item "
					sql += "JOIN tbl_utilitario utilitario ON instItem.id_item = utilitario.idutilitario "
					sql += "WHERE id_mercado = 1;" 
					lista_inventario_mercado = Conexao.consultar_db(sql)
					inventario_mercado = str(lista_inventario_mercado)
					inventario_mercado = Level.formata_string(inventario_mercado)
					print(inventario_mercado)

					mercado = tk.Tk()
					label1 = Label(mercado, text = "Itens do mercado (ID | ITEM | VALOR)")
					label1.grid(column=0, row=0, padx=10, pady=2)
					label2 = Label(mercado, text = inventario_mercado)
					label2.grid(column=0, row=1, padx=10, pady=2)
					box = Entry(mercado)
					box.grid(column=0, row=2, padx=10, pady=2)
					print(box.get())

					botao = Button(mercado, text="Comprar", command=Level.comprarItem(box.get()))
					botao.grid(column=0, row=3, padx=10, pady=2)
					
					mercado.mainloop()


		debug(self.player.direction)

	def busca_coordenada_x(rect):
		array = rect.split(",")
		coordenada_x = array[0]
		return coordenada_x[6:] 

	def busca_coordenada_y(rect):
		array = rect.split(",")
		coordenada_x = array[1]
		return coordenada_x[1:] 

	def formata_string(str):
		str = str.replace("[","").replace("]","")
		str = str.replace("(", "").replace(",","")
		str = str.replace(")","\n")
		return str

	def comprarItem(item):
		print(item)
		if item == '1':
			print('voce comprou um remedio')

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
