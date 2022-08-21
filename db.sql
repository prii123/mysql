CREATE TABLE `detalle_retencion` (
  `id` int NOT NULL,
  `id_tipo_retencion` int NOT NULL,
  `idEmpresa` int NOT NULL,
  `idDocumento` int NOT NULL,
  `periodo` varchar(10) NOT NULL,
  `base` int NOT NULL,
  `valor` int NOT NULL
);

CREATE TABLE `documento` (
  `id` int NOT NULL,
  `idEmpresa` int NOT NULL,
  `nit` varchar(50) DEFAULT NULL,
  `razonSocial` varchar(200) DEFAULT NULL,
  `numeroDoc` int DEFAULT NULL,
  `tipoDoc` int DEFAULT NULL,
  `numeroFE` varchar(200) DEFAULT NULL,
  `valorNeto` int DEFAULT NULL,
  `impuesto` int DEFAULT NULL,
  `reteFuente` int DEFAULT NULL,
  `reteIva` int DEFAULT NULL,
  `periodo` varchar(10) DEFAULT NULL,
  `hallazgo` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `empresas` (
  `id` int NOT NULL,
  `creadorId` int NOT NULL,
  `nit` varchar(50) DEFAULT NULL,
  `digitoVerificacion` varchar(5) DEFAULT NULL,
  `razonSocial` varchar(200) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `ciudad` varchar(50) DEFAULT NULL,
  `autorrenta` float NOT NULL,
  `logo` varchar(200) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `hallazgoz_y_correcciones` (
  `id` int NOT NULL,
  `idDocumento` int DEFAULT NULL,
  `id_tipo_documento` int DEFAULT NULL,
  `hallazgo` varchar(600) NOT NULL,
  `accionCorrectiva` varchar(600) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `idEmpresa` int DEFAULT NULL,
  `periodo` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `informedeauditoria` (
  `id` int NOT NULL,
  `idEmpresa` int NOT NULL,
  `tipoDoc` int NOT NULL,
  `idCreador` int NOT NULL,
  `periodo` varchar(10) NOT NULL,
  `valMax` int NOT NULL,
  `valMin` int NOT NULL
);

CREATE TABLE `tipo_documentos` (
  `id` int NOT NULL,
  `nombre` varchar(50) NOT NULL
);


CREATE TABLE `tipo_retencion` (
  `id` int NOT NULL,
  `concepto` varchar(100) NOT NULL
);

CREATE TABLE `tipo_roles` (
  `id` int NOT NULL,
  `nombre_rol` varchar(100) NOT NULL
);

CREATE TABLE `totales_retencion` (
  `id` int NOT NULL,
  `idEmpresa` int NOT NULL,
  `periodo` varchar(10) NOT NULL,
  `id_tipo_retencion` int NOT NULL,
  `base` int NOT NULL,
  `valor` int NOT NULL
);

CREATE TABLE `usuarios` (
  `id` int NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `username` varchar(200) NOT NULL,
  `image_url` text,
  `idRol` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE `detalle_retencion`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idDocumento` (`idDocumento`),
  ADD KEY `id_tipo_retencion` (`id_tipo_retencion`),
  ADD KEY `idEmpresa` (`idEmpresa`);

  ALTER TABLE `documento`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `idEmpresa_idx` (`idEmpresa`),
  ADD KEY `tipoDoc` (`tipoDoc`),
  ADD KEY `id` (`id`);

  ALTER TABLE `empresas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `creadorId_idx` (`creadorId`);

  ALTER TABLE `hallazgoz_y_correcciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`idDocumento`),
  ADD KEY `tipo_documentos` (`id_tipo_documento`),
  ADD KEY `idEmpresa` (`idEmpresa`);

  ALTER TABLE `informedeauditoria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tipoDoc` (`tipoDoc`),
  ADD KEY `idEmpresa` (`idEmpresa`),
  ADD KEY `idUsuario` (`idCreador`);

  ALTER TABLE `tipo_documentos`
  ADD PRIMARY KEY (`id`);

  ALTER TABLE `tipo_retencion`
  ADD PRIMARY KEY (`id`);

  ALTER TABLE `tipo_roles`
  ADD PRIMARY KEY (`id`);

  ALTER TABLE `totales_retencion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idEmpresa` (`idEmpresa`),
  ADD KEY `id_tipo_retencion` (`id_tipo_retencion`);

  ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idRol` (`idRol`);
