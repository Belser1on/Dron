import sqlite3
from sqlite3 import Error
from app import *
from flask import Flask, render_template,redirect,session, g,flash
from datetime import datetime
from flask import Flask
from flask import request
from flask import Flask, url_for
from flask import render_template
import smtplib


TcpIp = '127.0.0.1'
TcpPort = 5000
BufferSize = 1024

### Crear conección a palabras.db
def sqlConnection2():
    try:      
        con2 = sqlite3.connect('backup.db')
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


#login
def login():
    if request.method == 'POST':
        nombre = request.form['nombre']
        contraseña = request.form['contraseña']
        #nombre_2 = request.form['nombre']
        db = sqlConnection2()
        cur = db.cursor()
        cur.execute("SELECT password,trabajador.rut_trabajador, rol.rol, nombre FROM trabajador INNER JOIN rol ON trabajador.id_rol = rol.id_rol AND password=? AND trabajador.rut_trabajador=?", (contraseña,nombre))
        data = cur.fetchone()

    
        if data:
            session["rol"] = data["rol"]
            session["contraseña"] = data["password"]
            session['nombre_2']=data['nombre']
            session['nombre']=data['rut_trabajador']
            if session['rol']=="Administrador":
                return redirect("agregaElimina")
            elif session['rol']=="Capataz":
                return redirect("asistencia")
            elif session['rol']=="Encargado de seguridad":
                return redirect("agregarKit")
            elif session['rol']=="Obrero":
                return redirect("observaciondeasistencias")
        else:
            flash("Nombre de usuario y contraseña incorrectos", "danger")

    return redirect(url_for("index"))

##Admin

def mostrarTrabajadores():
    con = sqlConnection2()
    cursorObj = con.cursor()
    cursorObj.execute("SELECT trabajador.nombre, trabajador.rut_trabajador, rol.rol FROM trabajador INNER JOIN rol ON trabajador.id_rol = rol.id_rol ;")
    rows = cursorObj.fetchall()
    con.commit()
    return rows

def insertarDron():
    if request.method == 'POST':
        # Obtener los datos del formulario
        coordenadaInicial = request.form['coordenadaInicial']
        coordenadaFinal = request.form['coordenadaFinal']
        # Conectar a la base de datos SQLite
        cursor = sqlConnection2()
        cursor.execute("INSERT INTO ruta_dron (id_rol,coordenada_inicial,coordenada_final) VALUES(1,?,?);",(coordenadaInicial,coordenadaFinal))
        cursor.commit()
        cursor.close()



#funciones del obrero

def faltaObrero():
    con = sqlConnection2()
    cursorObj = con.cursor()
    cursorObj.execute("SELECT fecha,hora,motivo,clasificacion,recoleccion_faltas.rut_trabajador FROM recoleccion_faltas left JOIN faltas ON recoleccion_faltas.rut_trabajador= faltas.rut_trabajador left JOIN tipo_falta ON tipo_falta.id_tipo_falta=faltas.id_falta WHERE recoleccion_faltas.rut_trabajador=?;",(session['nombre'],))
    rows = cursorObj.fetchall()
    con.commit()
    return rows

def asistenciaObrero():
    con = sqlConnection2()
    cursorObj = con.cursor()
    cursorObj.execute("SELECT fecha,hora,estado FROM asistencia WHERE rut_trabajador=?;",(session['nombre'],))
    rows = cursorObj.fetchall()
    con.commit()
    return rows

#Funciones Capataz

def totalObrero():
    con = sqlConnection2()
    cursorObj = con.cursor()
    cursorObj.execute("SELECT count(rut_trabajador) FROM obrero;")
    rows = cursorObj.fetchone()
    x=rows[0]
    con.commit()
    return x

def asistencia():
    con = sqlConnection2()
    cursorObj = con.cursor()
    cursorObj.execute("SELECT count(estado) FROM asistencia WHERE estado='Presente';")
    rows = cursorObj.fetchone()
    x=rows[0]
    con.commit()
    return x

def inasistencia():
    con = sqlConnection2()
    cursorObj = con.cursor()
    cursorObj.execute("SELECT count(estado) FROM asistencia WHERE estado='Ausente';")
    rows = cursorObj.fetchone()
    x=rows[0]
    con.commit()
    return x

def asistenciaObrero():
    con = sqlConnection2()
    cursorObj = con.cursor()
    cursorObj.execute("SELECT estado,id_falta,obrero.rut_trabajador from obrero INNER JOIN asistencia On asistencia.rut_trabajador=obrero.rut_trabajador INNER JOIN recoleccion_faltas ON recoleccion_faltas.rut_trabajador=obrero.rut_trabajador WHERE asistencia.fecha=recoleccion_faltas.fecha;")
    rows = cursorObj.fetchall()
    con.commit()
    return rows
# jefe de seguridad

def obtener_correo_por_rut(rut):
    connection = sqlConnection2()
    cursor = connection.cursor()
    cursor.execute("SELECT email from trabajador where rut_trabajador=?;", (rut,))
    resultado = cursor.fetchone()
    connection.close()
    return resultado[0] if resultado else None

def obtenerFaltas(rut):
    connection = sqlConnection2()
    cursor = connection.cursor()
    cursor.execute("SELECT count(rut_trabajador) from recoleccion_faltas WHERE rut_trabajador=?;", (rut,))
    resultado = cursor.fetchone()
    connection.close()
    return resultado[0] if resultado else None

def envioCorreo():
    if request.method == 'POST':
        rut = request.form.get('enviar')
        correo = obtener_correo_por_rut(rut)
        cantidad=obtenerFaltas(rut)
        if correo:
            message=f'Cantidad de faltas: {cantidad}'
            subject="Cantidad de faltas"
            message="Subject: {}\n\n{}".format(subject,message)
            server=smtplib.SMTP('smtp.gmail.com',587)
            server.starttls()
            server.login('programarucen@gmail.com','bbuoxasejgvuccnx')
            server.sendmail('programarucen@gmail.com',correo,message)
            server.quit()
            return f'Correo enviado a {correo} con éxito'
        else:
            return 'No se encontró un correo para el RUT proporcionado'



def insertar():
    if request.method == 'POST':
        # Obtener los datos del formulario
        id = int(request.form['id'])
        select = int(request.form['select'])
        fecha = request.form['fecha']
        motivo = request.form['motivo']
        rut = request.form['rut']
        hora = request.form['hora']
        # Conectar a la base de datos SQLite
        cursor = sqlConnection2()
        cursor.execute("INSERT INTO faltas  VALUES (?,?,?,?);",(id,select,motivo,rut))
        cursor.commit()
        cursor2=sqlConnection2()
        cursor2.execute('INSERT INTO recoleccion_faltas(id_falta,rut_trabajador,hora,fecha) VALUES(?,?,?,?);',(id,rut,hora,fecha))
        cursor2.commit()
        cursor2.close()


