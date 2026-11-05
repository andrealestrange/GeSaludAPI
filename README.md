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
