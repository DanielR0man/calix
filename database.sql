-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: piq
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `adicional`
--

DROP TABLE IF EXISTS `adicional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adicional` (
  `id_adicional` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_adicional`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adicional`
--

LOCK TABLES `adicional` WRITE;
/*!40000 ALTER TABLE `adicional` DISABLE KEYS */;
/*!40000 ALTER TABLE `adicional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrador`
--

DROP TABLE IF EXISTS `administrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrador` (
  `id_administrador` int NOT NULL AUTO_INCREMENT,
  `correo` varchar(150) NOT NULL,
  `clave` varchar(80) NOT NULL,
  PRIMARY KEY (`id_administrador`),
  UNIQUE KEY `correo_UNIQUE` (`correo`),
  UNIQUE KEY `clave_UNIQUE` (`clave`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador`
--

LOCK TABLES `administrador` WRITE;
/*!40000 ALTER TABLE `administrador` DISABLE KEYS */;
/*!40000 ALTER TABLE `administrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id_categoria` int NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Comida','Hamburguesa'),(2,'Bebida','Bebida'),(3,'Saludable','Saludable'),(4,'Prueba','Prueba descripcion');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `documento` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `clave` varchar(60) NOT NULL,
  `celular` varchar(45) NOT NULL,
  `direccion` int NOT NULL,
  PRIMARY KEY (`documento`),
  UNIQUE KEY `correo_UNIQUE` (`correo`),
  KEY `direccionfk_cliente_idx` (`direccion`),
  CONSTRAINT `direccionfk_cliente` FOREIGN KEY (`direccion`) REFERENCES `direccion` (`id_direccion`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('1192769417','Yeison Alexander','Soto Serrano','yeisona03237@hotmail.com','123','12321',3),('1231','yo','Soto Serrano','adsad@hotmail.com','123','1231',2),('12345678901','test','test','test@hotmail.com','0707','300040405',4);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra` (
  `id_compra` int NOT NULL,
  `cantidad` int DEFAULT NULL,
  `producto` int NOT NULL,
  `cliente` varchar(45) NOT NULL,
  `factura` int NOT NULL,
  PRIMARY KEY (`id_compra`),
  KEY `fk_compra_producto1_idx` (`producto`),
  KEY `fk_compra_cliente1_idx` (`cliente`),
  KEY `fk_compra_factura1_idx` (`factura`),
  CONSTRAINT `fk_compra_cliente1` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`documento`),
  CONSTRAINT `fk_compra_factura1` FOREIGN KEY (`factura`) REFERENCES `factura` (`id_factura`),
  CONSTRAINT `fk_compra_producto1` FOREIGN KEY (`producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra_adicional`
--

DROP TABLE IF EXISTS `compra_adicional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra_adicional` (
  `compra` int NOT NULL,
  `adicional` int NOT NULL,
  PRIMARY KEY (`compra`,`adicional`),
  KEY `fk_compra_has_adicionales_adicionales1_idx` (`adicional`),
  KEY `fk_compra_has_adicionales_compra1_idx` (`compra`),
  CONSTRAINT `fk_compra_has_adicionales_adicionales1` FOREIGN KEY (`adicional`) REFERENCES `adicional` (`id_adicional`),
  CONSTRAINT `fk_compra_has_adicionales_compra1` FOREIGN KEY (`compra`) REFERENCES `compra` (`id_compra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_adicional`
--

LOCK TABLES `compra_adicional` WRITE;
/*!40000 ALTER TABLE `compra_adicional` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra_adicional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direccion`
--

DROP TABLE IF EXISTS `direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direccion` (
  `id_direccion` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id_direccion`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccion`
--

LOCK TABLES `direccion` WRITE;
/*!40000 ALTER TABLE `direccion` DISABLE KEYS */;
INSERT INTO `direccion` VALUES (1,'cucuta'),(2,'aads'),(3,'1111'),(4,'Belen');
/*!40000 ALTER TABLE `direccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encuesta_producto`
--

DROP TABLE IF EXISTS `encuesta_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `encuesta_producto` (
  `id_encuesta_producto` int NOT NULL AUTO_INCREMENT,
  `puntaje` int DEFAULT NULL,
  `producto` int NOT NULL,
  PRIMARY KEY (`id_encuesta_producto`),
  KEY `fk_encuesta_producto_producto1_idx` (`producto`),
  CONSTRAINT `fk_encuesta_producto_producto1` FOREIGN KEY (`producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encuesta_producto`
--

LOCK TABLES `encuesta_producto` WRITE;
/*!40000 ALTER TABLE `encuesta_producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `encuesta_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encuesta_servicio`
--

DROP TABLE IF EXISTS `encuesta_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `encuesta_servicio` (
  `id_encuesta_servicio` int NOT NULL,
  `puntaje_servicio_cliente` int NOT NULL,
  `puntaje_diseno` int NOT NULL,
  PRIMARY KEY (`id_encuesta_servicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encuesta_servicio`
--

LOCK TABLES `encuesta_servicio` WRITE;
/*!40000 ALTER TABLE `encuesta_servicio` DISABLE KEYS */;
/*!40000 ALTER TABLE `encuesta_servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura` (
  `id_factura` int NOT NULL,
  `fecha` date NOT NULL,
  `total` int NOT NULL,
  PRIMARY KEY (`id_factura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id_producto` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `valor` int NOT NULL,
  `img` varchar(100) NOT NULL,
  `categoria` int NOT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `fk_producto_categoria1_idx` (`categoria`),
  CONSTRAINT `fk_producto_categoria1` FOREIGN KEY (`categoria`) REFERENCES `categoria` (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Hamburguesa ranchera','Hamburguesa ranchera con \nhuevo tocineta y queso',30000,'https://i.ibb.co/SwXT6Sr/sina-piryae-6-Xm-QV6-Gcc-YU-unsplash.jpg',1),(2,'Prueba','descri',10000,'img',2),(3,'Tacos cerdo','Tacos con carne de cerdo y limon',20000,'https://i.ibb.co/Pg4TtQT/luke-johnson-h-RRl-Dgzm-Ddo-unsplash.jpg',1),(4,'Hamburdona','Hamburguesa de tocino y carne en medio de una dona',25000,'https://i.ibb.co/87HVMpk/amirali-mirhashemian-b6b-Ya-FOPfm-I-unsplash.jpg',1),(5,'Pizza dulce','Pizza de queso con pasas y otros dulces',30000,'https://i.ibb.co/QvJ5NHw/faizan-saeed-8thte7ce-LSw-unsplash.jpg',1),(6,'Pizza napolitana','Pizza con jamon y peporina con corteza crujiente',32000,'https://i.ibb.co/WzJc9PZ/fernando-andrade-P76tr-HTWDE-unsplash.jpg',1),(7,'Ensalada mixta','Ensalada con varias verduras  ',18000,'https://i.ibb.co/2qvvkjh/sina-piryae-b-Bzj-Wth-Tqb8-unsplash.jpg',1);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-16 10:51:11
