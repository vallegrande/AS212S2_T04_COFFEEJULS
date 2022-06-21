/*IMPORTAR AL MYSQL DE FORMA DIRECTA*/
CREATE TABLE dbrestaurante;
USE dbrestaurante;

/*EXPORTADO DESDE MYSQL*/

CREATE TABLE `pedido` (
  `IDPED` int(11) NOT NULL,
  `USERPED` varchar(80) DEFAULT NULL,
  `APETRA` varchar(60) NOT NULL,
  `EMAUSPED` varchar(80) DEFAULT NULL,
  `CELUSPED` char(9) DEFAULT NULL,
  `FOODPED` varchar(80) DEFAULT NULL,
  `DIRPED` varchar(80) NOT NULL,
  `MSGPED` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


 /*Datos creados anteriormente, solo sirven para comprobar*/


INSERT INTO `pedido` (`IDPED`, `USERPED`, `APETRA`, `EMAUSPED`, `CELUSPED`, `FOODPED`, `DIRPED`, `MSGPED`) VALUES
(1, 'José Ramírez', '', 'jose.ramirez@outlook.com', '974815236', 'Arroz con Pollo', '', 'Por favor enviar a la dirección Av. Miraflores 253, San Vicente de Cañete'),
(2, 'Ana Guerra Solano', '', 'ana.guerra@gmail.com', '981526321', 'Sopa Seca de Gallina', '', 'Necesito 4 platos'),
(3, '4', '', '4', '4', '4', '', '4'),
(4, 'Angelo', '', 'test@Vallegrande.edu.pe', '987654321', 'TestConct', '', 'MensajeTest'),
(5, 'tester', '', 'tester@ValleGrande.com', '987654321', '12345678', 'testerMsj', 'testerMsj'),
(6, 'tester2', '', 'tester2@ValleGrande.com', '987654321', '12345678', 'testerDir2', 'tester2Msj'),
(7, 'tester3', '', 'tester3@ValleGrande.com', '987654321', '12345678', 'testerDir3', 'tester3msj'),
(8, 'TESTERB', 'APEtester', 'tester@ValleGrande.com', '987654321', '87654321', 'San Vicente de Cañete', 'TESTER MSJ');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`IDPED`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `IDPED` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
