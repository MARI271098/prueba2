-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-10-2023 a las 05:09:07
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gestion_archivos`
--
CREATE DATABASE IF NOT EXISTS `gestion_archivos` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `gestion_archivos`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `archivos`
--

CREATE TABLE `archivos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `tipo` varchar(100) NOT NULL,
  `fecha_create` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` int(11) NOT NULL DEFAULT 1,
  `elimina` datetime DEFAULT NULL,
  `id_carpeta` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `archivos`
--

INSERT INTO `archivos` (`id`, `nombre`, `tipo`, `fecha_create`, `estado`, `elimina`, `id_carpeta`, `id_usuario`) VALUES
(1, 'ALCANTARA_AME.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', '2023-08-04 21:29:15', 1, NULL, 1, 1),
(2, 'BASE_1.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', '2023-08-04 21:29:15', 1, NULL, 1, 1),
(3, 'JAN.txt', 'text/plain', '2023-08-04 21:29:15', 1, NULL, 1, 1),
(4, 'PALABRAS XX.txt', 'text/plain', '2023-08-04 21:29:15', 1, NULL, 1, 1),
(5, 'prueba 1.pdf', 'application/pdf', '2023-08-04 21:29:15', 1, NULL, 1, 1),
(6, 'RESPUESTA ALCANTARA OBRAS.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', '2023-08-04 21:29:15', 1, NULL, 1, 1),
(8, 'categorias de solicitudes de información.txt', 'text/plain', '2023-08-04 22:38:45', 1, NULL, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carpetas`
--

CREATE TABLE `carpetas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `fecha_create` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` int(11) NOT NULL DEFAULT 1,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `carpetas`
--

INSERT INTO `carpetas` (`id`, `nombre`, `fecha_create`, `estado`, `id_usuario`) VALUES
(1, 'Prueba 1', '2023-07-18 02:53:35', 1, 1),
(2, 'prueba2', '2023-07-18 02:54:21', 1, 1),
(3, 'prueba1', '2023-07-18 02:56:10', 1, 4),
(4, 'prueba3', '2023-07-20 16:29:43', 1, 1),
(5, 'prueba2', '2023-07-24 15:49:32', 1, 4),
(6, 'prueba4', '2023-07-27 22:40:15', 1, 1),
(9, 'carpetax', '2023-07-27 22:58:08', 1, 1),
(10, 'prueba', '2023-08-04 16:49:52', 1, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_archivos`
--

CREATE TABLE `detalle_archivos` (
  `id` int(11) NOT NULL,
  `fecha_add` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `correo` varchar(100) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `elimina` datetime DEFAULT NULL,
  `id_archivo` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_archivos`
--

INSERT INTO `detalle_archivos` (`id`, `fecha_add`, `correo`, `estado`, `elimina`, `id_archivo`, `id_usuario`) VALUES
(1, '2023-07-18 02:56:01', 'admin1@gmail.com', 0, NULL, 1, 1),
(2, '2023-07-20 16:32:12', 'usuario2@gmail.com', 0, NULL, 6, 1),
(3, '2023-08-04 16:31:45', 'amerojas150@gmail.com', 2, NULL, 8, 1),
(4, '2023-08-04 16:31:44', 'amerojas150@gmail.com', 2, NULL, 9, 1),
(5, '2023-08-04 16:31:43', 'amerojas150@gmail.com', 2, NULL, 10, 1),
(6, '2023-07-27 22:48:30', 'usuario2@gmail.com', 0, NULL, 12, 1),
(7, '2023-07-27 22:48:54', 'usuario2@gmail.com', 0, NULL, 13, 1),
(8, '2023-07-27 22:48:49', 'usuario2@gmail.com', 0, NULL, 14, 1),
(9, '2023-07-27 22:48:59', 'usuario2@gmail.com', 0, NULL, 15, 1),
(10, '2023-07-27 22:48:39', 'usuario2@gmail.com', 0, NULL, 16, 1),
(11, '2023-07-27 22:48:45', 'usuario2@gmail.com', 0, NULL, 17, 1),
(12, '2023-07-27 22:48:35', 'usuario2@gmail.com', 0, NULL, 18, 1),
(13, '2023-07-27 23:01:50', 'usuario2@gmail.com', 0, NULL, 25, 1),
(14, '2023-08-04 18:22:07', 'admin1@gmail.com', 2, NULL, 23, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `perfil` varchar(100) DEFAULT NULL,
  `clave` varchar(200) NOT NULL,
  `token` varchar(100) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` int(11) NOT NULL DEFAULT 1,
  `rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `apellido`, `correo`, `telefono`, `direccion`, `perfil`, `clave`, `token`, `fecha`, `estado`, `rol`) VALUES
(1, 'Equipo', 'Tlachichuca', 'admin1@gmail.com', '2225258789', ' México', NULL, '$2y$10$yRFoTMK7lmcM6shzUzhx5O6qt2VZV2wRuCaLOOwpwTDmrKfewro/u', NULL, '2023-08-04 17:29:49', 1, 1),
(4, 'Mariel', 'Onofre', 'amerojas150@gmail.com', '2223355394', 'Puebla MEXICO', NULL, '$2y$10$9YIUIeFEXMBkb1GNqgfpquMCL9MxVHhR2QQKhWv0H37/aTpibOykW', NULL, '2023-08-04 16:29:51', 1, 1),
(7, 'prueba ', 'token', 'ame@gmail.com', '123456', 'DSF', NULL, '$2y$10$dAunHqhx1dcF4I/5scp7seWIAp1kc6uFcdveiI1QDCb.3RQEm1M8S', NULL, '2023-10-20 01:33:50', 1, 2),
(8, 'PRUEBATOKEN2', 'DOS', 'prueba2@gmail.com', '123456789', 'puebla', NULL, '$2y$10$XkBYPBJdZBQwGbAPhLttxuSUyjNZ69/eqQLhv1cxK./PvhLoRGZyG', NULL, '2023-10-23 03:07:58', 1, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `archivos`
--
ALTER TABLE `archivos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_carpeta` (`id_carpeta`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `carpetas`
--
ALTER TABLE `carpetas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `detalle_archivos`
--
ALTER TABLE `detalle_archivos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_archivo` (`id_archivo`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `archivos`
--
ALTER TABLE `archivos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `carpetas`
--
ALTER TABLE `carpetas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `detalle_archivos`
--
ALTER TABLE `detalle_archivos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `archivos`
--
ALTER TABLE `archivos`
  ADD CONSTRAINT `archivos_ibfk_1` FOREIGN KEY (`id_carpeta`) REFERENCES `carpetas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `archivos_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `carpetas`
--
ALTER TABLE `carpetas`
  ADD CONSTRAINT `carpetas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
