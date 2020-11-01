-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: studio_arkadia_db
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `areacompetenza`
--

DROP TABLE IF EXISTS `areacompetenza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `areacompetenza` (
  `Piva` char(11) DEFAULT NULL,
  `CodCategoria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `areacompetenza`
--

LOCK TABLES `areacompetenza` WRITE;
/*!40000 ALTER TABLE `areacompetenza` DISABLE KEYS */;
INSERT INTO `areacompetenza` VALUES ('16428749497',6),('16428749497',3),('16428749497',4),('11134567654',1),('48248092390',2),('74922093111',5),('74922093111',7),('74922093111',8),('12749479271',1),('12749479271',2);
/*!40000 ALTER TABLE `areacompetenza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoriacollaboratore`
--

DROP TABLE IF EXISTS `categoriacollaboratore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoriacollaboratore` (
  `CodCategoria` int(11) NOT NULL,
  `Nome` varchar(40) NOT NULL,
  `Descrizione` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`CodCategoria`),
  CONSTRAINT `categoriacollaboratore_chk_1` CHECK ((`CodCategoria` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoriacollaboratore`
--

LOCK TABLES `categoriacollaboratore` WRITE;
/*!40000 ALTER TABLE `categoriacollaboratore` DISABLE KEYS */;
INSERT INTO `categoriacollaboratore` VALUES (1,'hw development','soluzioni eletroniche per device'),(2,'sw dev','servizi di software development'),(3,'fresa 6 assi','servizi di fresa a 6 assi'),(4,'fresa 3 assi','servizi di fresa a 3 assi'),(5,'prototipi','servizi di prototipaggio'),(6,'Taglio Laser','servizi di taglio materiale al laser'),(7,'verniciatura','servizi di verniciatura'),(8,'saldatura','servizi di saldatura'),(9,'rendering','servizi di rendering'),(10,'analista','analista grafico'),(11,'stampa','servizi di stampa');
/*!40000 ALTER TABLE `categoriacollaboratore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `CodPar` varchar(16) NOT NULL,
  `Pec` varchar(50) DEFAULT NULL,
  `NomeReferente` varchar(40) DEFAULT NULL,
  `Iban` char(27) DEFAULT NULL,
  `Nome` varchar(40) NOT NULL,
  PRIMARY KEY (`CodPar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('07843521001','infodesign@pec.it','Andrea',NULL,'DesignDreams s.r.l.'),('07844441671','infoStudioCAD@pec.it','Leonardo',NULL,'CADdesign s.r.l.'),('09993261688','infoTaglioLaser@pec.it','Filippo',NULL,'Taglio laser s.r.l.'),('GFFFLD97B18Z199D',NULL,NULL,'IT94I0034619788907562877111','Gianluigi Visconti'),('GNGGZS38R47L319E','gianluca1@pec.it',NULL,'IT94I0000501333243472855783','Gianluca'),('LDDDLD97B18Z199D',NULL,NULL,'IT94I0300203288907562877292','Deluca'),('LPADLD98B19Z100D',NULL,NULL,'IT94I0300203280743472877299','Denaldo'),('SCGGZS38R47L319E','luca123@pec.it',NULL,'IT94I0000501260243472866288','Luca'),('WLLMZS38R47L319E','william1@pec.it',NULL,'IT94I0000501333243472865555','William Zappa');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collaboratore`
--

DROP TABLE IF EXISTS `collaboratore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collaboratore` (
  `Piva` char(11) NOT NULL,
  `CodFiscale` varchar(16) DEFAULT NULL,
  `Nome` varchar(40) NOT NULL,
  `Pec` varchar(50) DEFAULT NULL,
  `Iban` char(27) NOT NULL,
  `NomeReferente` varchar(40) DEFAULT NULL,
  `GiorniRitardo` int(11) NOT NULL DEFAULT '0',
  `NumCollaborazioni` int(11) NOT NULL DEFAULT '0',
  `CostiCollab` float(8,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`Piva`),
  CONSTRAINT `collaboratore_chk_1` CHECK ((`GiorniRitardo` >= 0)),
  CONSTRAINT `collaboratore_chk_2` CHECK ((`NumCollaborazioni` >= 0)),
  CONSTRAINT `collaboratore_chk_3` CHECK ((`CostiCollab` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collaboratore`
--

LOCK TABLES `collaboratore` WRITE;
/*!40000 ALTER TABLE `collaboratore` DISABLE KEYS */;
INSERT INTO `collaboratore` VALUES ('11134567654','11134567654','Engineering solution','engSol@pec.it','IT9273947892137892804901834','Ernesto Olmi',0,1,4000.00),('12749479271','12749479271','SW HW DEV','swhwdev@pec.it','IT9273947898924789213789834','Gino Nibbi',3,1,5000.00),('16428749497','16428749497','Taglio Laser','TagSol@pec.it','IT9273948924789213789928834','Francesco Panna',2,1,7000.00),('48248092390','48248092390','3d engine',NULL,'IT8924789213789990183400565','Filippo Unni',0,1,3000.00),('74922093111','LUGGZS38R47L319E','MontaggioPrototipi',NULL,'IT8924789213789892137899018','Luca Gino',0,3,2000.00);
/*!40000 ALTER TABLE `collaboratore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `composizione`
--

DROP TABLE IF EXISTS `composizione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `composizione` (
  `CodProgetto` int(11) NOT NULL,
  `NumeroVersione` int(11) NOT NULL,
  `NumeroRevisione` int(11) NOT NULL,
  `CodParte` int(11) NOT NULL,
  `CodVariante` int(11) NOT NULL,
  PRIMARY KEY (`CodProgetto`,`NumeroVersione`,`NumeroRevisione`,`CodParte`,`CodVariante`),
  KEY `CodParte` (`CodParte`,`CodVariante`),
  CONSTRAINT `composizione_ibfk_1` FOREIGN KEY (`CodProgetto`, `NumeroVersione`, `NumeroRevisione`) REFERENCES `revisione` (`CodProgetto`, `NumeroVersione`, `NumeroRevisione`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `composizione_ibfk_2` FOREIGN KEY (`CodParte`, `CodVariante`) REFERENCES `variante` (`CodParte`, `CodVariante`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `composizione`
--

LOCK TABLES `composizione` WRITE;
/*!40000 ALTER TABLE `composizione` DISABLE KEYS */;
INSERT INTO `composizione` VALUES (1,1,1,1,1),(1,2,2,1,1),(1,1,2,1,2),(1,1,3,1,3),(1,2,1,1,3),(1,1,1,2,1),(1,1,2,2,1),(1,2,1,2,1),(1,1,3,2,2),(1,2,2,2,3),(2,1,1,3,1),(2,1,2,3,1),(2,3,1,3,1),(2,1,3,3,2),(2,2,1,3,2),(2,1,1,4,1),(2,1,2,4,1),(2,1,3,4,1),(2,2,1,4,1),(2,3,1,4,1),(2,1,1,5,1),(2,2,1,5,1),(2,3,1,5,1),(2,1,2,5,2),(2,1,3,5,2),(3,1,1,6,1),(3,1,2,6,2),(3,1,3,6,3),(3,1,4,6,4),(3,1,5,6,5),(3,1,1,7,1),(3,1,2,7,2),(3,1,3,7,3),(3,1,4,7,3),(3,1,5,7,3),(4,1,1,8,1),(4,1,2,8,2),(4,2,1,8,3),(5,1,1,9,1),(6,1,1,10,1),(7,1,1,11,1),(9,1,1,13,1),(2,1,1,14,1),(2,1,3,14,2),(2,2,1,14,2),(2,1,2,14,4),(2,3,1,14,4);
/*!40000 ALTER TABLE `composizione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `design`
--

DROP TABLE IF EXISTS `design`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `design` (
  `CodProgetto` int(11) NOT NULL,
  PRIMARY KEY (`CodProgetto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `design`
--

LOCK TABLES `design` WRITE;
/*!40000 ALTER TABLE `design` DISABLE KEYS */;
INSERT INTO `design` VALUES (2),(3),(4),(5);
/*!40000 ALTER TABLE `design` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emailcliente`
--

DROP TABLE IF EXISTS `emailcliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emailcliente` (
  `Email` varchar(50) NOT NULL,
  `CodPar` varchar(16) NOT NULL,
  PRIMARY KEY (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emailcliente`
--

LOCK TABLES `emailcliente` WRITE;
/*!40000 ALTER TABLE `emailcliente` DISABLE KEYS */;
INSERT INTO `emailcliente` VALUES ('corona_gif_club@gmail.com','WLLMZS38R47L319E'),('deluca@gmail.com','LDDDLD97B18Z199D'),('denaldo1998@gmail.com','LPADLD98B19Z100D'),('email_1@gmail.com','GNGGZS38R47L319E'),('hobby@gmail.com','GFFFLD97B18Z199D'),('info@gmail.com','07843521001'),('leonardo@gmail.com','07844441671'),('luca_conferma_ordini@gmail.com','SCGGZS38R47L319E'),('luca@gmail.com','SCGGZS38R47L319E'),('tagliolaser_assunzioni@gmail.com','09993261688'),('tagliolaser_dipendenti@gmail.com','09993261688'),('tagliolaser_info@gmail.com','09993261688');
/*!40000 ALTER TABLE `emailcliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emailcollaboratore`
--

DROP TABLE IF EXISTS `emailcollaboratore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emailcollaboratore` (
  `Email` varchar(50) NOT NULL,
  `Piva` char(11) DEFAULT NULL,
  PRIMARY KEY (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emailcollaboratore`
--

LOCK TABLES `emailcollaboratore` WRITE;
/*!40000 ALTER TABLE `emailcollaboratore` DISABLE KEYS */;
INSERT INTO `emailcollaboratore` VALUES ('info@3dengine.com','48248092390'),('info@engSol.com','11134567654'),('info@laserBlade.com','16428749497'),('info@SW_HW_DEV.com','12749479271'),('subitoProt@gmail.com','74922093111'),('SW_HW_DEV@gmail.com','12749479271');
/*!40000 ALTER TABLE `emailcollaboratore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fatturaemessa`
--

DROP TABLE IF EXISTS `fatturaemessa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fatturaemessa` (
  `DataEmissioneFattura` date NOT NULL,
  `NumeroFattura` int(11) NOT NULL,
  `DataPagamento` date DEFAULT NULL,
  `Descrizione` varchar(300) DEFAULT NULL,
  `ImportoFattura` float(7,2) DEFAULT NULL,
  `Scadenza` date DEFAULT NULL,
  `ModalitaPagamento` varchar(20) DEFAULT NULL,
  `PathFattura` varchar(100) DEFAULT NULL,
  `CodProgetto` int(11) DEFAULT NULL,
  PRIMARY KEY (`DataEmissioneFattura`,`NumeroFattura`),
  CONSTRAINT `fatturaemessa_chk_1` CHECK ((`Numerofattura` >= 0)),
  CONSTRAINT `fatturaemessa_chk_2` CHECK ((`Importofattura` >= 0)),
  CONSTRAINT `fatturaemessa_chk_3` CHECK (((`ModalitaPagamento` = _cp850'Contanti') or (`ModalitaPagamento` = _cp850'Assegno') or (`ModalitaPagamento` = _cp850'Bonifico') or (`ModalitaPagamento` = _cp850'Altro')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fatturaemessa`
--

LOCK TABLES `fatturaemessa` WRITE;
/*!40000 ALTER TABLE `fatturaemessa` DISABLE KEYS */;
INSERT INTO `fatturaemessa` VALUES ('2013-03-25',1,'2013-03-26','Pagamento progetto Cassa Audio',4000.00,'2013-04-24','Bonifico','C:/Users/Studio/Fatture/Emesse',1),('2020-01-08',1,'2020-01-09','Pagamento intermedio progetto biglietti',3000.00,'2020-02-07','Assegno','C:/Users/Studio/Fatture/Emesse',4),('2020-01-10',1,'2020-01-10','Pagamento stampa',200.00,'2020-02-09','Contanti','C:/Users/Studio/Fatture/Emesse',6),('2020-01-10',2,'2020-01-10','Pagamento stampa',200.00,'2020-02-09','Contanti','C:/Users/Studio/Fatture/Emesse',7),('2020-01-10',3,'2020-01-10','Pagamento stampa',200.00,'2020-02-09','Contanti','C:/Users/Studio/Fatture/Emesse',8),('2020-01-10',4,'2020-01-10','Pagamento stampa',200.00,'2020-02-09','Contanti','C:/Users/Studio/Fatture/Emesse',9),('2020-01-27',1,'2020-01-28','Pagamento finale progetto biglietti',4000.00,'2020-02-26','Assegno','C:/Users/Studio/Fatture/Emesse',4);
/*!40000 ALTER TABLE `fatturaemessa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fatturainentrata`
--

DROP TABLE IF EXISTS `fatturainentrata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fatturainentrata` (
  `Piva` char(11) NOT NULL,
  `DataEmissioneFattura` date NOT NULL,
  `NumeroFattura` int(11) NOT NULL,
  `Descrizione` varchar(300) DEFAULT NULL,
  `ImportoFattura` float(7,2) DEFAULT NULL,
  `PathFattura` varchar(100) DEFAULT NULL,
  `CodProgetto` int(11) DEFAULT NULL,
  PRIMARY KEY (`Piva`,`DataEmissioneFattura`,`NumeroFattura`),
  CONSTRAINT `fatturainentrata_chk_1` CHECK ((`Numerofattura` >= 0)),
  CONSTRAINT `fatturainentrata_chk_2` CHECK ((`Importofattura` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fatturainentrata`
--

LOCK TABLES `fatturainentrata` WRITE;
/*!40000 ALTER TABLE `fatturainentrata` DISABLE KEYS */;
INSERT INTO `fatturainentrata` VALUES ('11134567654','2013-01-31',1,'Sviluppo hw',1000.00,'C:/Users/Studio/Fatture/In_Entrata',1),('48248092390','2013-02-05',3,'Sviluppo sw',1300.00,'C:/Users/Studio/Fatture/In_Entrata',1),('74922093111','2020-02-03',1,'Prototipaggio',850.00,'C:/Users/Studio/Fatture/In_Entrata',3);
/*!40000 ALTER TABLE `fatturainentrata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funzione`
--

DROP TABLE IF EXISTS `funzione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funzione` (
  `CodFunzione` int(11) NOT NULL,
  `Nome` varchar(40) NOT NULL,
  `Descrizione` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`CodFunzione`),
  CONSTRAINT `funzione_chk_1` CHECK ((`CodFunzione` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funzione`
--

LOCK TABLES `funzione` WRITE;
/*!40000 ALTER TABLE `funzione` DISABLE KEYS */;
INSERT INTO `funzione` VALUES (1,'altro','generica funzione'),(2,'massa del martello','fornisce energia cinetica per il colpo, innestata su un manico che ne consente la impugnatura'),(3,'bocca del martello','estremità del martello da battere'),(4,'manico',NULL),(5,'cassa impianto audio',NULL),(6,'ruota','ruota particolare con grip rinforzato'),(7,'volante','volante ergonomico per migliore presa'),(8,'dettagli grafici biglietto da visita','biglietto per le presentazioni e contatti'),(9,'video presentazione',NULL),(10,'impugnatura',NULL),(11,'scocca',NULL),(12,'tastierino',NULL),(13,'tappo bottiglia',NULL),(14,'corpo bottiglia',NULL),(15,'pistone',NULL);
/*!40000 ALTER TABLE `funzione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indirizzocliente`
--

DROP TABLE IF EXISTS `indirizzocliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `indirizzocliente` (
  `CodIndirizzo` int(11) NOT NULL,
  `Citta` varchar(40) NOT NULL,
  `Provincia` char(2) NOT NULL,
  `Cap` char(5) DEFAULT NULL,
  `Civico` varchar(5) NOT NULL,
  `ViaPiazza` varchar(30) NOT NULL,
  `CodPar` varchar(16) NOT NULL,
  PRIMARY KEY (`CodIndirizzo`),
  CONSTRAINT `indirizzocliente_chk_1` CHECK (((`CodIndirizzo` > 0) and ((`CodIndirizzo` % 2) = 1)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indirizzocliente`
--

LOCK TABLES `indirizzocliente` WRITE;
/*!40000 ALTER TABLE `indirizzocliente` DISABLE KEYS */;
INSERT INTO `indirizzocliente` VALUES (1,'Ancona','AN','60120','12','Via Osimo','LPADLD98B19Z100D'),(3,'Fabriano','AN','60044','120','Via Marco Polo','SCGGZS38R47L319E'),(5,'Genga','AN','60133','102','Via Togliatti','07843521001'),(7,'Firenze','FI','60177','13','Via Casoli','LDDDLD97B18Z199D'),(9,'Padova','PA','60137','17','Via Piero Ragni','GNGGZS38R47L319E'),(11,'Siena','SI','60154','18','Via Firenze','07844441671'),(13,'Palermo','PA','60789','62','Via Corso Grande','GFFFLD97B18Z199D'),(15,'Roma','RM','60853','82','Via Mercato Coperto','WLLMZS38R47L319E'),(17,'Ancona','AN','70120','92','Via dei Angeli','09993261688');
/*!40000 ALTER TABLE `indirizzocliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indirizzocollaboratore`
--

DROP TABLE IF EXISTS `indirizzocollaboratore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `indirizzocollaboratore` (
  `CodIndirizzo` int(11) NOT NULL,
  `Citta` varchar(40) NOT NULL,
  `Provincia` char(2) NOT NULL,
  `Cap` char(5) DEFAULT NULL,
  `Civico` varchar(5) NOT NULL,
  `ViaPiazza` varchar(30) NOT NULL,
  `Piva` char(11) DEFAULT NULL,
  PRIMARY KEY (`CodIndirizzo`),
  CONSTRAINT `indirizzocollaboratore_chk_1` CHECK (((`CodIndirizzo` > 0) and ((`CodIndirizzo` % 2) = 0)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indirizzocollaboratore`
--

LOCK TABLES `indirizzocollaboratore` WRITE;
/*!40000 ALTER TABLE `indirizzocollaboratore` DISABLE KEYS */;
INSERT INTO `indirizzocollaboratore` VALUES (2,'Padova','PA','60137','7','Via breccebianche','11134567654'),(4,'Siena','SI','60154','1','Via le conce','16428749497'),(6,'Verona','VR','64489','12','Via della vittoria','74922093111'),(8,'Roma','RM','60853','182','Via del fabbro','48248092390'),(10,'Roma','RM','60853','4','Via del siculo','48248092390'),(12,'Ancona','AN','70120','192','Via dei comignoli','12749479271'),(14,'Ancona','AN','70120','16','Via dei campani','12749479271');
/*!40000 ALTER TABLE `indirizzocollaboratore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indirizzospostamento`
--

DROP TABLE IF EXISTS `indirizzospostamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `indirizzospostamento` (
  `CodIndirizzo` int(11) NOT NULL,
  `Citta` varchar(40) NOT NULL,
  `Provincia` char(2) NOT NULL,
  `Cap` char(5) DEFAULT NULL,
  `Civico` varchar(5) NOT NULL,
  `ViaPiazza` varchar(30) NOT NULL,
  PRIMARY KEY (`CodIndirizzo`),
  CONSTRAINT `indirizzospostamento_chk_1` CHECK ((`CodIndirizzo` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indirizzospostamento`
--

LOCK TABLES `indirizzospostamento` WRITE;
/*!40000 ALTER TABLE `indirizzospostamento` DISABLE KEYS */;
INSERT INTO `indirizzospostamento` VALUES (0,'Fabriano','AN','60044','16','Via Risorgimento'),(1,'Ancona','AN','60120','12','Via Osimo'),(2,'Padova','PA','60137','7','Via breccebianche'),(3,'Fabriano','AN','60044','120','Via Marco Polo'),(4,'Siena','SI','60154','1','Via le conce'),(5,'Genga','AN','60133','102','Via Togliatti'),(6,'Verona','VR','64489','12','Via della vittoria'),(8,'Roma','RM','60853','182','Via del fabbro'),(9,'Padova','PA','60137','17','Via Piero Ragni'),(10,'Roma','RM','60853','4','Via del siculo'),(11,'Siena','SI','60154','18','Via Firenze'),(12,'Ancona','AN','70120','192','Via dei comignoli'),(13,'Palermo','PA','60789','62','Via Corso Grande'),(14,'Ancona','AN','70120','16','Via dei campani'),(15,'Roma','RM','60853','82','Via Mercato Coperto'),(17,'Ancona','AN','70120','92','Via dei Angeli'),(100,'Ancona','AN','60120','13','Via Roma'),(101,'Ancona','AN','60130','22','Via de Gasperi');
/*!40000 ALTER TABLE `indirizzospostamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materiale`
--

DROP TABLE IF EXISTS `materiale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materiale` (
  `NomeMateriale` varchar(40) NOT NULL,
  `QuantitaMateriale` float(5,2) NOT NULL DEFAULT '0.00',
  `CodScaffale` int(11) DEFAULT NULL,
  `CodPosizione` int(11) DEFAULT NULL,
  PRIMARY KEY (`NomeMateriale`),
  UNIQUE KEY `CodScaffale` (`CodScaffale`,`CodPosizione`),
  CONSTRAINT `materiale_chk_1` CHECK (((`NomeMateriale` = _cp850'Foglio continuo') or (`NomeMateriale` = _cp850'Foglio A3') or (`NomeMateriale` = _cp850'Inchiostro nero') or (`NomeMateriale` = _cp850'PLA'))),
  CONSTRAINT `materiale_chk_2` CHECK ((`QuantitaMateriale` >= 0)),
  CONSTRAINT `materiale_chk_3` CHECK (((`CodScaffale` >= 1) and (`CodScaffale` <= 10))),
  CONSTRAINT `materiale_chk_4` CHECK (((`CodPosizione` >= 1) and (`CodPosizione` <= 8))),
  CONSTRAINT `materiale_chk_5` CHECK ((((`CodScaffale` = NULL) and (`CodPosizione` = NULL)) or ((`CodScaffale` <> NULL) and (`CodPosizione` <> NULL))))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materiale`
--

LOCK TABLES `materiale` WRITE;
/*!40000 ALTER TABLE `materiale` DISABLE KEYS */;
INSERT INTO `materiale` VALUES ('Foglio A3',30.00,1,2),('Foglio continuo',10.00,1,1),('Inchiostro nero',40.00,2,1),('PLA',50.00,2,2);
/*!40000 ALTER TABLE `materiale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parte`
--

DROP TABLE IF EXISTS `parte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parte` (
  `CodParte` int(11) NOT NULL,
  `Nome` varchar(40) NOT NULL,
  `PathParte` varchar(100) NOT NULL,
  `CodFunzione` int(11) DEFAULT NULL,
  PRIMARY KEY (`CodParte`),
  CONSTRAINT `parte_chk_1` CHECK ((`CodParte` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parte`
--

LOCK TABLES `parte` WRITE;
/*!40000 ALTER TABLE `parte` DISABLE KEYS */;
INSERT INTO `parte` VALUES (1,'cassa audio per pc','C:/Users/Studio/Parti/5/1',5),(2,'supporto cassa audio per pc','C:/Users/Studio/Parti/11/2',11),(3,'massa martello edilizia','C:/Users/Studio/Parti/2/3',2),(4,'bocca martello edilizia','C:/Users/Studio/Parti/3/4',3),(5,'manico martello edilizia','C:/Users/Studio/Parti/4/5',4),(6,'ruota trattore','C:/Users/Studio/Parti/6/6',6),(7,'volante trattore','C:/Users/Studio/Parti/7/7',7),(8,'grafica biglietto formato standard','C:/Users/Studio/Parti/8/8',8),(9,'video pubblicitario','C:/Users/Studio/Parti/9/9',9),(10,'biella pistone stampa','C:/Users/Studio/Parti/1/10',1),(11,'scocca tastiera','C:/Users/Studio/Parti/11/11',11),(12,'pistone motore','C:/Users/Studio/Parti/15/12',15),(13,'asse','C:/Users/Studio/Parti/1/13',1),(14,'impugnatura martello edilizia','C:/Users/Studio/Parti/10/14',10);
/*!40000 ALTER TABLE `parte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preventivo`
--

DROP TABLE IF EXISTS `preventivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preventivo` (
  `DataPreventivo` date NOT NULL,
  `NumeroPreventivo` int(11) NOT NULL,
  `Accettato` tinyint(1) DEFAULT NULL,
  `Totale` float(7,2) NOT NULL,
  `PathPreventivo` varchar(100) DEFAULT NULL,
  `Maggioramento` float(7,2) DEFAULT '0.00',
  PRIMARY KEY (`DataPreventivo`,`NumeroPreventivo`),
  CONSTRAINT `preventivo_chk_1` CHECK ((`Totale` >= 0)),
  CONSTRAINT `preventivo_chk_2` CHECK ((`Maggioramento` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preventivo`
--

LOCK TABLES `preventivo` WRITE;
/*!40000 ALTER TABLE `preventivo` DISABLE KEYS */;
INSERT INTO `preventivo` VALUES ('2012-10-24',1,1,4000.00,'C:/Users/Studio/Preventivi/2012',0.00),('2019-10-23',2,1,500.00,'C:/Users/Studio/Preventivi/2019',0.00),('2019-11-10',1,1,3000.00,'C:/Users/Studio/Preventivi/2019',0.00),('2019-12-01',1,1,7000.00,'C:/Users/Studio/Preventivi/2019',0.00),('2019-12-10',1,1,3000.00,'C:/Users/Studio/Preventivi/2019',0.00),('2020-01-10',1,1,200.00,'C:/Users/Studio/Preventivi/2020',0.00),('2020-01-10',2,1,200.00,'C:/Users/Studio/Preventivi/2020',0.00),('2020-01-10',3,1,200.00,'C:/Users/Studio/Preventivi/2020',0.00),('2020-01-10',4,1,200.00,'C:/Users/Studio/Preventivi/2020',0.00);
/*!40000 ALTER TABLE `preventivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `progetto`
--

DROP TABLE IF EXISTS `progetto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `progetto` (
  `CodProgetto` int(11) NOT NULL,
  `Terminato` tinyint(1) NOT NULL DEFAULT '0',
  `AreaAppartenenza` varchar(30) NOT NULL,
  `Pubblicizzabile` tinyint(1) NOT NULL,
  `ValutazioneCliente` tinyint(4) DEFAULT NULL,
  `Descrizione` varchar(300) NOT NULL,
  `DataInizio` date NOT NULL,
  `PathProgetto` varchar(100) NOT NULL,
  `Nome` varchar(30) NOT NULL,
  `RestanteDaPagare` float(7,2) NOT NULL DEFAULT '-1.00',
  `SpesaCollab` float(7,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`CodProgetto`),
  CONSTRAINT `progetto_chk_1` CHECK ((`CodProgetto` > 0)),
  CONSTRAINT `progetto_chk_2` CHECK (((`AreaAppartenenza` = _cp850'Automotive') or (`AreaAppartenenza` = _cp850'Biotech') or (`AreaAppartenenza` = _cp850'Health-Care') or (`AreaAppartenenza` = _cp850'Medical Instruments') or (`AreaAppartenenza` = _cp850'Audio tools') or (`AreaAppartenenza` = _cp850'Tools') or (`AreaAppartenenza` = _cp850'Animations') or (`AreaAppartenenza` = _cp850'Advertising') or (`AreaAppartenenza` = _cp850'Other'))),
  CONSTRAINT `progetto_chk_3` CHECK (((`ValutazioneCliente` >= 1) and (`ValutazioneCliente` <= 5))),
  CONSTRAINT `progetto_chk_4` CHECK ((`SpesaCollab` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `progetto`
--

LOCK TABLES `progetto` WRITE;
/*!40000 ALTER TABLE `progetto` DISABLE KEYS */;
INSERT INTO `progetto` VALUES (1,1,'Audio tools',0,4,'Cassa audio semplice nera e rossa','2012-10-25','C:/Users/Studio/Progetti/1','Cassa audio',0.00,2300.00),(2,1,'Tools',0,NULL,'Martello edilizia con componenti pesanti','2019-10-25','C:/Users/Studio/Progetti/2','Martello',500.00,0.00),(3,0,'Automotive',0,NULL,'Trattore per microculture su terreni accidentati','2019-11-11','C:/Users/Studio/Progetti/3','trattore',3000.00,850.00),(4,1,'Advertising',1,5,'Biglietti da visita standard','2019-12-01','C:/Users/Studio/Progetti/4','stampa biglietto',0.00,0.00),(5,0,'Animations',0,NULL,'Animazione 3d di una piazza','2019-12-11','C:/Users/Studio/Progetti/5','landscape animato',3000.00,0.00),(6,1,'Other',0,NULL,'stampa 3d pezzo 1','2020-01-12','C:/Users/Studio/Progetti/6','biella',0.00,0.00),(7,1,'Other',0,4,'stampa 3d pezzo 2','2020-01-12','C:/Users/Studio/Progetti/7','scocca',0.00,0.00),(8,1,'Other',0,5,'stampa 3d pezzo 3','2020-01-12','C:/Users/Studio/Progetti/8','pistone',0.00,0.00),(9,1,'Other',0,4,'stampa 3d pezzo 4','2020-01-12','C:/Users/Studio/Progetti/9','asse',0.00,0.00);
/*!40000 ALTER TABLE `progetto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prototipo`
--

DROP TABLE IF EXISTS `prototipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prototipo` (
  `CodProgetto` int(11) NOT NULL,
  `NumeroPrototipo` int(11) NOT NULL,
  `DataOrigine` date NOT NULL,
  `CodScaffale` int(11) DEFAULT NULL,
  `CodPosizione` int(11) DEFAULT NULL,
  PRIMARY KEY (`CodProgetto`,`NumeroPrototipo`),
  UNIQUE KEY `CodScaffale` (`CodScaffale`,`CodPosizione`),
  CONSTRAINT `prototipo_chk_1` CHECK ((`NumeroPrototipo` > 0)),
  CONSTRAINT `prototipo_chk_2` CHECK (((`CodScaffale` >= 1) and (`CodScaffale` <= 10))),
  CONSTRAINT `prototipo_chk_3` CHECK (((`CodPosizione` >= 1) and (`CodPosizione` <= 8))),
  CONSTRAINT `prototipo_chk_4` CHECK ((((`CodScaffale` = NULL) and (`CodPosizione` = NULL)) or ((`CodScaffale` <> NULL) and (`CodPosizione` <> NULL))))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prototipo`
--

LOCK TABLES `prototipo` WRITE;
/*!40000 ALTER TABLE `prototipo` DISABLE KEYS */;
INSERT INTO `prototipo` VALUES (1,1,'2013-01-10',NULL,NULL),(1,2,'2012-12-20',NULL,NULL),(1,3,'2013-01-25',7,1),(2,1,'2019-12-28',8,1),(3,1,'2020-01-22',NULL,NULL),(3,2,'2019-02-01',9,2),(4,1,'2019-12-01',10,1),(4,2,'2019-12-01',NULL,NULL),(4,3,'2019-12-01',10,3),(4,4,'2019-12-01',10,4);
/*!40000 ALTER TABLE `prototipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revisione`
--

DROP TABLE IF EXISTS `revisione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revisione` (
  `CodProgetto` int(11) NOT NULL,
  `NumeroVersione` int(11) NOT NULL,
  `NumeroRevisione` int(11) NOT NULL,
  `PathRevisione` varchar(100) NOT NULL,
  `Ultima` tinyint(1) NOT NULL DEFAULT '0',
  `DataUltimaModifica` date NOT NULL,
  PRIMARY KEY (`NumeroVersione`,`CodProgetto`,`NumeroRevisione`),
  KEY `CodProgetto` (`CodProgetto`,`NumeroVersione`),
  CONSTRAINT `revisione_ibfk_1` FOREIGN KEY (`CodProgetto`, `NumeroVersione`) REFERENCES `versione` (`CodProgetto`, `NumeroVersione`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `revisione_chk_1` CHECK ((`NumeroRevisione` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revisione`
--

LOCK TABLES `revisione` WRITE;
/*!40000 ALTER TABLE `revisione` DISABLE KEYS */;
INSERT INTO `revisione` VALUES (1,1,1,'C:/Users/Studio/Progetti/1/1/1',1,'2012-12-28'),(1,1,2,'C:/Users/Studio/Progetti/1/1/2',0,'2012-10-26'),(1,1,3,'C:/Users/Studio/Progetti/1/1/3',0,'2012-11-16'),(2,1,1,'C:/Users/Studio/Progetti/2/1/1',1,'2019-11-25'),(2,1,2,'C:/Users/Studio/Progetti/2/1/2',0,'2019-10-26'),(2,1,3,'C:/Users/Studio/Progetti/2/1/3',0,'2019-10-28'),(3,1,1,'C:/Users/Studio/Progetti/3/1/1',1,'2019-11-15'),(3,1,2,'C:/Users/Studio/Progetti/3/1/2',0,'2019-11-15'),(3,1,3,'C:/Users/Studio/Progetti/3/1/3',0,'2019-11-14'),(3,1,4,'C:/Users/Studio/Progetti/3/1/4',0,'2019-11-14'),(3,1,5,'C:/Users/Studio/Progetti/3/1/5',0,'2019-11-14'),(4,1,1,'C:/Users/Studio/Progetti/4/1/1',1,'2020-01-09'),(4,1,2,'C:/Users/Studio/Progetti/4/1/2',0,'2019-12-15'),(5,1,1,'C:/Users/Studio/Progetti/5/1/1',1,'2019-12-15'),(6,1,1,'C:/Users/Studio/Progetti/6/1/1',1,'2020-01-12'),(7,1,1,'C:/Users/Studio/Progetti/7/1/1',1,'2020-01-12'),(8,1,1,'C:/Users/Studio/Progetti/8/1/1',1,'2020-01-12'),(9,1,1,'C:/Users/Studio/Progetti/9/1/1',1,'2020-01-12'),(1,2,1,'C:/Users/Studio/Progetti/1/2/1',0,'2012-11-28'),(1,2,2,'C:/Users/Studio/Progetti/1/2/2',1,'2012-11-28'),(2,2,1,'C:/Users/Studio/Progetti/2/2/1',1,'2019-12-05'),(4,2,1,'C:/Users/Studio/Progetti/4/2/1',1,'2019-12-15'),(2,3,1,'C:/Users/Studio/Progetti/2/3/1',1,'2019-12-02');
/*!40000 ALTER TABLE `revisione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `richiesta`
--

DROP TABLE IF EXISTS `richiesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `richiesta` (
  `CodProgetto` int(11) NOT NULL,
  `CodPar` varchar(16) NOT NULL,
  `DataPreventivo` date NOT NULL,
  `NumeroPreventivo` int(11) NOT NULL,
  `DataConsegnaDesiderata` date NOT NULL,
  `DataConsegnaEffettiva` date DEFAULT NULL,
  `DataRichiesta` date NOT NULL,
  `ModificaGiorni` int(11) NOT NULL DEFAULT '0',
  `NumeroModifiche` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`CodProgetto`),
  KEY `DataPreventivo` (`DataPreventivo`,`NumeroPreventivo`),
  CONSTRAINT `richiesta_ibfk_1` FOREIGN KEY (`DataPreventivo`, `NumeroPreventivo`) REFERENCES `preventivo` (`DataPreventivo`, `NumeroPreventivo`) ON UPDATE CASCADE,
  CONSTRAINT `richiesta_chk_1` CHECK ((`DataConsegnaDesiderata` >= `DataRichiesta`)),
  CONSTRAINT `richiesta_chk_2` CHECK ((`NumeroModifiche` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `richiesta`
--

LOCK TABLES `richiesta` WRITE;
/*!40000 ALTER TABLE `richiesta` DISABLE KEYS */;
INSERT INTO `richiesta` VALUES (1,'LPADLD98B19Z100D','2012-10-24',1,'2013-03-26','2013-03-26','2012-10-19',0,0),(2,'07843521001','2019-10-23',2,'2019-11-01',NULL,'2019-10-23',0,0),(3,'SCGGZS38R47L319E','2019-11-10',1,'2019-12-11',NULL,'2019-10-19',0,0),(4,'07844441671','2019-12-01',1,'2020-02-01','2020-02-01','2019-12-01',0,0),(5,'WLLMZS38R47L319E','2019-12-10',1,'2020-01-02',NULL,'2019-12-09',0,0),(6,'GFFFLD97B18Z199D','2020-01-10',1,'2020-01-17',NULL,'2020-01-10',0,0),(7,'GFFFLD97B18Z199D','2020-01-10',2,'2020-01-17',NULL,'2020-01-10',0,0),(8,'GFFFLD97B18Z199D','2020-01-10',3,'2020-01-17',NULL,'2020-01-10',0,0),(9,'GFFFLD97B18Z199D','2020-01-10',4,'2020-01-17',NULL,'2020-01-10',0,0);
/*!40000 ALTER TABLE `richiesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stampa`
--

DROP TABLE IF EXISTS `stampa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stampa` (
  `CodProgetto` int(11) NOT NULL,
  `FoglioA3` int(11) DEFAULT '0',
  `FoglioContinuo` float(4,2) DEFAULT '0.00',
  `PLA` float(4,2) DEFAULT '0.00',
  `InchiostroNero` float(4,2) DEFAULT '0.00',
  `InchiostroColori` float(4,2) DEFAULT '0.00',
  `TempoStampa` float DEFAULT '0',
  PRIMARY KEY (`CodProgetto`),
  CONSTRAINT `stampa_chk_1` CHECK ((`FoglioA3` >= 0)),
  CONSTRAINT `stampa_chk_2` CHECK ((`FoglioContinuo` >= 0)),
  CONSTRAINT `stampa_chk_3` CHECK ((`PLA` >= 0)),
  CONSTRAINT `stampa_chk_4` CHECK ((`InchiostroNero` >= 0)),
  CONSTRAINT `stampa_chk_5` CHECK ((`InchiostroColori` >= 0)),
  CONSTRAINT `stampa_chk_6` CHECK ((`TempoStampa` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stampa`
--

LOCK TABLES `stampa` WRITE;
/*!40000 ALTER TABLE `stampa` DISABLE KEYS */;
INSERT INTO `stampa` VALUES (6,0,0.00,1.50,0.00,0.00,30),(7,0,0.00,1.20,0.00,0.00,22),(8,0,0.00,1.30,0.00,0.00,25),(9,0,0.00,2.50,0.00,0.00,40);
/*!40000 ALTER TABLE `stampa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefonocliente`
--

DROP TABLE IF EXISTS `telefonocliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefonocliente` (
  `Numero` varchar(10) NOT NULL,
  `CodPar` varchar(16) NOT NULL,
  PRIMARY KEY (`Numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefonocliente`
--

LOCK TABLES `telefonocliente` WRITE;
/*!40000 ALTER TABLE `telefonocliente` DISABLE KEYS */;
INSERT INTO `telefonocliente` VALUES ('0543326789','07844441671'),('0733001199','GNGGZS38R47L319E'),('1247538291','SCGGZS38R47L319E'),('2345784329','SCGGZS38R47L319E'),('3895273081','LPADLD98B19Z100D'),('3895273333','LPADLD98B19Z100D'),('5474389328','LDDDLD97B18Z199D'),('6672689900','09993261688'),('8301830887','09993261688'),('8493840021','WLLMZS38R47L319E'),('8984228028','GFFFLD97B18Z199D'),('9872367188','07843521001');
/*!40000 ALTER TABLE `telefonocliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefonocollaboratore`
--

DROP TABLE IF EXISTS `telefonocollaboratore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefonocollaboratore` (
  `Numero` varchar(10) NOT NULL,
  `Piva` char(11) DEFAULT NULL,
  PRIMARY KEY (`Numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefonocollaboratore`
--

LOCK TABLES `telefonocollaboratore` WRITE;
/*!40000 ALTER TABLE `telefonocollaboratore` DISABLE KEYS */;
INSERT INTO `telefonocollaboratore` VALUES ('0421412164','16428749497'),('0643664663','74922093111'),('0914224643','11134567654'),('0916436164','48248092390'),('0917382616','12749479271'),('2324146166','12749479271');
/*!40000 ALTER TABLE `telefonocollaboratore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracciamentoprototipi`
--

DROP TABLE IF EXISTS `tracciamentoprototipi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tracciamentoprototipi` (
  `CodSpostamento` int(11) NOT NULL,
  `DataSpostamento` date NOT NULL,
  `CodIndOrigine` int(11) DEFAULT NULL,
  `CodIndDestinazione` int(11) DEFAULT NULL,
  `CodProgetto` int(11) NOT NULL,
  `NumeroPrototipo` int(11) NOT NULL,
  PRIMARY KEY (`CodSpostamento`),
  KEY `CodProgetto` (`CodProgetto`,`NumeroPrototipo`),
  CONSTRAINT `tracciamentoprototipi_ibfk_1` FOREIGN KEY (`CodProgetto`, `NumeroPrototipo`) REFERENCES `prototipo` (`CodProgetto`, `NumeroPrototipo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tracciamentoprototipi_chk_1` CHECK ((`CodSpostamento` > 0)),
  CONSTRAINT `tracciamentoprototipi_chk_2` CHECK ((`CodIndOrigine` <> `CodIndDestinazione`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracciamentoprototipi`
--

LOCK TABLES `tracciamentoprototipi` WRITE;
/*!40000 ALTER TABLE `tracciamentoprototipi` DISABLE KEYS */;
INSERT INTO `tracciamentoprototipi` VALUES (1,'2013-01-30',0,2,1,1),(2,'2013-01-31',2,0,1,1),(3,'2013-02-01',0,4,1,1),(4,'2013-02-01',4,0,1,1),(5,'2013-03-24',0,1,1,1),(6,'2013-01-30',0,2,1,2),(7,'2013-01-31',2,0,1,2),(8,'2020-02-01',0,3,3,1),(9,'2020-02-03',3,0,3,1),(10,'2020-01-03',0,5,4,2);
/*!40000 ALTER TABLE `tracciamentoprototipi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variante`
--

DROP TABLE IF EXISTS `variante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variante` (
  `CodParte` int(11) NOT NULL,
  `CodVariante` int(11) NOT NULL,
  `PathVariante` varchar(100) NOT NULL,
  `Descrizione` varchar(300) NOT NULL,
  PRIMARY KEY (`CodParte`,`CodVariante`),
  CONSTRAINT `variante_chk_1` CHECK ((`CodVariante` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variante`
--

LOCK TABLES `variante` WRITE;
/*!40000 ALTER TABLE `variante` DISABLE KEYS */;
INSERT INTO `variante` VALUES (1,1,'C:/Users/Studio/Parti/5/1/1','variante principale della cassa audio'),(1,2,'C:/Users/Studio/Parti/5/1/2','variante secondaria della cassa audio'),(1,3,'C:/Users/Studio/Parti/5/1/3','variante aggiuntiva della cassa audio'),(2,1,'C:/Users/Studio/Parti/11/2/1','supporto pesante cassa audio pc'),(2,2,'C:/Users/Studio/Parti/11/2/2','supporto leggero cassa audio pc'),(2,3,'C:/Users/Studio/Parti/11/2/3','supporto leggero con dettagli grafici colorati cassa audio pc'),(3,1,'C:/Users/Studio/Parti/2/3/1','variante principale della massa del martello per la edilizia'),(3,2,'C:/Users/Studio/Parti/2/3/2','variante secondaria della massa del martello per la edilizia'),(4,1,'C:/Users/Studio/Parti/3/4/1','bocca martello per la edilizia nera pesante'),(5,1,'C:/Users/Studio/Parti/4/5/1','manico martello per la edilizia leggero'),(5,2,'C:/Users/Studio/Parti/4/5/2','manico martello per la edilizia pesante'),(6,1,'C:/Users/Studio/Parti/6/6/1','variante principale della ruota per il trattore'),(6,2,'C:/Users/Studio/Parti/6/6/2','variante principale con focus su cerchi della ruota per il trattore'),(6,3,'C:/Users/Studio/Parti/6/6/3','variante secondaria della ruota per il trattore con dimensioni minime'),(6,4,'C:/Users/Studio/Parti/6/6/4',' ruota per il trattore, variante compatta'),(6,5,'C:/Users/Studio/Parti/6/6/5','variante della ruota per il trattore con peso e dimensioni max'),(7,1,'C:/Users/Studio/Parti/7/7/1','volante trattore sottile'),(7,2,'C:/Users/Studio/Parti/7/7/2','volante trattore sottile con raggi sottili'),(7,3,'C:/Users/Studio/Parti/7/7/3','volante trattore leggermente più spesso con raggi sottili'),(7,4,'C:/Users/Studio/Parti/7/7/4','volante trattore con spec.standard'),(8,1,'C:/Users/Studio/Parti/8/8/1',' grafica biglietto classico senza colori'),(8,2,'C:/Users/Studio/Parti/8/8/2',' grafica biglietto classico secondo colori come da standard'),(8,3,'C:/Users/Studio/Parti/8/8/3',' grafica biglietto, variante con riquadri'),(8,4,'C:/Users/Studio/Parti/8/8/4',' grafica biglietto, variante con colori scuri'),(8,5,'C:/Users/Studio/Parti/8/8/5',' grafica biglietto con dettagli su forme'),(9,1,'C:/Users/Studio/Parti/9/9/1','video originale piazza, formato standard'),(10,1,'C:/Users/Studio/Parti/1/10/1','variante principale della biella'),(11,1,'C:/Users/Studio/Parti/11/11/1','scocca leggera nera per tastiera '),(11,2,'C:/Users/Studio/Parti/11/11/2','scocca pesante nera per tastiera'),(12,1,'C:/Users/Studio/Parti/15/12/1','pistone motore robusto e leggero'),(13,1,'C:/Users/Studio/Parti/1/13/1','asse robusto'),(14,1,'C:/Users/Studio/Parti/10/14/1','impugnatura per martello edilizia con specifiche standard'),(14,2,'C:/Users/Studio/Parti/10/14/2','impugnatura per martello edilizia con specifiche elaborate'),(14,3,'C:/Users/Studio/Parti/10/14/3','impugnatura per martello edilizia ergonomia massima'),(14,4,'C:/Users/Studio/Parti/10/14/4','impugnatura per martello edilizia con peso minimo');
/*!40000 ALTER TABLE `variante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versione`
--

DROP TABLE IF EXISTS `versione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `versione` (
  `CodProgetto` int(11) NOT NULL,
  `NumeroVersione` int(11) NOT NULL,
  `PathVersione` varchar(100) NOT NULL,
  `VersioneAttiva` tinyint(1) NOT NULL DEFAULT '1',
  `DataCreazioneVersione` date NOT NULL,
  `VersionePresentata` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`CodProgetto`,`NumeroVersione`),
  CONSTRAINT `versione_chk_1` CHECK ((`NumeroVersione` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versione`
--

LOCK TABLES `versione` WRITE;
/*!40000 ALTER TABLE `versione` DISABLE KEYS */;
INSERT INTO `versione` VALUES (1,1,'C:/Users/Studio/Progetti/1/1',1,'2012-10-25',1),(1,2,'C:/Users/Studio/Progetti/1/2',0,'2012-10-28',0),(2,1,'C:/Users/Studio/Progetti/2/1',1,'2019-10-25',0),(2,2,'C:/Users/Studio/Progetti/2/2',0,'2019-10-26',0),(2,3,'C:/Users/Studio/Progetti/2/3',0,'2019-10-27',0),(3,1,'C:/Users/Studio/Progetti/3/1',1,'2019-11-11',0),(4,1,'C:/Users/Studio/Progetti/4/1',1,'2019-12-01',1),(4,2,'C:/Users/Studio/Progetti/4/2',0,'2019-12-03',1),(5,1,'C:/Users/Studio/Progetti/5/1',1,'2019-12-11',0),(6,1,'C:/Users/Studio/Progetti/6/1',1,'2020-01-12',1),(7,1,'C:/Users/Studio/Progetti/7/1',1,'2020-01-12',1),(8,1,'C:/Users/Studio/Progetti/8/1',1,'2020-01-12',1),(9,1,'C:/Users/Studio/Progetti/9/1',1,'2020-01-12',1);
/*!40000 ALTER TABLE `versione` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-06 14:46:15
