CREATE DATABASE bienesraices_crud;
USE bienesraices_crud;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: bienesraices_crud
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `propiedades`
--

DROP TABLE IF EXISTS `propiedades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propiedades` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `imagen` varchar(200) DEFAULT NULL,
  `descripcion` longtext,
  `habitaciones` int DEFAULT NULL,
  `wc` int DEFAULT NULL,
  `estacionamiento` int DEFAULT NULL,
  `creado` date DEFAULT NULL,
  `vendedores_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_propiedades_vendedores_idx` (`vendedores_id`),
  CONSTRAINT `fk_propiedades_vendedores` FOREIGN KEY (`vendedores_id`) REFERENCES `vendedores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propiedades`
--

LOCK TABLES `propiedades` WRITE;
/*!40000 ALTER TABLE `propiedades` DISABLE KEYS */;
INSERT INTO `propiedades` VALUES (12,'Casa en la playa en oferta',2000000.00,'e1a6446c3250d504ee5923500b9300bb.jpg','casa muy bonita y grande, ideal para ti que buscas un sitio comodo y funcional.',2,3,2,'2023-09-10',7),(13,'Casa en la playa',2000000.00,'1e306bdb147fdc0b88e102a594aae284.jpg','casa muy bonita y grande, ideal para ti que buscas un sitio comodo y funcional.',2,3,2,'2023-09-10',1),(14,'Vivienda Nueva',1200000.00,'c70aad9a6210f40df9a4df0fb87cac47.jpg','Vivamus quis dapibus ipsum. Curabitur vel lorem non sapien lacinia malesuada eu et metus. Etiam euismod ipsum eu enim vestibulum sagittis. Etiam consectetur gravida vehicula. Nulla condimentum, dolor in tincidunt hendrerit, nulla nisl sagittis neque, eget hendrerit turpis tortor non purus. Nulla iaculis elit non nibh blandit bibendum. Nullam sed pulvinar diam. Morbi consectetur sem nec arcu consectetur pharetra. Integer ullamcorper enim sit amet tellus pulvinar condimentum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin sed justo at purus fringilla tristique eu eget eros. Morbi mattis nec est eu ultrices. Curabitur accumsan, metus tristique rhoncus volutpat, augue felis sodales ligula, ut feugiat nibh odio sit amet libero.\r\n\r\n\r\nVivamus quis dapibus ipsum. Curabitur vel lorem non sapien lacinia malesuada eu et metus. Etiam euismod ipsum eu enim vestibulum sagittis. Etiam consectetur gravida vehicula. Nulla condimentum, dolor in tincidunt hendrerit, nulla nisl sagittis neque, eget hendrerit turpis tortor non purus. Nulla iaculis elit non nibh blandit bibendum. Nullam sed pulvinar diam. Morbi consectetur sem nec arcu consectetur pharetra. Integer ullamcorper enim sit amet tellus pulvinar condimentum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin sed justo at purus fringilla tristique eu eget eros. Morbi mattis nec est eu ultrices. Curabitur accumsan, metus tristique rhoncus volutpat, augue felis sodales ligula, ut feugiat nibh odio sit amet libero.',2,2,2,'2023-09-10',2),(16,'Vivienda Nueva',3000000.00,'de98e3f499b1d8cb129619e06ccdfd88.jpg','Ut vel mauris urna. Fusce vehicula condimentum augue sit amet vehicula. Etiam convallis ex orci, ac varius enim finibus non. Aenean cursus, sapien id pulvinar auctor, neque mauris rutrum purus, vitae dapibus leo tortor in ligula. Vestibulum quis posuere leo. Pellentesque egestas commodo nisi, quis bibendum mi accumsan nec. Vestibulum mauris nisl, auctor at ligula vitae, congue posuere enim. Curabitur lectus urna, consectetur vehicula euismod at, facilisis eu dolor. Nullam porttitor lacinia dictum. Vivamus ornare dolor eleifend, vehicula metus sit amet, auctor leo. Donec dignissim blandit massa, fermentum cursus nisi cursus ut. Vivamus lacinia eleifend nunc ut scelerisque.\r\n\r\nNullam venenatis accumsan tortor, sit amet dictum lectus congue id. Sed ultricies urna nibh, non blandit sapien aliquam ut. Aliquam posuere finibus augue, vel fermentum sem placerat vitae. Nullam urna nunc, fringilla auctor molestie a, ultrices a sem. Curabitur tincidunt erat placerat felis tincidunt egestas. Nam sit amet nunc mauris. Fusce convallis commodo diam, ac dictum nibh consectetur quis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Mauris malesuada finibus ligula, sit amet mattis nunc cursus vel.',2,2,2,'2023-09-10',2),(18,'Casa Moderna',1212333.00,'5d237a1bdb1cde76cc6dcaea9b9b008b.jpg','Ut vel mauris urna. Fusce vehicula condimentum augue sit amet vehicula. Etiam convallis ex orci, ac varius enim finibus non. Aenean cursus, sapien id pulvinar auctor, neque mauris rutrum purus, vitae dapibus leo tortor in ligula. Vestibulum quis posuere leo. Pellentesque egestas commodo nisi, quis bibendum mi accumsan nec. Vestibulum mauris nisl, auctor at ligula vitae, congue posuere enim. Curabitur lectus urna, consectetur vehicula euismod at, facilisis eu dolor. Nullam porttitor lacinia dictum. Vivamus ornare dolor eleifend, vehicula metus sit amet, auctor leo. Donec dignissim blandit massa, fermentum cursus nisi cursus ut. Vivamus lacinia eleifend nunc ut scelerisque.\r\n\r\nNullam venenatis accumsan tortor, sit amet dictum lectus congue id. Sed ultricies urna nibh, non blandit sapien aliquam ut. Aliquam posuere finibus augue, vel fermentum sem placerat vitae. Nullam urna nunc, fringilla auctor molestie a, ultrices a sem. Curabitur tincidunt erat placerat felis tincidunt egestas. Nam sit amet nunc mauris. Fusce convallis commodo diam, ac dictum nibh consectetur quis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Mauris malesuada finibus ligula, sit amet mattis nunc cursus vel.',2,1,3,'2023-09-10',1),(26,' Hermosa casa en la playa',3200000.00,'2cd86a39b0749a7567f7f58c143cd703.jpg','Ut vel mauris urna. Fusce vehicula condimentum augue sit amet vehicula. Etiam convallis ex orci, ac varius enim finibus non. Aenean cursus, sapien id pulvinar auctor, neque mauris rutrum purus, vitae dapibus leo tortor in ligula. Vestibulum quis posuere leo. Pellentesque egestas commodo nisi, quis bibendum mi accumsan nec. Vestibulum mauris nisl, auctor at ligula vitae, congue posuere enim. Curabitur lectus urna, consectetur vehicula euismod at, facilisis eu dolor. Nullam porttitor lacinia dictum. Vivamus ornare dolor eleifend, vehicula metus sit amet, auctor leo. Donec dignissim blandit massa, fermentum cursus nisi cursus ut. Vivamus lacinia eleifend nunc ut scelerisque.\r\n\r\nNullam venenatis accumsan tortor, sit amet dictum lectus congue id. Sed ultricies urna nibh, non blandit sapien aliquam ut. Aliquam posuere finibus augue, vel fermentum sem placerat vitae. Nullam urna nunc, fringilla auctor molestie a, ultrices a sem. Curabitur tincidunt erat placerat felis tincidunt egestas. Nam sit amet nunc mauris. Fusce convallis commodo diam, ac dictum nibh consectetur quis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Mauris malesuada finibus ligula, sit amet mattis nunc cursus vel.\r\n',3,2,2,'2024-01-23',1),(29,' Vivienda Nueva ',135333.00,'148eb685e506d2b186a8c7aef927260e.jpg','jkñnhijpjkñnhijpjkñnhijpjkñnhijpjkñnhijpjkñnhijpjkñnhijpjkñnhijpjkñnhijpjkñnhijpjkñnhijpjkñnhijpjkñnhijpjkñnhijpjkñnhijpjkñnhijp',3,2,2,'2024-01-24',1),(32,' Propiedad en la playa muy bonita',123444.00,'98dae46ca017e2e1034d93c9c29644da.jpg','Bella propiedad Bella propiedadBella propiedadBella propiedadBella propiedadBella propiedadBella propiedadBella propiedadBella propiedadBella propiedadBella propiedad',3,2,2,'2024-01-26',1);
/*!40000 ALTER TABLE `propiedades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(50) DEFAULT NULL,
  `password` char(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (2,'raquelalvarado1717@gmail.com','$2y$10$zTTTrgICN3KUy8bwZQtaHOG6sVsNzyaVNFcXEesbaiP/Z7C/uvh0a');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedores`
--

DROP TABLE IF EXISTS `vendedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `telefono` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedores`
--

LOCK TABLES `vendedores` WRITE;
/*!40000 ALTER TABLE `vendedores` DISABLE KEYS */;
INSERT INTO `vendedores` VALUES (1,'Kevin','Diaz','33389893'),(2,'Raquel','Alvarado','23242522'),(3,'Sofia','Castro','23242424'),(5,' Eduar','Colindres','33309930 '),(7,' Juana','Martinez','33708989 ');
/*!40000 ALTER TABLE `vendedores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-22 18:48:15
