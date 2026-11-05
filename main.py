from fastapi import FastAPI, HTTPException
from database import obtener_conexion

app = FastAPI(
    title="GeSalud API",
    description="API de analítica del sistema GeSalud",
    version="1.0"
)

@app.get("/")
def inicio():
    return {
        "mensaje": "Bienvenido a la API GeSalud"
    }

@app.get("/probar-conexion")
def probar_conexion():
    try:
        conexion = obtener_conexion()
        cursor = conexion.cursor()

        cursor.execute("SELECT DATABASE()")
        resultado = cursor.fetchone()

        cursor.close()
        conexion.close()

        return {
            "mensaje": "Conexión exitosa",
            "base_datos": resultado[0]
        }

    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
from reportes import router as reportes_router

app.include_router(reportes_router)
