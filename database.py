import mysql.connector

def obtener_conexion():
    conexion = mysql.connector.connect(
        host="localhost",
        port=3307,
        user="root",
        password="",
        database="gesalud"
    )
    return conexion