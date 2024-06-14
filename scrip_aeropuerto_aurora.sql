CREATE DATABASE aeropuerto_maya;
USE aeropuerto_maya;

CREATE TABLE `boletos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `numero_boleto` varchar(20) NOT NULL,
  `nombre` int DEFAULT NULL,
  `no_vuelo` int DEFAULT NULL,
  `no_asiento` varchar(10) NOT NULL,
  `codigo_reservacion` varchar(50) NOT NULL,
  `hora_abordaje` time NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numero_boleto` (`numero_boleto`),
  UNIQUE KEY `codigo_reservacion` (`codigo_reservacion`),
  KEY `no_vuelo` (`no_vuelo`),
  KEY `boletos_ibfk_1` (`nombre`),
  CONSTRAINT `boletos_ibfk_2` FOREIGN KEY (`no_vuelo`) REFERENCES `vuelos` (`id`) ON DELETE CASCADE
);

CREATE TABLE `pasajeros` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `edad` int DEFAULT NULL,
  `identificacion` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `no_identificacion` (`identificacion`),
  CONSTRAINT `pasajeros_chk_1` CHECK (((`edad` >= 0) and (`edad` <= 120)))
);

CREATE TABLE `vuelos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_vuelo` varchar(20) NOT NULL,
  `nombre_aerolinea` varchar(100) NOT NULL,
  `origen` varchar(100) NOT NULL,
  `destino` varchar(100) NOT NULL,
  `fecha_vuelo` date NOT NULL,
  `hora_salida` time NOT NULL,
  `hora_aterrizaje` time NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `no_vuelo` (`no_vuelo`),
  CONSTRAINT `vuelos_chk_1` CHECK ((`hora_aterrizaje` > `Hora_salida`))
);