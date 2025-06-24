-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 24-06-2025 a las 00:50:17
-- Versión del servidor: 9.1.0
-- Versión de PHP: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `agenda citas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datoscitas`
--

DROP TABLE IF EXISTS `datoscitas`;
CREATE TABLE IF NOT EXISTS `datoscitas` (
  `Motivocita` varchar(30) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `Horacita` time NOT NULL,
  `Fechacita` date NOT NULL,
  `nocita` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `datoscitas`
--

INSERT INTO `datoscitas` (`Motivocita`, `Horacita`, `Fechacita`, `nocita`) VALUES
('dolor de corazon', '03:22:00', '2025-06-10', 0),
('', '00:00:00', '0000-00-00', 0),
('diarrea y vomito', '09:20:00', '2025-06-26', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datosmedico`
--

DROP TABLE IF EXISTS `datosmedico`;
CREATE TABLE IF NOT EXISTS `datosmedico` (
  `NombreMedico` varchar(50) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `Cedula` varchar(15) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `Especialidad` varchar(30) COLLATE utf8mb4_spanish2_ci NOT NULL,
  PRIMARY KEY (`Cedula`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `datosmedico`
--

INSERT INTO `datosmedico` (`NombreMedico`, `Cedula`, `Especialidad`) VALUES
('Carlos Villán Hernández', '64874197875455', 'medico general');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datospaciente`
--

DROP TABLE IF EXISTS `datospaciente`;
CREATE TABLE IF NOT EXISTS `datospaciente` (
  `AP` varchar(15) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `AM` varchar(15) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `Nombre` varchar(30) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `Identificador` varchar(18) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `FechaNacimiento` date NOT NULL,
  PRIMARY KEY (`Identificador`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
