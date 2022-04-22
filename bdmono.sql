
-- Bancos


CREATE TABLE `bancos` (
  `idBanco` int(11) NOT NULL,
  `nombre` int(11) NOT NULL,
  `descripcion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Truncar tablas antes de insertar `bancos`
--

TRUNCATE TABLE `bancos`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idCategoria` int(11) NOT NULL,
  `nombre` int(11) NOT NULL,
  `descripcion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Truncar tablas antes de insertar `categoria`
--

TRUNCATE TABLE `categoria`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE `ciudad` (
  `idPais` char(3) NOT NULL,
  `idCiudad` char(3) NOT NULL,
  `singla` varchar(10) NOT NULL,
  `nombre` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Truncar tablas antes de insertar `ciudad`
--

TRUNCATE TABLE `ciudad`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `idEmpleado` int(11) NOT NULL,
  `doc` varchar(12) NOT NULL,
  `idEmpresa` int(4) NOT NULL,
  `tratamiento` int(11) NOT NULL,
  `direccion` int(11) NOT NULL,
  `barrio` int(11) NOT NULL,
  `pais` char(3) NOT NULL,
  `ciudad` int(11) NOT NULL,
  `telefono` int(11) NOT NULL,
  `celular` int(11) NOT NULL,
  `correo` int(11) NOT NULL,
  `profesion` int(11) NOT NULL,
  `fechaCreacion` int(11) NOT NULL,
  `fechaRetiro` int(11) NOT NULL,
  `estadoEmpleado` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Truncar tablas antes de insertar `empleados`
--

TRUNCATE TABLE `empleados`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `idEmpresa` int(4) NOT NULL,
  `idCategoria` int(11) NOT NULL,
  `nit1` int(11) NOT NULL,
  `nit2` int(11) NOT NULL,
  `nombre1` int(11) NOT NULL,
  `nombre2` int(11) NOT NULL,
  `direccion1` int(11) NOT NULL,
  `direccion2` int(11) NOT NULL,
  `barrio` int(11) NOT NULL,
  `pais` char(3) NOT NULL,
  `ciudad` char(3) NOT NULL,
  `telefono` int(11) NOT NULL,
  `celular` int(11) NOT NULL,
  `correo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Truncar tablas antes de insertar `empresa`
--

TRUNCATE TABLE `empresa`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa_bancos`
--

CREATE TABLE `empresa_bancos` (
  `id` int(11) NOT NULL,
  `idEmpresa` int(11) NOT NULL,
  `idBanco` int(11) NOT NULL,
  `noCuenta` int(11) NOT NULL,
  `tipoCuenta` int(11) NOT NULL,
  `nombrePropietario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Truncar tablas antes de insertar `empresa_bancos`
--

TRUNCATE TABLE `empresa_bancos`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `idEstados` int(3) NOT NULL,
  `nombre` int(11) NOT NULL,
  `descripcion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Truncar tablas antes de insertar `estados`
--

TRUNCATE TABLE `estados`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE `pais` (
  `idPais` char(3) NOT NULL,
  `sigla` varchar(10) NOT NULL,
  `nombre` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Truncar tablas antes de insertar `pais`
--

TRUNCATE TABLE `pais`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `tipoDoc` char(3) NOT NULL,
  `doc` varchar(12) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Truncar tablas antes de insertar `usuarios`
--

TRUNCATE TABLE `usuarios`;
--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bancos`
--
ALTER TABLE `bancos`
  ADD PRIMARY KEY (`idBanco`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idCategoria`);

--
-- Indices de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`idCiudad`),
  ADD KEY `idPais` (`idPais`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`idEmpleado`),
  ADD KEY `estadoEmpleado` (`estadoEmpleado`),
  ADD KEY `pais` (`pais`),
  ADD KEY `idEmpresa` (`idEmpresa`),
  ADD KEY `doc` (`doc`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`idEmpresa`),
  ADD KEY `idCategoria` (`idCategoria`),
  ADD KEY `ciudad` (`ciudad`),
  ADD KEY `pais` (`pais`);

--
-- Indices de la tabla `empresa_bancos`
--
ALTER TABLE `empresa_bancos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idEmpresa` (`idEmpresa`),
  ADD KEY `idBanco` (`idBanco`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`idEstados`);

--
-- Indices de la tabla `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`idPais`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`doc`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `idEstados` int(3) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD CONSTRAINT `ciudad_ibfk_1` FOREIGN KEY (`idPais`) REFERENCES `pais` (`idPais`);

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`estadoEmpleado`) REFERENCES `estados` (`idEstados`),
  ADD CONSTRAINT `empleados_ibfk_2` FOREIGN KEY (`pais`) REFERENCES `pais` (`idPais`),
  ADD CONSTRAINT `empleados_ibfk_3` FOREIGN KEY (`idEmpresa`) REFERENCES `empresa` (`idEmpresa`),
  ADD CONSTRAINT `empleados_ibfk_4` FOREIGN KEY (`doc`) REFERENCES `usuarios` (`doc`);

--
-- Filtros para la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD CONSTRAINT `empresa_ibfk_1` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`),
  ADD CONSTRAINT `empresa_ibfk_2` FOREIGN KEY (`ciudad`) REFERENCES `ciudad` (`idCiudad`),
  ADD CONSTRAINT `empresa_ibfk_3` FOREIGN KEY (`pais`) REFERENCES `pais` (`idPais`);

--
-- Filtros para la tabla `empresa_bancos`
--
ALTER TABLE `empresa_bancos`
  ADD CONSTRAINT `empresa_bancos_ibfk_1` FOREIGN KEY (`idEmpresa`) REFERENCES `empresa` (`idEmpresa`),
  ADD CONSTRAINT `empresa_bancos_ibfk_2` FOREIGN KEY (`idBanco`) REFERENCES `bancos` (`idBanco`);
SET FOREIGN_KEY_CHECKS=1;
COMMIT;