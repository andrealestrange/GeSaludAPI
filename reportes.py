from fastapi import APIRouter, HTTPException, Query
from database import obtener_conexion

router = APIRouter()


@router.get("/api/reportes/clasificacion-top")
def clasificacion_top():
    conexion = None
    cursor = None

    try:
        conexion = obtener_conexion()
        cursor = conexion.cursor(dictionary=True)

        consulta = """
            SELECT
                esp.id_especialidad,
                esp.nombre AS especialidad,
                COUNT(c.id_cita) AS total_citas,
                SUM(c.valor_cita) AS recaudo_total,
                AVG(c.valor_cita) AS promedio_cita
            FROM especialidad esp
            INNER JOIN medico m
                ON m.id_especialidad = esp.id_especialidad
            INNER JOIN cita c
                ON c.id_medico = m.id_medico
            GROUP BY esp.id_especialidad, esp.nombre
            HAVING AVG(c.valor_cita) > (
                SELECT AVG(valor_cita)
                FROM cita
            )
        """

        cursor.execute(consulta)
        resultados = cursor.fetchall()

        if not resultados:
            raise HTTPException(status_code=404, detail="No se encontraron resultados")

        return resultados

    except HTTPException:
        raise
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
    finally:
        if cursor:
            cursor.close()
        if conexion:
            conexion.close()

@router.get("/api/analitica/actores-estrella")
def actores_estrella():
    conexion = None
    cursor = None

    try:
        conexion = obtener_conexion()
        cursor = conexion.cursor(dictionary=True)

        consulta = """
            SELECT
                p.id_paciente,
                CONCAT(p.nombre, ' ', p.apellido) AS paciente,
                COUNT(c.id_cita) AS total_citas,
                SUM(c.valor_cita) AS valor_acumulado
            FROM paciente p
            INNER JOIN cita c
                ON c.id_paciente = p.id_paciente
            GROUP BY p.id_paciente, p.nombre, p.apellido
            HAVING SUM(c.valor_cita) > (
                SELECT AVG(promedio_actor.valor_acumulado)
                FROM (
                    SELECT
                        p2.id_paciente,
                        COALESCE(SUM(c2.valor_cita), 0) AS valor_acumulado
                    FROM paciente p2
                    LEFT JOIN cita c2
                        ON c2.id_paciente = p2.id_paciente
                    GROUP BY p2.id_paciente
                ) AS promedio_actor
            )
        """

        cursor.execute(consulta)
        resultados = cursor.fetchall()

        if not resultados:
            raise HTTPException(
                status_code=404,
                detail="No se encontraron pacientes por encima del promedio"
            )

        return resultados

    except HTTPException:
        raise
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
    finally:
        if cursor:
            cursor.close()
        if conexion:
            conexion.close()

            
@router.get("/api/items/desviacion-grupo")
def desviacionGrupo():
    conexion = None
    cursor = None

    try:
        conexion = obtener_conexion()
        cursor = conexion.cursor(dictionary=True)

        consulta = """
            SELECT
                co.id_consultorio,
                co.numero AS numeroConsultorio,
                co.ubicacion AS ubicacion,
                COUNT(c.id_cita) AS totalCitas,
                (
                    SELECT
                        SUM(
                            (SELECT COUNT(c2.id_cita)
                             FROM cita c2
                             WHERE c2.id_consultorio = co2.id_consultorio)
                        ) / COUNT(*)
                    FROM consultorio co2
                    WHERE co2.ubicacion = co.ubicacion
                ) AS promedioUbicacion,
                CASE
                    WHEN COUNT(c.id_cita) > (
                        SELECT
                            SUM(
                                (SELECT COUNT(c2.id_cita)
                                 FROM cita c2
                                 WHERE c2.id_consultorio = co2.id_consultorio)
                            ) / COUNT(*)
                        FROM consultorio co2
                        WHERE co2.ubicacion = co.ubicacion
                    )
                    THEN 'Por encima del promedio'
                    ELSE 'Por debajo del promedio'
                END AS desviacion
            FROM consultorio co
            LEFT JOIN cita c
                ON c.id_consultorio = co.id_consultorio
            GROUP BY
                co.id_consultorio,
                co.numero,
                co.ubicacion
            HAVING COUNT(c.id_cita) <> (
                SELECT
                    SUM(
                        (SELECT COUNT(c2.id_cita)
                         FROM cita c2
                         WHERE c2.id_consultorio = co2.id_consultorio)
                    ) / COUNT(*)
                FROM consultorio co2
                WHERE co2.ubicacion = co.ubicacion
            )
        """

        cursor.execute(consulta)
        resultados = cursor.fetchall()

        if not resultados:
            raise HTTPException(
                status_code=404,
                detail="No se encontraron consultorios con desviación"
            )

        return resultados

    except HTTPException:
        raise
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
    finally:
        if cursor:
            cursor.close()
        if conexion:
            conexion.close()

@router.get("/api/segmentos/analisis-limpio")
def analisis_limpio():
    conexion = None
    cursor = None

    try:
        conexion = obtener_conexion()
        cursor = conexion.cursor(dictionary=True)

        consulta = """
            SELECT
                co.ubicacion,
                COUNT(c.id_cita) AS total_citas,
                SUM(c.valor_cita) AS recaudo_total,
                AVG(c.valor_cita) AS promedio_cita
            FROM cita c
            INNER JOIN consultorio co
                ON co.id_consultorio = c.id_consultorio
            WHERE c.id_cita NOT IN (
                SELECT c2.id_cita
                FROM cita c2
                INNER JOIN estadocita e
                    ON e.id_estado = c2.id_estado
                WHERE e.nombre IN (
                    'Cancelada por paciente',
                    'Cancelada por médico',
                    'No asistió'
                )
            )
            GROUP BY co.ubicacion
        """

        cursor.execute(consulta)
        resultados = cursor.fetchall()

        if not resultados:
            raise HTTPException(
                status_code=404,
                detail="No se encontraron segmentos"
            )

        return resultados

    except HTTPException:
        raise
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
    finally:
        if cursor:
            cursor.close()
        if conexion:
            conexion.close()


@router.get("/api/operaciones/resumen-dinamico")
def resumen_Dinamico(minOperaciones: int = Query(2, ge=1)):
    conexion = None
    cursor = None

    try:
        conexion = obtener_conexion()
        cursor = conexion.cursor(dictionary=True)

        consulta = """
            SELECT
                e.nombre AS estadoCita,
                COUNT(c.id_cita) AS totalOperaciones,
                AVG(esp.CostoClinica) AS costoPromedioClinica,
                (SELECT MIN(CostoClinica)
                 FROM especialidad) AS costoMinimoEspecialidad
            FROM cita c
            INNER JOIN estadocita e
                ON e.id_estado = c.id_estado
            INNER JOIN medico m
                ON m.id_medico = c.id_medico
            INNER JOIN especialidad esp
                ON esp.id_especialidad = m.id_especialidad
            GROUP BY e.nombre
            HAVING COUNT(c.id_cita) >= %s
                AND AVG(esp.CostoClinica) > (
                    SELECT MIN(CostoClinica)
                    FROM especialidad
                )
        """

        cursor.execute(consulta, (minOperaciones,))
        resultados = cursor.fetchall()

        if not resultados:
            raise HTTPException(
                status_code=404,
                detail="No se encontraron operaciones que cumplan los criterios"
            )

        return resultados

    except HTTPException:
        raise
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
    finally:
        if cursor:
            cursor.close()
        if conexion:
            conexion.close()

