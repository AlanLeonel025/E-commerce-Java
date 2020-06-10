-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-06-2020 a las 21:55:29
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `carrito_suplementos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `cli_id` int(11) NOT NULL,
  `cli_nombre` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `cli_apellido` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `cli_email` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`cli_id`, `cli_nombre`, `cli_apellido`, `cli_email`) VALUES
(2, 'juan', 'martinez', 'juan@martinez.com'),
(3, 'pedro', 'bustos', 'pedro@bustos.com'),
(4, 'martin', 'suarez', 'martin@suarez.com'),
(6, 'alan', 'garcia', 'ahhaha@h'),
(7, 'omar', 'carlos', 'omar@carlos.com'),
(8, 'ivan', 'gomez', 'ivan@gomez'),
(9, 'pepe', 'polo', 'pepe@gomez'),
(12, 'silla', 'gomez', 'hahahah@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `vta_id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `detallevta_cantidad` smallint(6) NOT NULL,
  `detallevta_precio` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `prod_id` int(11) NOT NULL,
  `prod_nombre` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `prod_precio` float NOT NULL,
  `prod_imagen` varchar(150) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`prod_id`, `prod_nombre`, `prod_precio`, `prod_imagen`) VALUES
(1, 'Proteina', 1400, 'https://http2.mlstatic.com/advanced-whey-proteina-xtrenght-2lbs-isolate-blend-aislado-D_NQ_NP_796227-MLA32793025597_112019-O.webp'),
(2, 'Creatina', 1200, 'https://http2.mlstatic.com/creatine-500-gr-xtrenght-creatina-monohidrato-micronizada-sin-tacc-D_NQ_NP_641235-MLA31062346367_062019-F.webp'),
(3, 'Aminoacidos', 1000, 'https://http2.mlstatic.com/xtrenght-hydro-bcaa-pro-en-polvo-30-servicios-360grs-411-D_NQ_NP_989977-MLA31216545997_062019-F.webp'),
(4, 'Cutter Quemador', 749, 'https://http2.mlstatic.com/cutter-120caps-xtrenght-quemador-de-grasas-termogenico-D_NQ_NP_788187-MLA31577712287_072019-F.webp'),
(5, 'prueba', 1000, 'C:\\fakepath\\Koala.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nom_usuario` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `apell_usuario` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `email_usuario` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `pass_usuario` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `perfil` varchar(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nom_usuario`, `apell_usuario`, `email_usuario`, `pass_usuario`, `perfil`) VALUES
(1, 'alan', 'garcia', 'admin@admin.com', '123', 'admin'),
(2, 'pepe', 'gonzalez', 'usuario@usuario.com', '1234', 'cliente'),
(3, 'tomas', 'lili', 'tomas@tomas', '123', 'admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `vta_id` int(11) NOT NULL,
  `vta_fecha` date NOT NULL,
  `vta_num_factura` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `cli_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`cli_id`);

--
-- Indices de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD PRIMARY KEY (`vta_id`,`prod_id`),
  ADD KEY `prod_id` (`prod_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`prod_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`vta_id`),
  ADD KEY `cli_id` (`cli_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `cli_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `prod_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `vta_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD CONSTRAINT `detalle_venta_ibfk_1` FOREIGN KEY (`vta_id`) REFERENCES `ventas` (`vta_id`),
  ADD CONSTRAINT `detalle_venta_ibfk_2` FOREIGN KEY (`prod_id`) REFERENCES `productos` (`prod_id`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`cli_id`) REFERENCES `clientes` (`cli_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
