CREATE TABLE IF NOT EXISTS `Cliente` (
	`id_cliente` int AUTO_INCREMENT NOT NULL UNIQUE,
	`Nombre` varchar(50) NOT NULL,
	`Apellido` varchar(50) NOT NULL,
	`Fecha_Nacimiento` date NOT NULL,
	`Direccion` varchar(255) NOT NULL,
	`localidad` int NOT NULL,
	`telefono` varchar(255) NOT NULL,
	PRIMARY KEY (`id_cliente`)
);

CREATE TABLE IF NOT EXISTS `Localidad` (
	`id_localidad` int AUTO_INCREMENT NOT NULL UNIQUE,
	`Provincia` int NOT NULL,
	`CP` varchar(255) NOT NULL,
	`Nombre` varchar(255) NOT NULL,
	PRIMARY KEY (`id_localidad`)
);

CREATE TABLE IF NOT EXISTS `Movimiento` (
	`id_movimiento` int AUTO_INCREMENT NOT NULL UNIQUE,
	`Fecha` date NOT NULL,
	`Cliente` int NOT NULL,
	`Letra` varchar(255) NOT NULL,
	PRIMARY KEY (`id_movimiento`)
);

CREATE TABLE IF NOT EXISTS `Item` (
	`id_item` int AUTO_INCREMENT NOT NULL UNIQUE,
	`Valor` decimal(10,0) NOT NULL,
	`Cantidad` int NOT NULL,
	`Detalle` varchar(255) NOT NULL,
	`Movimiento` int NOT NULL,
	PRIMARY KEY (`id_item`)
);

CREATE TABLE IF NOT EXISTS `Provincia` (
	`id_provincia` int AUTO_INCREMENT NOT NULL UNIQUE,
	`Pais` varchar(255) NOT NULL,
	`Nombre` varchar(255) NOT NULL,
	PRIMARY KEY (`id_provincia`)
);

ALTER TABLE `Cliente` ADD CONSTRAINT `Cliente_fk5` FOREIGN KEY (`localidad`) REFERENCES `Localidad`(`id_localidad`);
ALTER TABLE `Localidad` ADD CONSTRAINT `Localidad_fk1` FOREIGN KEY (`Provincia`) REFERENCES `Provincia`(`id_provincia`);
ALTER TABLE `Movimiento` ADD CONSTRAINT `Movimiento_fk2` FOREIGN KEY (`Cliente`) REFERENCES `Cliente`(`id_cliente`);
ALTER TABLE `Item` ADD CONSTRAINT `Item_fk4` FOREIGN KEY (`Movimiento`) REFERENCES `Movimiento`(`id_movimiento`);
