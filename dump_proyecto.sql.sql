-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Nov 06, 2026 at 03:18 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
CREATE DATABASE IF NOT EXISTS `gesalud` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `gesalud`;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gesalud`
--

-- --------------------------------------------------------

--
-- Table structure for table `cita`
--

DROP TABLE IF EXISTS `cita`;
CREATE TABLE `cita` (
  `id_cita` int(11) NOT NULL,
  `id_paciente` int(11) NOT NULL,
  `id_medico` int(11) NOT NULL,
  `id_consultorio` int(11) NOT NULL,
  `id_estado` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `motivo` varchar(150) NOT NULL,
  `valor_cita` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cita`
--

INSERT INTO `cita` (`id_cita`, `id_paciente`, `id_medico`, `id_consultorio`, `id_estado`, `fecha`, `hora`, `motivo`, `valor_cita`) VALUES
(1, 1, 1, 1, 3, '2026-09-08', '08:00:00', 'Control general', 15000.00),
(2, 2, 2, 2, 3, '2026-09-08', '09:00:00', 'Dolor en el pecho', 15000.00),
(3, 7, 3, 3, 3, '2026-09-09', '10:00:00', 'Control de crecimiento', 0.00),
(4, 4, 4, 4, 4, '2026-09-10', '11:00:00', 'Revisión de lunar', 15000.00),
(5, 5, 5, 5, 3, '2026-09-11', '14:00:00', 'Control prenatal', 0.00),
(6, 6, 6, 6, 3, '2026-09-14', '08:30:00', 'Dolor de rodilla', 15000.00),
(7, 8, 1, 1, 6, '2026-09-15', '08:00:00', 'Chequeo anual', 15000.00),
(8, 10, 2, 2, 3, '2026-09-16', '09:00:00', 'Control de hipertensión', 15000.00),
(9, 9, 7, 7, 3, '2026-09-17', '10:30:00', 'Gripe persistente', 0.00),
(10, 11, 9, 9, 3, '2026-09-18', '15:00:00', 'Revisión visual', 15000.00),
(11, 12, 10, 10, 4, '2026-09-21', '16:00:00', 'Control de ansiedad', 0.00),
(12, 13, 13, 11, 3, '2026-09-22', '09:30:00', 'Control de tiroides', 15000.00),
(13, 14, 11, 3, 2, '2026-10-27', '10:00:00', 'Vacunación', 0.00),
(14, 1, 2, 2, 2, '2026-10-28', '09:00:00', 'Seguimiento cardiológico', 15000.00),
(15, 2, 1, 1, 1, '2026-10-29', '08:00:00', 'Control general', 15000.00),
(16, 7, 3, 3, 1, '2026-10-30', '10:00:00', 'Control pediátrico', 0.00),
(17, 15, 14, 12, 2, '2026-11-02', '11:00:00', 'Dolor de oído', 0.00),
(18, 6, 15, 13, 1, '2026-11-03', '14:00:00', 'Control cardiológico', 15000.00),
(19, 10, 12, 14, 10, '2026-11-04', '15:30:00', 'Consulta urológica', 15000.00),
(20, 4, 6, 6, 1, '2026-11-05', '08:30:00', 'Seguimiento ortopédico', 15000.00);

-- --------------------------------------------------------

--
-- Table structure for table `consultorio`
--

DROP TABLE IF EXISTS `consultorio`;
CREATE TABLE `consultorio` (
  `id_consultorio` int(11) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `ubicacion` varchar(60) NOT NULL,
  `estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `consultorio`
--

INSERT INTO `consultorio` (`id_consultorio`, `numero`, `ubicacion`, `estado`) VALUES
(1, '101', 'Piso 1 - Ala Norte', 'Disponible'),
(2, '102', 'Piso 1 - Ala Norte', 'Disponible'),
(3, '103', 'Piso 1 - Ala Norte', 'Ocupado'),
(4, '104', 'Piso 1 - Ala Sur', 'Disponible'),
(5, '105', 'Piso 1 - Ala Sur', 'Disponible'),
(6, '201', 'Piso 2 - Ala Norte', 'Disponible'),
(7, '202', 'Piso 2 - Ala Norte', 'Ocupado'),
(8, '203', 'Piso 2 - Ala Norte', 'Mantenimiento'),
(9, '204', 'Piso 2 - Ala Sur', 'Disponible'),
(10, '205', 'Piso 2 - Ala Sur', 'Disponible'),
(11, '301', 'Piso 3 - Ala Norte', 'Disponible'),
(12, '302', 'Piso 3 - Ala Norte', 'Disponible'),
(13, '303', 'Piso 3 - Ala Sur', 'Ocupado'),
(14, '304', 'Piso 3 - Ala Sur', 'Disponible'),
(15, '305', 'Piso 3 - Ala Sur', 'Mantenimiento');

-- --------------------------------------------------------

--
-- Table structure for table `especialidad`
--

DROP TABLE IF EXISTS `especialidad`;
CREATE TABLE `especialidad` (
  `id_especialidad` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(150) DEFAULT NULL,
  `CostoClinica` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `especialidad`
--

INSERT INTO `especialidad` (`id_especialidad`, `nombre`, `descripcion`, `CostoClinica`) VALUES
(1, 'Medicina General', 'Atención médica integral', 8000.00),
(2, 'Cardiología', 'Enfermedades del corazón', 18000.00),
(3, 'Pediatría', 'Atención de niños y adolescentes', 10000.00),
(4, 'Dermatología', 'Enfermedades de la piel', 15000.00),
(5, 'Ginecología', 'Salud femenina y control prenatal', 12000.00),
(6, 'Ortopedia', 'Huesos, músculos y articulaciones', 16000.00),
(7, 'Neurología', 'Sistema nervioso', 20000.00),
(8, 'Oftalmología', 'Salud visual', 14000.00),
(9, 'Psiquiatría', 'Salud mental', 17000.00),
(10, 'Urología', 'Sistema urinario', 13000.00),
(11, 'Endocrinología', 'Diabetes y tiroides', 15000.00),
(12, 'Otorrinolaringología', 'Oído, nariz y garganta', 12000.00),
(13, 'Odontología', 'Salud oral', 11000.00),
(14, 'Nutrición', 'Orientación nutricional', 9000.00),
(15, 'Fisioterapia', 'Rehabilitación física', 10000.00);

-- --------------------------------------------------------

--
-- Table structure for table `estadocita`
--

DROP TABLE IF EXISTS `estadocita`;
CREATE TABLE `estadocita` (
  `id_estado` int(11) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `descripcion` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `estadocita`
--

INSERT INTO `estadocita` (`id_estado`, `nombre`, `descripcion`) VALUES
(1, 'Programada', 'Cita registrada en agenda'),
(2, 'Confirmada', 'El paciente confirmó su asistencia'),
(3, 'Atendida', 'El paciente fue atendido'),
(4, 'Cancelada por paciente', 'El paciente canceló la cita'),
(5, 'Cancelada por médico', 'El médico canceló la cita'),
(6, 'No asistió', 'El paciente no se presentó'),
(7, 'Reprogramada', 'Movida a otra fecha u hora'),
(8, 'En sala de espera', 'El paciente ya llegó'),
(9, 'En atención', 'La consulta se está realizando'),
(10, 'Pendiente de confirmación', 'Falta confirmar asistencia'),
(11, 'Finalizada', 'Cita cerrada'),
(12, 'Rechazada', 'Solicitud rechazada'),
(13, 'Vencida', 'Pasó la fecha sin atenderse'),
(14, 'Anulada', 'Anulada por error de registro'),
(15, 'En lista de espera', 'Pendiente de cupo'),
(16, 'Programada', 'Cita registrada en agenda'),
(17, 'Confirmada', 'El paciente confirmó su asistencia'),
(18, 'Atendida', 'El paciente fue atendido'),
(19, 'Cancelada por paciente', 'El paciente canceló la cita'),
(20, 'Cancelada por médico', 'El médico canceló la cita'),
(21, 'No asistió', 'El paciente no se presentó'),
(22, 'Reprogramada', 'Movida a otra fecha u hora'),
(23, 'En sala de espera', 'El paciente ya llegó'),
(24, 'En atención', 'La consulta se está realizando'),
(25, 'Pendiente de confirmación', 'Falta confirmar asistencia'),
(26, 'Finalizada', 'Cita cerrada'),
(27, 'Rechazada', 'Solicitud rechazada'),
(28, 'Vencida', 'Pasó la fecha sin atenderse'),
(29, 'Anulada', 'Anulada por error de registro'),
(30, 'En lista de espera', 'Pendiente de cupo');

-- --------------------------------------------------------

--
-- Table structure for table `historiaclinica`
--

DROP TABLE IF EXISTS `historiaclinica`;
CREATE TABLE `historiaclinica` (
  `id_historia` int(11) NOT NULL,
  `id_paciente` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `antecedentes` varchar(255) DEFAULT NULL,
  `observaciones` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `historiaclinica`
--

INSERT INTO `historiaclinica` (`id_historia`, `id_paciente`, `fecha`, `antecedentes`, `observaciones`) VALUES
(1, 1, '2026-01-10', 'Alergia a la penicilina', 'Paciente estable, control anual'),
(2, 2, '2026-01-12', 'Hipertensión familiar', 'Se recomienda dieta baja en sodio'),
(3, 3, '2026-01-15', 'Asma leve en la infancia', 'Sin crisis en el último año'),
(4, 4, '2026-01-20', 'Cirugía de apéndice (2010)', 'Recuperación completa'),
(5, 5, '2026-02-02', 'Ninguno relevante', 'Embarazo de 20 semanas, evolución normal'),
(6, 6, '2026-02-05', 'Diabetes tipo 2', 'Control de glicemia cada tres meses'),
(7, 7, '2026-02-09', 'Esquema de vacunación completo', 'Crecimiento acorde a la edad'),
(8, 8, '2026-02-14', 'Gastritis crónica', 'Evitar irritantes y comidas pesadas'),
(9, 9, '2026-02-18', 'Migraña ocasional', 'Llevar registro de episodios'),
(10, 10, '2026-02-23', 'Hipertensión arterial', 'Medicación controlada'),
(11, 11, '2026-03-01', 'Rinitis alérgica', 'Control en temporada de lluvias'),
(12, 12, '2026-03-06', 'Ansiedad leve', 'En seguimiento con psiquiatría'),
(13, 13, '2026-03-11', 'Hipotiroidismo', 'Ajuste de dosis de medicación'),
(14, 14, '2026-03-16', 'Varicela a los 5 años', 'Vacunación al día'),
(15, 15, '2026-03-20', 'Lesión de ligamento (2019)', 'Ejercicio de bajo impacto');

-- --------------------------------------------------------

--
-- Table structure for table `medico`
--

DROP TABLE IF EXISTS `medico`;
CREATE TABLE `medico` (
  `id_medico` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(60) NOT NULL,
  `documento` varchar(15) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `correo` varchar(80) NOT NULL,
  `id_especialidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medico`
--

INSERT INTO `medico` (`id_medico`, `id_usuario`, `nombre`, `apellido`, `documento`, `telefono`, `correo`, `id_especialidad`) VALUES
(1, 16, 'Miguel', 'Rojas Cardozo', '1002345001', '3105550101', 'miguel.tyson@gesalud.com', 1),
(2, 17, 'Pablo', 'Puertas Villalba', '1002345002', '3105550102', 'pablo.puertas@gesalud.com', 2),
(3, 18, 'Lucía', 'Fernández Mejía', '1002345003', '3105550103', 'lucia.fernandez@gesalud.com', 3),
(4, 19, 'Ricardo', 'Salcedo Gutierrez', '1002345004', '3105550104', 'ricardo.salcedo@gesalud.com', 4),
(5, 20, 'Natalia', 'Gonzalez Nieves', '1002345005', '3105550105', 'natalia.berrio@gesalud.com', 5),
(6, 21, 'Héctor', 'Camargo Ladino', '1002345006', '3105550106', 'hector.camargo@gesalud.com', 6),
(7, 22, 'Mónica', 'Arrieta Doria', '1002345007', '3105550107', 'monica.arrieta@gesalud.com', 1),
(8, 23, 'Felipe', 'Cárdenas Ortiz', '1002345008', '3105550108', 'felipe.cardenas@gesalud.com', 7),
(9, 24, 'Diana', 'Montalvo Reyes', '1002345009', '3105550109', 'diana.montalvo@gesalud.com', 8),
(10, 25, 'Josue', 'Herrera Guzmán', '1002345010', '3105550110', 'esteban.lora@gesalud.com', 9),
(11, 26, 'Carolina', 'Banda Álvarez', '1002345011', '3105550111', 'carolina.banda@gesalud.com', 3),
(12, 27, 'Alberto', 'Sierra Monterroza', '1002345012', '3105550112', 'alberto.sierra@gesalud.com', 10),
(13, 28, 'Gloria', 'Padilla Mendez', '1002345013', '3105550113', 'gloria.padilla@gesalud.com', 11),
(14, 29, 'Julián', 'Pastrana Hoyos', '1002345014', '3105550114', 'julian.pastrana@gesalud.com', 12),
(15, 30, 'Marcela', 'Gracia Tapia', '1002345015', '3105550115', 'marcela.ibanez@gesalud.com', 2);

-- --------------------------------------------------------

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
CREATE TABLE `paciente` (
  `id_paciente` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(60) NOT NULL,
  `documento` varchar(15) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `correo` varchar(80) NOT NULL,
  `regimen` enum('Contributivo','Subsidiado') NOT NULL DEFAULT 'Contributivo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `paciente`
--

INSERT INTO `paciente` (`id_paciente`, `id_usuario`, `nombre`, `apellido`, `documento`, `fecha_nacimiento`, `telefono`, `correo`, `regimen`) VALUES
(1, 1, 'María', 'Velez Gómez', '1067801001', '1990-03-15', '3001234501', 'maria.velez@correo.com', 'Contributivo'),
(2, 2, 'Martín', 'Osorio Díaz', '1067801002', '1985-07-22', '3001234502', 'martin.osorio@correo.com', 'Contributivo'),
(3, 3, 'Laura', 'Jaramillo Ruiz', '1067801003', '1998-11-05', '3001234503', 'laura.jaramillo@correo.com', 'Subsidiado'),
(4, 4, 'Carlos', 'Alcaraz Garfia', '1067801004', '1978-01-30', '3001234504', 'carlos.alcaraz@correo.com', 'Contributivo'),
(5, 5, 'Luis', 'Vergara Matinez', '1067801005', '2001-09-12', '3001234505', 'luis.vergara@correo.com', 'Subsidiado'),
(6, 6, 'Juan', 'Fernandez Guzman', '1067801006', '1965-05-18', '3001234506', 'juan.fernandez@correo.com', 'Contributivo'),
(7, 7, 'Sofía', 'Gutiérrez Herrera', '1067801007', '2014-02-27', '3001234507', 'sofia.gutierrez@correo.com', 'Subsidiado'),
(8, 8, 'Jenifer', 'López Barrios', '1067801008', '1992-12-03', '3001234508', 'jenifer.lopez@correo.com', 'Contributivo'),
(9, 9, 'Camila', 'Cabello Villadiego', '1067801009', '1995-06-25', '3001234509', 'camila.villadiego@correo.com', 'Subsidiado'),
(10, 10, 'Jorge', 'Díaz Arrieta', '1067801010', '1958-08-09', '3001234510', 'jorge.diaz@correo.com', 'Contributivo'),
(11, 11, 'Lionel', 'Messi Cuccittini', '1067801011', '2005-04-14', '3001234511', 'lio.messi@correo.com', 'Contributivo'),
(12, 12, 'Daniel', 'Ortega Pacheco', '1067801012', '1988-10-21', '3001234512', 'daniel.ortega@correo.com', 'Subsidiado'),
(13, 13, 'Paula', 'Vega Lozano', '1067801013', '1973-03-07', '3001234513', 'paula.vega@correo.com', 'Contributivo'),
(14, 14, 'Santiago', 'Acosta Benítez', '1067801014', '2015-12-19', '3001234514', 'santiago.acosta@correo.com', 'Subsidiado'),
(15, 15, 'Isabela', 'Rojas Narváez', '1067801015', '1983-07-01', '3001234515', 'isabela.rojas@correo.com', 'Subsidiado');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cita`
--
ALTER TABLE `cita`
  ADD PRIMARY KEY (`id_cita`),
  ADD KEY `id_paciente` (`id_paciente`),
  ADD KEY `id_medico` (`id_medico`),
  ADD KEY `id_consultorio` (`id_consultorio`),
  ADD KEY `id_estado` (`id_estado`);

--
-- Indexes for table `consultorio`
--
ALTER TABLE `consultorio`
  ADD PRIMARY KEY (`id_consultorio`);

--
-- Indexes for table `especialidad`
--
ALTER TABLE `especialidad`
  ADD PRIMARY KEY (`id_especialidad`);

--
-- Indexes for table `estadocita`
--
ALTER TABLE `estadocita`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indexes for table `historiaclinica`
--
ALTER TABLE `historiaclinica`
  ADD PRIMARY KEY (`id_historia`),
  ADD KEY `id_paciente` (`id_paciente`);

--
-- Indexes for table `medico`
--
ALTER TABLE `medico`
  ADD PRIMARY KEY (`id_medico`),
  ADD UNIQUE KEY `documento` (`documento`),
  ADD KEY `id_especialidad` (`id_especialidad`);

--
-- Indexes for table `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`id_paciente`),
  ADD UNIQUE KEY `documento` (`documento`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cita`
--
ALTER TABLE `cita`
  MODIFY `id_cita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `consultorio`
--
ALTER TABLE `consultorio`
  MODIFY `id_consultorio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `especialidad`
--
ALTER TABLE `especialidad`
  MODIFY `id_especialidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `estadocita`
--
ALTER TABLE `estadocita`
  MODIFY `id_estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `historiaclinica`
--
ALTER TABLE `historiaclinica`
  MODIFY `id_historia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `medico`
--
ALTER TABLE `medico`
  MODIFY `id_medico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `paciente`
--
ALTER TABLE `paciente`
  MODIFY `id_paciente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cita`
--
ALTER TABLE `cita`
  ADD CONSTRAINT `cita_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`),
  ADD CONSTRAINT `cita_ibfk_2` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id_medico`),
  ADD CONSTRAINT `cita_ibfk_3` FOREIGN KEY (`id_consultorio`) REFERENCES `consultorio` (`id_consultorio`),
  ADD CONSTRAINT `cita_ibfk_4` FOREIGN KEY (`id_estado`) REFERENCES `estadocita` (`id_estado`);

--
-- Constraints for table `historiaclinica`
--
ALTER TABLE `historiaclinica`
  ADD CONSTRAINT `historiaclinica_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`);

--
-- Constraints for table `medico`
--
ALTER TABLE `medico`
  ADD CONSTRAINT `medico_ibfk_1` FOREIGN KEY (`id_especialidad`) REFERENCES `especialidad` (`id_especialidad`);
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
