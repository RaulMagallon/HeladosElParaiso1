-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-05-2024 a las 19:30:14
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
-- Base de datos: `tienda_online`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `id` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `status` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_cliente` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `id_transaccion` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `medio_pago` varchar(2) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `compra`
--

INSERT INTO `compra` (`id`, `fecha`, `status`, `email`, `id_cliente`, `total`, `id_transaccion`, `medio_pago`) VALUES
(1, '2023-10-18 05:58:53', 'COMPLETED', 'sb-psqct21499885@personal.example.com', 'YMW6SMUJGZ3UC', 150.00, '4T749197M5748592P', ''),
(2, '2023-10-18 08:40:54', 'COMPLETED', 'sb-psqct21499885@personal.example.com', 'YMW6SMUJGZ3UC', 150.00, '4A4481740G1494828', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacto`
--

CREATE TABLE `contacto` (
  `nombre` varchar(20) CHARACTER SET ucs2 COLLATE ucs2_spanish2_ci NOT NULL,
  `email` text CHARACTER SET ucs2 COLLATE ucs2_spanish2_ci NOT NULL,
  `mensaje` text CHARACTER SET ucs2 COLLATE ucs2_spanish2_ci NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_compra`
--

CREATE TABLE `detalle_compra` (
  `id` int(11) NOT NULL,
  `id_compra` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(120) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `precio` decimal(10,5) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_compra`
--

INSERT INTO `detalle_compra` (`id`, `id_compra`, `id_producto`, `nombre`, `precio`, `cantidad`) VALUES
(1, 1, 1, 'helado de fresa', 75.00000, 1),
(2, 1, 3, 'helado de chocolate', 75.00000, 1),
(3, 2, 1, 'helado de fresa', 75.00000, 1),
(4, 2, 2, 'helado de vainilla', 75.00000, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(120) NOT NULL,
  `descripcion` text NOT NULL,
  `precio` decimal(5,0) NOT NULL,
  `descuento` tinyint(4) NOT NULL,
  `archivo_descarga` varchar(80) NOT NULL,
  `num_descargas` int(11) NOT NULL,
  `activo` tinyint(4) NOT NULL,
  `fecha_alta` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `precio`, `descuento`, `archivo_descarga`, `num_descargas`, `activo`, `fecha_alta`) VALUES
(1, 'helado de fresa', 'El helado de fresa es un helado hecho con pulpa de fresa o sus correspondientes colorantes y saborizantes. Está hecho a partir de la mezcla de la fresa con huevos, crema, vainilla y azúcar. ​​ La mayoría de helados de fresa tienen un color rosado o rojo pastel.', 75, 0, '', 0, 1, '2023-10-18 04:20:02'),
(2, 'helado de vainilla', 'El helado de vainilla es un tipo de helado con sabor a vainilla que puede ser natural o artificial.1​ Al igual que otros sabores de helado, se creó originalmente enfriando una mezcla hecha de crema, azúcar y vainilla sobre un recipiente con hielo y sal.', 75, 0, '', 0, 1, '2023-10-18 04:29:49'),
(3, 'helado de chocolate', 'El helado de chocolate es un tipo de helado con sabor a chocolate que puede ser natural o artificial. Esta variedad de helado data de antes de 1693, año en el que fue publicada la primera receta de ese helado en Italia.2', 75, 0, '', 0, 1, '2023-10-18 04:33:58'),
(4, 'helado de limón', 'El helado de limón es un helado de sabor ligero hecho con jugo o ralladura de esta popular fruta cítrica. Este sabor particular está disponible en varios fabricantes de helados, y también se puede encontrar en muchas heladerías.', 75, 0, '', 0, 1, '2023-10-18 04:36:32'),
(5, 'helado de mango', 'El mango es una fruta muy conocida tanto por su sabor dulce y cremoso como por contener gran cantidad de nutrientes. Al ser una fruta rica en hierro, vitamina C, vitamina A, vitamina B6, potasio y ácido fólico, además de contener fibra, supone una gran fuente de energía y antioxidantes. ', 75, 0, '', 0, 1, '2023-10-18 05:20:05'),
(6, 'helado de uva', 'El helado de uva es un tipo de helado con sabor a uva, en el que se emplea zumo de uva para su elaboración. Existen ciertas variaciones como los sándwiches de helado de uva y refrescos de helado de uva. El helado de uva suele ser ofrecido en festivales de la uva, como el Naples Grape Festival. Esta variedad de helado es uno de los sabores más populares en Japón.', 75, 0, '', 0, 1, '2023-10-18 05:40:01'),
(7, 'helado de kiwi', 'Una deliciosa receta natural de helado hecho con ingredientes 100% vegetales y saludables. Es un helado apto para veganos y vegetarianos.\r\n\r\nEs un helado cold press hecho con el Extractor de zumos Kuvings y su filtro para hacer helados. De esta forma todos los helados que hagamos con Kuvings serán helados prensado en frío sin producir calor ni corte.\r\n\r\n', 75, 0, '', 0, 1, '2023-10-18 09:05:43');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `contacto`
--
ALTER TABLE `contacto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `contacto`
--
ALTER TABLE `contacto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
