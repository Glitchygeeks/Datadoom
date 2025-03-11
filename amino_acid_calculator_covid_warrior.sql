-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: amino_acid_calculator
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `covid_warrior`
--

DROP TABLE IF EXISTS `covid_warrior`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `covid_warrior` (
  `codon` varchar(250) NOT NULL,
  `amino_acid` varchar(250) NOT NULL,
  PRIMARY KEY (`codon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `covid_warrior`
--

LOCK TABLES `covid_warrior` WRITE;
/*!40000 ALTER TABLE `covid_warrior` DISABLE KEYS */;
INSERT INTO `covid_warrior` VALUES ('AAA','Lysine'),('AAC','Asparigine'),('AAG','Lysine'),('AAU','Asparigine'),('ACA','Threonine'),('ACC','Threonine'),('ACG','Threonine'),('ACU','Threonine'),('AGA','Arginine'),('AGC','Serine'),('AGG','Arginine'),('AGU','Serine'),('AUA','Isoleucine'),('AUC','Isoleucine'),('AUG','Methionine(start)'),('AUU','Isoleucine'),('CAA','Glutamine'),('CAC','Histidine'),('CAG','Glutamine'),('CAU','Histidine'),('CCA','Proline'),('CCC','Proline'),('CCG','Proline'),('CCU','Proline'),('CGA','Arginine'),('CGC','Arginine'),('CGG','Arginine'),('CGU','Arginine'),('CUA','Leucine'),('CUC','Leucine'),('CUG','Leucine'),('CUU','Leucine'),('GAA','Glutamic acid'),('GAC','Aspartic acid'),('GAG','Glutamic acid'),('GAU','Aspartic acid'),('GCA','Alanine'),('GCC','Alanine'),('GCG','Alanine'),('GCU','Alanine'),('GGA','Glycine'),('GGC','Glycine'),('GGG','Glycine'),('GGU','Glycine'),('GUA','Valine'),('GUC','Valine'),('GUG','Valine'),('GUU','Valine'),('UAA','Stop(ochre)'),('UAC','Tryptophan'),('UAG','Stop(amber)'),('UAU','Tryptophan'),('UCA','Serine'),('UCC','Serine'),('UCG','Serine'),('UCU','Serine'),('UGA','Stop(opal)'),('UGC','Cysteine'),('UGG','Tryptophan'),('UGU','Cysteine'),('UUA','Leucine'),('UUC','Phenylalanine'),('UUG','Leucine'),('UUU','Phenylalanine');
/*!40000 ALTER TABLE `covid_warrior` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-20  2:27:47
