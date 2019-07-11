-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.1.38-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para dbcompania
CREATE DATABASE IF NOT EXISTS `dbcompania` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `dbcompania`;

-- Volcando estructura para tabla dbcompania.empleados
CREATE TABLE IF NOT EXISTS `empleados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `salario` float(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla dbcompania.empleados: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
REPLACE INTO `empleados` (`id`, `nombre`, `salario`) VALUES
	(1, 'Manuel Ramirez', 6000.00),
	(2, 'Mayerlin Carpio', 4000.00),
	(4, 'Jose Manuel Ramirez', 5000.00);
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;

-- Volcando estructura para procedimiento dbcompania.empleado_Editar_Agregar
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `empleado_Editar_Agregar`(
	IN `_id` INT,
	IN `_nombre` VARCHAR(50),
	IN `_salario` FLOAT

)
BEGIN
	IF _id = 0 THEN
		INSERT INTO empleados (nombre,salario) VALUES (_nombre,_salario);
		SET _id = LAST_INSERT_ID();
	ELSE
		UPDATE empleados SET nombre = _nombre, salario = _salario WHERE id = _id;
	END IF;
	
	SELECT _id as id;
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
