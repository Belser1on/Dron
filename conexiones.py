import sqlite3
from sqlite3 import Error
from app import *
from flask import Flask, render_template,redirect,session, g,flash
from datetime import datetime
from flask import Flask
from flask import request
from flask import Flask, url_for
from flask import render_template
from conexiones import sqlConnection2

TcpIp = '127.0.0.1'
TcpPort = 5000
BufferSize = 1024

### Crear conección a palabras.db
def sqlConnection2():
    try:      
        con2 = sqlite3.connect('listaTrabajadoresV3.db')
        con2.row_factory = sqlite3.Row
        return con2
    except Error:
         print(Error)

# Función para obtener una conexión a la base de datos
#def get_db():
#    if "db" not in g:
#       g.db = sqlite3.connect(app.config["DATABASE"])
#        g.db.row_factory = sqlite3.Row
#    return g.db

# Función para cerrar la conexión a la base de datos
#def close_db(e=None):#
#   db = g.pop("db", None)
#    if db is not None:
#        db.close()
