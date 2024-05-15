from flask import Flask, render_template,redirect,session, g,flash
from datetime import datetime
from flask import Flask
from flask import request
from flask import Flask, url_for
from flask import render_template
import sqlite3
from sqlite3 import Error
from funciones import *

    def crear_app():
    app = Flask(__name__) 




    ###Administrador
    @app.route('/agregaElimina')
    def indexTrabajador():
        trabajador=mostrarTrabajadores()
        return render_template('agregaElimina.html',trabajador = trabajador)


    @app.route('/EditarTrabajador',methods=["GET","POST"])
    def EditarTrabajador(name=None):
        
        return render_template('EditarTrabajador.html')

    @app.route('/traza',methods=["GET","POST"])
    def traza(name=None):
        x=insertarDron()
        return render_template('traza.html'),x

    @app.route('/entrenamiento',methods=["GET","POST"])
    def entrenamiento(name=None):
        return render_template('entrenamiento.html')

    ##Jefe de seguridad

    @app.route('/agregarKit')
    def indexSeguridad(name=None):
        
        return render_template('agregarKit.html')

    @app.route('/agregaEliminaFalta',methods=["GET","POST"])
    def agregaEliminaFalta(name=None):
        
        return render_template('agregaEliminaFalta.html')

    @app.route('/modificarFalta',methods=["GET","POST"])
    def modificaFalta(name=None):
        if 'hora' in request.form:
            resultado = insertar()
        elif 'enviar' in request.form:
            resultado = envioCorreo()
        else:
            resultado = "Ningún botón fue presionado"

        return render_template('modificarFalta.html', resultado=resultado)



    ##Capataz

    @app.route('/asistencia')
    def indexCapataz(name=None):
        trabajador=asistenciaObrero()
        return render_template('asistencia.html',trabajador=trabajador)

    @app.route('/dashboard')
    def dashboar():
        total_obrero=totalObrero()
        asis=asistencia()
        ina=inasistencia()
        return render_template('dashboard.html',total_obrero=total_obrero,asis=asis,ina=ina)


    #Obrero


    @app.route('/observaciondeasistencias')
    def observacion_asis():
        obreros=asistenciaObrero()
        return render_template('observaciondeasistencias.html',obreros=obreros)

    @app.route('/observaciondefaltas',methods=["GET","POST"])
    def Observacionfaltas(name=None):
        obreros=faltaObrero()    
        return render_template('observaciondefaltas.html',obreros=obreros)





    #login


    app.secret_key = "123"
    app.config["DATABASE"] = "listaTrabajadores.db"



    @app.route('/')
    def index():
        return render_template('index.html')

    @app.route('/login', methods=["GET", "POST"])
    def logear():
        a=login()
        return a







    @app.route('/logout')
    def logout():
        session.clear()
        return redirect(url_for("index"))
    return app


if __name__ == '__main__':
    app=crear_app()
    app.run()


if __name__ == '__main__':
    app.run()
