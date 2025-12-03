CREATE TABLE IF NOT EXISTS `Facturas` (
	`id_factura` int AUTO_INCREMENT NOT NULL UNIQUE,
	`Letra` char(255) NOT NULL,
	`Numero` int NOT NULL,
	`id_diente` int NOT NULL,
	`Fecha` date NOT NULL,
	`Monto` double NOT NULL,
	PRIMARY KEY (`id_factura`)
);

CREATE TABLE IF NOT EXISTS `Clientes` (
	`id_cliente` int AUTO_INCREMENT NOT NULL UNIQUE,
	`Nombre` varchar(25) NOT NULL,
	`Apellido` varchar(25) NOT NULL,
	`Cuit` char(16) NOT NULL,
	`Domicilio` varchar(50) NOT NULL,
	`Comentario` varchar(50) NOT NULL,
	PRIMARY KEY (`id_cliente`)
);

CREATE TABLE IF NOT EXISTS `Articulos` (
	`id_articulos` int AUTO_INCREMENT NOT NULL UNIQUE,
	`Nombre` varchar(50) NOT NULL,
	`Precio` double NOT NULL,
	`Stock` int NOT NULL,
	PRIMARY KEY (`id_articulos`)
);

CREATE TABLE IF NOT EXISTS `Detalle` (
	`id_detalle` int AUTO_INCREMENT NOT NULL UNIQUE,
	`id_factura` int NOT NULL,
	`id_articulos` int NOT NULL,
	`Cantidad` int NOT NULL,
	PRIMARY KEY (`id_detalle`)
);

ALTER TABLE `Facturas` ADD CONSTRAINT `Facturas_fk3` FOREIGN KEY (`id_diente`) REFERENCES `Clientes`(`id_cliente`);


ALTER TABLE `Detalle` ADD CONSTRAINT `Detalle_fk1` FOREIGN KEY (`id_factura`) REFERENCES `Facturas`(`id_factura`);

ALTER TABLE `Detalle` ADD CONSTRAINT `Detalle_fk2` FOREIGN KEY (`id_articulos`) REFERENCES `Articulos`(`id_articulos`);