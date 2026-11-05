## 1. Documento de Homologación

En mi proyecto de **GeSaludAPI**, enfocado en la gestión de información de una clínica, la Entidad Catálogo es especialidad, la Entidad Transaccional es cita, la Entidad Actor es paciente, el Recurso es consultorio, el Segmento es ubicacion y la Entidad de Estado es estadocita. La homologación de entidades se establece de la siguiente manera:


| Concepto solicitado | Correspondencia en mi proyecto |
|---|---|
| Entidad Catálogo | Especialidad (`especialidad`) |
| Entidad Transaccional | Cita médica (`cita`) |
| Entidad Actor | Paciente (`paciente`) |
| Entidad de agrupación o recurso | Consultorio (`consultorio`) |
| Entidad de contexto o segmento | Ubicación del consultorio (`consultorio.ubicacion`) |
| Entidad de estado | Estado de la cita (`estadocita`) |

## 2. Descripción de los cinco endpoints

### 1. Clasificación Top
**Ruta:** `GET /api/reportes/clasificacion-top`

Este endpoint permite identificar las especialidades médicas cuyo promedio de valor de las citas es superior al promedio general de todas las citas registradas en la clínica. De esta manera, se pueden analizar las especialidades que presentan un mayor valor promedio por atención.

### 2. Actores Estrella
**Ruta:** `GET /api/analitica/actores-estrella`

Este endpoint identifica a los pacientes cuyo valor acumulado en citas médicas supera el promedio del valor acumulado de todos los pacientes. Permite conocer cuáles pacientes representan una mayor actividad económica dentro del sistema.

### 3. Desviación por Grupo
**Ruta:** `GET /api/items/desviacion-grupo`

Este endpoint analiza la cantidad de citas registradas por consultorio y las compara con el promedio de citas de los consultorios que se encuentran en la misma ubicación. Permite identificar los consultorios que están por encima o por debajo de ese promedio.

### 4. Análisis Limpio
**Ruta:** `GET /api/segmentos/analisis-limpio`

Este endpoint presenta un análisis de las citas agrupadas por ubicación de los consultorios, excluyendo aquellas que se encuentran en estados como cancelada por paciente, cancelada por médico o no asistió. Permite analizar la información de las citas sin incluir estos registros.

### 5. Resumen Dinámico
**Ruta:** `GET /api/operaciones/Resumen-Dinamico`

Este endpoint genera un resumen de las citas agrupadas según su estado, teniendo en cuenta una cantidad mínima de operaciones indicada mediante un parámetro. También compara el costo promedio de la clínica con el costo mínimo registrado entre las especialidades.
