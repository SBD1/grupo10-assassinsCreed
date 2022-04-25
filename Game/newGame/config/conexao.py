import requests
import json
import pandas as pd
import psycopg2

class Conexao(object):
    _db=None;
    def __init__(self, banco):
        self._db = postgresql.open(banco)

    def conecta_db():
        con = psycopg2.connect(host='ec2-44-194-4-127.compute-1.amazonaws.com', 
                                database='d3oeki168l7veu',
                                user='jumorzbwsmlwvk', 
                                password='2797bb8c4d247b2543120cd7a8656375f9dc9938e46c5a30d1a1e7754b0d2adb')
        return con

    
    def consultar_db(sql):
        con = Conexao.conecta_db()
        cur = con.cursor()
        cur.execute(sql)
        recset = cur.fetchall()
        registros = []
        for rec in recset:
            registros.append(rec)
        con.close()
        return registros


    def insert_db(sql):
        con = Conexao.conecta_db()
        cur = con.cursor()
        response = cur.execute(sql)
        cur.close()
        con.close()
        return response

    def fechar(self):
        self._db.close()