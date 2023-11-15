-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-11-2023 a las 06:17:04
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_delcampo1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `cedula` bigint(20) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `telefono` varchar(40) NOT NULL,
  `activo` tinyint(4) NOT NULL DEFAULT 1,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`cedula`, `nombre`, `correo`, `telefono`, `activo`, `fecha_registro`) VALUES
(123458462, 'Diego Sena', 'diego@gmial,com', '2154621', 1, '2023-11-13 21:49:34'),
(1003004328, 'DAsd', 'dasdsad@asda.com', 'asdas', 1, '2023-11-14 15:03:40'),
(1234562378, 'DAsd', 'dasdsad@asda.com', 'asdas', 1, '2023-11-14 14:59:03'),
(123435647867, 'Diego Sena Olea', 'diego@gmail.com', '3158456482', 1, '2023-11-15 04:31:09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `total` double NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_compras`
--

CREATE TABLE `detalles_compras` (
  `id` int(11) NOT NULL,
  `id_compra` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `nombre` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_venta`
--

CREATE TABLE `detalles_venta` (
  `id` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `precio` double NOT NULL,
  `cantidad` int(11) NOT NULL,
  `subtotal` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalles_venta`
--

INSERT INTO `detalles_venta` (`id`, `id_venta`, `id_producto`, `nombre`, `precio`, `cantidad`, `subtotal`) VALUES
(1, 1, 1, '1', 14000, 3, 42000),
(2, 1, 2, '2', 10000, 4, 40000),
(3, 1, 3, '3', 3000, 5, 15000),
(4, 1, 4, '4', 15000, 6, 90000),
(5, 3, 1, '1', 14000, 1, 14000),
(6, 3, 2, '2', 10000, 1, 10000),
(7, 4, 1, '1', 14000, 10, 140000),
(8, 4, 2, '2', 10000, 15, 150000),
(9, 4, 3, '3', 3000, 20, 60000),
(10, 4, 4, '4', 15000, 3, 45000),
(11, 4, 5, '5', 26000, 1, 26000),
(12, 4, 6, '6', 14000, 1, 14000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `precio` double NOT NULL,
  `cantidad_minima` int(11) DEFAULT NULL,
  `ubicacion` varchar(60) DEFAULT NULL,
  `cantidad` int(11) NOT NULL DEFAULT 0,
  `foto` varchar(70) DEFAULT NULL,
  `activo` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `descripcion`, `precio`, `cantidad_minima`, `ubicacion`, `cantidad`, `foto`, `activo`) VALUES
(1, 'Chorizo 550gr', 14000, 10, 'Bodega principal', 0, '97c70d8c-296b-4ac3-a872-8c06d92f5ce5.jpg', 1),
(2, 'Mortadela Tradicional 450gr', 10000, 0, 'Bodega Principal', 0, 'adb46836-3a60-43a0-aaa3-31af9567af8a.jpg', 1),
(3, 'Salchichon Ranchero', 3000, 25, 'Bodega 3', 2147483647, '92e9f6a5-bf23-4c47-b56a-93695a744fb1.jpg', 1),
(4, 'Producto Descripcion', 15000, 12, 'BODEGA', 0, '6aa5788c-de3c-44f5-ad02-525ac05ccc7f.jpg', 1),
(5, 'Carne molida especial x1000gr', 26000, 12, 'Bodega 2', 0, '46c05c39-a747-4448-90ad-33bb44958a47.jpg', 1),
(6, 'Pechuga 1000gr', 14000, 15, 'Bodega', 0, '99ef4fbc-125f-4f89-a567-24d666382670.png', 1),
(7, 'ppbb', 1651, 1651, '1651', 0, '5fe41ab6-0f07-489c-9ee1-2710eecedf28.png', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `rol` varchar(40) NOT NULL,
  `email` varchar(50) NOT NULL,
  `login` varchar(50) NOT NULL,
  `pwd` varchar(10) NOT NULL,
  `activo` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `rol`, `email`, `login`, `pwd`, `activo`) VALUES
(12345678, 'Carlos Mario Tirado Tovar', 'Vendedor', 'dsa@fgdg.com', 'carlossadas', '1234', 1),
(1003004328, 'David Delgado Medina', 'Vendedor', 'dmdr1015@hotmail.com', 'david', '1234', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `total` double NOT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `id_cliente`, `id_usuario`, `total`, `fecha_registro`) VALUES
(1, 1, 1, 24000, '2023-11-14 23:46:40'),
(2, 2, 1, 187000, '2023-11-15 00:00:45'),
(3, 1, 2, 24000, '2023-11-15 00:14:21'),
(4, 4, 4, 435000, '2023-11-15 00:15:38');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`cedula`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalles_compras`
--
ALTER TABLE `detalles_compras`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalles_venta`
--
ALTER TABLE `detalles_venta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalles_compras`
--
ALTER TABLE `detalles_compras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalles_venta`
--
ALTER TABLE `detalles_venta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1003004329;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
