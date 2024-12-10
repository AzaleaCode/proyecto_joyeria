-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 03-07-2024 a las 20:15:02
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
-- Base de datos: `bd_joyeria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `descripcion`) VALUES
(2, 'Anillos', 'Anillos de diferentes materiales y diseños'),
(3, 'Collares', 'Collares de perlas, oro, plata y más'),
(4, 'Pulseras', 'Pulseras elegantes y casuales'),
(5, 'Aretes', 'Aretes de varios estilos y materiales'),
(6, 'Broches', 'Broches decorativos y funcionales'),
(7, 'Relojes', 'Relojes de lujo y moda'),
(8, 'Alianzas', 'Anillos de compromiso y alianzas de boda'),
(9, 'Piedras preciosas', 'Joyas con diamantes, rubíes, zafiros, y más'),
(10, 'Joyas de plata', 'Joyas hechas de plata esterlina'),
(11, 'Joyas de oro', 'Joyas de oro amarillo, blanco y rosa'),
(12, 'Joyas personalizadas', 'Joyas hechas a medida'),
(13, 'Accesorios de joyería', 'Accesorios para complementar joyas'),
(14, 'Set de joyas', 'Conjuntos de joyas coordinadas'),
(15, 'Joyería para hombres', 'Joyas diseñadas para hombres'),
(16, 'Joyería para mujeres', 'Joyas diseñadas para mujeres'),
(17, 'Joyería para niños', 'Joyas adecuadas para niños'),
(18, 'Joyería vintage', 'Joyas antiguas y clásicas'),
(19, 'Joyería moderna', 'Diseños contemporáneos y de vanguardia'),
(20, 'Cajas de joyería', 'Cajas y estuches para guardar joyas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) DEFAULT NULL,
  `ci` int(11) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombres`, `apellidos`, `ci`, `direccion`, `telefono`, `email`) VALUES
(7, 'Lucia', 'Martinez', 33445566, 'Pasaje 14, Ciudad', 345678901, 'lucia.martinez@gmail.com'),
(8, 'Miguel', 'Torres', 44556677, 'Avenida Los Pinos 789, Ciudad', 456789012, 'miguel.torres@gmail.com'),
(9, 'Laura', 'Diaz', 55667788, 'Calle 10 #123, Ciudad', 567890123, 'laura.diaz@gmail.com'),
(10, 'Pedro', 'Lopez', 66778899, 'Carrera 20 #456, Ciudad', 678901234, 'pedro.lopez@gmail.com'),
(11, 'Sofia', 'Sanchez', 77889900, 'Avenida Principal 789, Ciudad', 789012345, 'sofia.sanchez@gmail.com'),
(12, 'Jose', 'Morales', 88990011, 'Calle 5 #678, Ciudad', 890123456, 'jose.morales@gmail.com'),
(13, 'Andrea', 'Castro', 99001122, 'Carrera 18 #901, Ciudad', 901234567, 'andrea.castro@gmail.com'),
(14, 'David', 'Reyes', 10111213, 'Calle 15 #234, Ciudad', 123450987, 'david.reyes@gmail.com'),
(15, 'Elena', 'Ortega', 11121314, 'Avenida del Sol 567, Ciudad', 234560876, 'elena.ortega@gmail.com'),
(16, 'Jorge', 'Rios', 12131415, 'Calle 22 #890, Ciudad', 345670765, 'jorge.rios@gmail.com'),
(17, 'Monica', 'Vega', 13141516, 'Pasaje 3 #123, Ciudad', 456780654, 'monica.vega@gmail.com'),
(18, 'Ricardo', 'Herrera', 14151617, 'Calle 9 #456, Ciudad', 567890543, 'ricardo.herrera@gmail.com'),
(19, 'Gabriela', 'Mendoza', 15161718, 'Avenida Central 789, Ciudad', 678900432, 'gabriela.mendoza@gmail.com'),
(20, 'Alberto', 'Flores', 16171819, 'Carrera 7 #012, Ciudad', 789010321, 'alberto.flores@gmail.com'),
(21, 'Claudia', 'Ramos', 17181920, 'Calle 12 #345, Ciudad', 890120210, 'claudia.ramos@gmail.com'),
(22, 'Fernando', 'Silva', 18192021, 'Avenida Norte 678, Ciudad', 901230109, 'fernando.silva@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `precio` float(10,2) NOT NULL,
  `entregado` tinyint(1) NOT NULL DEFAULT 0,
  `pagado` tinyint(1) NOT NULL DEFAULT 0,
  `direccion` varchar(255) DEFAULT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `producto_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `fecha`, `precio`, `entregado`, `pagado`, `direccion`, `cliente_id`, `producto_id`) VALUES
(12, '2024-07-03', 700.00, 1, 0, 'Ciudad de la paz', 7, 22),
(13, '2024-07-01', 1000.00, 0, 0, 'Ciudad de el alto', 10, 23),
(14, '2024-07-06', 500.00, 0, 0, 'Ciudad de el alto', 20, 27),
(15, '2024-07-06', 200.00, 1, 0, 'Ciudad de el alto', 21, 30),
(16, '2024-07-03', 4000.00, 0, 0, 'Ciudad de el alto', 18, 26),
(17, '2024-07-13', 740.00, 0, 0, 'Cochabanba', 18, 26),
(18, '2024-07-28', 2045.00, 0, 1, 'Santa Cruz', 16, 26),
(19, '2024-07-01', 500.00, 1, 1, 'Tarija', 13, 28);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` float(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `categoria_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `precio`, `cantidad`, `categoria_id`) VALUES
(22, 'Anillo de oro', 'Anillo de oro de 18 quilates', 450.00, 2, 2),
(23, 'Collar', 'Collar de plata moderno', 800.00, 1, 3),
(24, 'Pulsera de diamantes', 'Pulsera con intrucciones de diamante', 3000.00, 10, 4),
(25, 'Pendientes de perlas', 'Pendientes de perlas cultivada', 200.00, 2, 4),
(26, 'Reloj de plata', 'Reloj de uso de correa', 200.00, 4, 7),
(27, 'Broche de emeraldas', 'Broche de esmeraldas naturales ', 650.00, 2, 6),
(28, 'Anillo de compromiso', 'Anillo de compromiso con diamantes', 1000.00, 1, 2),
(29, 'Collar de rubies', 'Collar de rubies con oro blaco', 2000.00, 2, 3),
(30, 'Pulsera de oro blanco', 'Pulsera elegante de oro vlanco', 950.00, 2, 4),
(31, 'Joya de mano', 'manilla de plata', 300.00, 20, 17);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id` int(11) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `producto_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_id` (`cliente_id`),
  ADD KEY `producto_id` (`producto_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoria_id` (`categoria_id`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `producto_id` (`producto_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`);

--
-- Filtros para la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD CONSTRAINT `proveedores_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
