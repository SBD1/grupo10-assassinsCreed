from tkinter import *
import tkinter as tk

def comprarItem():
    message = box.get()
    print('msg: ',message)

mercado = Tk()
label1 = Label(mercado, text = "Itens do mercado (ID | ITEM | VALOR)")
label1.grid(column=0, row=0, padx=10, pady=2)
label2 = Label(mercado, text = 'oi')
label2.grid(column=0, row=1, padx=10, pady=2)
box = Entry(mercado)
box.grid(column=0, row=2, padx=10, pady=2)

botao = Button(mercado, text="Comprar", command=comprarItem())
botao.grid(column=0, row=3, padx=10, pady=2)

message = box.get()
print('msg: ',message)

mercado.mainloop()

