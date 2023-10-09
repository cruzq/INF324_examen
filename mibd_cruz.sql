-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-10-2023 a las 13:59:47
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mibd_cruz`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docente`
--

CREATE TABLE `docente` (
  `ci_doc` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `profesion` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `docente`
--

INSERT INTO `docente` (`ci_doc`, `nombre`, `apellido`, `profesion`) VALUES
(1, 'María', 'González', 'Ingeniera de Sistemas'),
(2, 'Elena', 'Rios', 'Peritaje'),
(3, 'Hugo', 'Demar', 'Ingeniera de Sistemas'),
(4, 'Silvia', 'Cabrera', 'Licenciada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `ci_est` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `departamento` varchar(30) DEFAULT NULL,
  `genero` char(1) DEFAULT NULL,
  `fecha_nac` date DEFAULT NULL,
  `usuario` varchar(30) DEFAULT NULL,
  `contrasenia` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`ci_est`, `nombre`, `apellido`, `departamento`, `genero`, `fecha_nac`, `usuario`, `contrasenia`) VALUES
(1, 'Juan', 'Pérez', 'La Paz', 'M', '1999-01-01', 'juan.perez', '123456'),
(2, 'Maria', 'Burgos', 'Santa Cruz', 'F', '2000-05-01', 'mBurgos', '123'),
(3, 'Carlos', 'Paredes', 'Beni', 'M', '2001-10-03', 'carlosPP', 'hola'),
(4, 'Renato', 'Velazques', 'Cochabamba', 'M', '2000-01-01', 'ren123', 'c123'),
(5, 'Luis', 'Miranda', 'La Paz', 'M', '1999-09-01', 'luimi', 'g2g2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `semestre`
--

CREATE TABLE `semestre` (
  `estudiante_ci_est` int(10) UNSIGNED NOT NULL,
  `docente_ci_doc` int(10) UNSIGNED NOT NULL,
  `sigla` varchar(30) DEFAULT NULL,
  `materia` varchar(30) DEFAULT NULL,
  `paralelo` varchar(30) DEFAULT NULL,
  `nota` varchar(30) DEFAULT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `semestre`
--

INSERT INTO `semestre` (`estudiante_ci_est`, `docente_ci_doc`, `sigla`, `materia`, `paralelo`, `nota`, `fecha`) VALUES
(1, 1, 'MAT111', 'Programacion 1', 'A', '51', '2022-10-10'),
(1, 2, 'MAT115', 'Algebra 1', 'A', '70', '2022-10-10'),
(2, 1, 'LIN135', 'Lenguaje', 'B', '45', '2023-10-10'),
(3, 1, 'MAT156', 'Informatica y Sociedad', 'C', '51', '2023-10-10');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `docente`
--
ALTER TABLE `docente`
  ADD PRIMARY KEY (`ci_doc`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`ci_est`);

--
-- Indices de la tabla `semestre`
--
ALTER TABLE `semestre`
  ADD PRIMARY KEY (`estudiante_ci_est`,`docente_ci_doc`),
  ADD KEY `estudiante_has_docente_FKIndex1` (`estudiante_ci_est`),
  ADD KEY `estudiante_has_docente_FKIndex2` (`docente_ci_doc`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `docente`
--
ALTER TABLE `docente`
  MODIFY `ci_doc` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  MODIFY `ci_est` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `semestre`
--
ALTER TABLE `semestre`
  ADD CONSTRAINT `semestre_ibfk_1` FOREIGN KEY (`estudiante_ci_est`) REFERENCES `estudiante` (`ci_est`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `semestre_ibfk_2` FOREIGN KEY (`docente_ci_doc`) REFERENCES `docente` (`ci_doc`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
