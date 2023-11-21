-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-11-2023 a las 23:47:07
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `entrada_salida`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrada`
--

CREATE TABLE `entrada` (
  `ID_Entrada` int(11) NOT NULL,
  `ID_Producto` int(11) DEFAULT NULL,
  `Fecha_Entrada` date DEFAULT NULL,
  `Cantidad_Entrada` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `entrada`
--

INSERT INTO `entrada` (`ID_Entrada`, `ID_Producto`, `Fecha_Entrada`, `Cantidad_Entrada`) VALUES
(1, 7, '2023-11-21', 20),
(3, 7, '2023-11-21', 15),
(4, 7, '2023-11-21', 16),
(5, 7, '2023-11-21', 40);

--
-- Disparadores `entrada`
--
DELIMITER $$
CREATE TRIGGER `actualizar_stock_entrada` AFTER INSERT ON `entrada` FOR EACH ROW UPDATE Productos
SET Stock_Actual = Stock_Actual + NEW.Cantidad_Entrada
WHERE Productos.ID_Producto = NEW.ID_Producto
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos`
--

CREATE TABLE `movimientos` (
  `ID_Movimiento` int(11) NOT NULL,
  `Tipo` enum('Entrada','Salida') DEFAULT NULL,
  `ID_Entrada` int(11) DEFAULT NULL,
  `ID_Salida` int(11) DEFAULT NULL,
  `FechaMovimiento` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `ID_Producto` int(11) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Descripcion` text DEFAULT NULL,
  `Stock_Actual` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`ID_Producto`, `Nombre`, `Descripcion`, `Stock_Actual`) VALUES
(1, 'Coca-cola', 'Bebida dulce ', 30),
(2, 'Gomitas el venito', 'Las mejores gomas del mercado', 31),
(7, 'Arroz diana', 'El arroz mas rico', -86);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salida`
--

CREATE TABLE `salida` (
  `ID_Salida` int(11) NOT NULL,
  `ID_Producto` int(11) DEFAULT NULL,
  `Fecha_Salida` date DEFAULT NULL,
  `Cantidad_Salida` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `salida`
--

INSERT INTO `salida` (`ID_Salida`, `ID_Producto`, `Fecha_Salida`, `Cantidad_Salida`) VALUES
(3, 7, '2023-11-25', 80),
(4, 7, '2023-11-25', 5),
(5, 7, '2023-11-25', 2),
(6, 7, '2023-11-25', 100);

--
-- Disparadores `salida`
--
DELIMITER $$
CREATE TRIGGER `actualizar_stock_salida` AFTER INSERT ON `salida` FOR EACH ROW UPDATE Productos
SET Stock_Actual = Stock_Actual - NEW.Cantidad_Salida
WHERE Productos.ID_Producto = NEW.ID_Producto
$$
DELIMITER ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `entrada`
--
ALTER TABLE `entrada`
  ADD PRIMARY KEY (`ID_Entrada`),
  ADD KEY `ID_Producto` (`ID_Producto`);

--
-- Indices de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD PRIMARY KEY (`ID_Movimiento`),
  ADD KEY `ID_Entrada` (`ID_Entrada`),
  ADD KEY `ID_Salida` (`ID_Salida`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`ID_Producto`);

--
-- Indices de la tabla `salida`
--
ALTER TABLE `salida`
  ADD PRIMARY KEY (`ID_Salida`),
  ADD KEY `ID_Producto` (`ID_Producto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `entrada`
--
ALTER TABLE `entrada`
  MODIFY `ID_Entrada` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  MODIFY `ID_Movimiento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `ID_Producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `salida`
--
ALTER TABLE `salida`
  MODIFY `ID_Salida` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `entrada`
--
ALTER TABLE `entrada`
  ADD CONSTRAINT `entrada_ibfk_1` FOREIGN KEY (`ID_Producto`) REFERENCES `productos` (`ID_Producto`);

--
-- Filtros para la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD CONSTRAINT `movimientos_ibfk_1` FOREIGN KEY (`ID_Entrada`) REFERENCES `entrada` (`ID_Entrada`),
  ADD CONSTRAINT `movimientos_ibfk_2` FOREIGN KEY (`ID_Salida`) REFERENCES `salida` (`ID_Salida`);

--
-- Filtros para la tabla `salida`
--
ALTER TABLE `salida`
  ADD CONSTRAINT `salida_ibfk_1` FOREIGN KEY (`ID_Producto`) REFERENCES `productos` (`ID_Producto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
