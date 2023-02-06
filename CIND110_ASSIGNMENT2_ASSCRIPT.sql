CREATE DATABASE  IF NOT EXISTS `RegistrarDB` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `RegistrarDB`;
-- MySQL dump 10.13  Distrib 8.0.20, for macos10.15 (x86_64)
--
-- Host: localhost    Database: RegistrarDB
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
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `C_Id` varchar(15) NOT NULL,
  `C_Name` varchar(45) NOT NULL,
  `C_Credit` float NOT NULL,
  `C_Prerequisite` varchar(45) NOT NULL,
  `Department` varchar(45) NOT NULL,
  PRIMARY KEY (`C_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('CIND001','Phyton',2,'NO','IND'),('CIND110','Intro Data Analysts',3,'CIND001','IND'),('CIND800','Adv Data Analysts',3,'CIND110','IND'),('CIND850','Data Mining',4,'CIND800','IND'),('CITM305','System Design',3,'CPS209','TRSM'),('CITM430','System Devlp',4,'CITM305','TRSM'),('CPS209','Intro to Java',3,'NO','CS'),('CPS406','Intro Software Eng',3,'CPS209','CS'),('CPS510','Into Database',3,'CPS209','CS'),('CPS530','Intro to Web Prog',3,'CPS209','CS'),('CPS630','Adv Web Prog',4,'CPS530','CS'),('CPS888','Adv Software Eng',4,'CPS406','CS'),('MATH101','Calculus Basic',3,'NO','MATH'),('MATH300','Calculus Inter',3,'MATH101','MATH'),('MATH400','Calculus Adv',4,'MATH300','MATH');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enroll`
--

DROP TABLE IF EXISTS `enroll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enroll` (
  `C_Id` varchar(15) NOT NULL,
  `St_Id` int NOT NULL,
  `P_Name` varchar(45) NOT NULL,
  `Status` char(5) NOT NULL,
  PRIMARY KEY (`C_Id`,`St_Id`),
  KEY `FK_Student2_idx` (`St_Id`),
  CONSTRAINT `FK_Student2` FOREIGN KEY (`St_Id`) REFERENCES `student` (`St_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enroll`
--

LOCK TABLES `enroll` WRITE;
/*!40000 ALTER TABLE `enroll` DISABLE KEYS */;
INSERT INTO `enroll` VALUES ('CIND001',17015,'Gray','INC'),('CIND001',17017,'White','COMP'),('CIND001',20103,'White','INC'),('CIND800',16009,'Red','COMP'),('CIND800',17011,'Red','COMP'),('CPS209',19009,'Black','INC'),('CPS530',15014,'Smith','ABS'),('CPS630',16005,'White','COMP'),('CPS888',16007,'Red','COMP'),('MATH101',15010,'Black','COMP'),('MATH400',19008,'White','COMP');
/*!40000 ALTER TABLE `enroll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade`
--

DROP TABLE IF EXISTS `grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grade` (
  `St_Id` int NOT NULL,
  `S_Id` int NOT NULL,
  `Grade` float NOT NULL,
  PRIMARY KEY (`St_Id`,`S_Id`),
  KEY `FK_Section1_idx` (`S_Id`),
  CONSTRAINT `FK_Section1` FOREIGN KEY (`S_Id`) REFERENCES `section` (`S_Id`),
  CONSTRAINT `FK_Student1` FOREIGN KEY (`St_Id`) REFERENCES `student` (`St_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade`
--

LOCK TABLES `grade` WRITE;
/*!40000 ALTER TABLE `grade` DISABLE KEYS */;
INSERT INTO `grade` VALUES (15010,11,3.65),(15011,14,2.88),(15012,23,3.25),(15013,25,3.95),(15014,26,4),(16005,28,3.5),(16007,29,2.75),(16009,35,2.85),(17011,36,3.65),(17013,37,3.45),(17015,39,3.95),(17017,40,4),(19003,41,3.75),(19007,27,3.25),(19008,15,3.15),(19009,20,3.65),(20100,21,3.7),(20101,12,2.95),(20102,30,3.45),(20103,40,3.45);
/*!40000 ALTER TABLE `grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professor` (
  `P_Name` varchar(45) NOT NULL,
  `P_Phone` int NOT NULL,
  `P_Email` varchar(100) NOT NULL,
  PRIMARY KEY (`P_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT INTO `professor` VALUES ('Adam',4664,'Adam@'),('Black',3443,'Black@'),('Gray',5665,'Gray@'),('Green',8778,'Green@'),('Peter',1331,'Peter@'),('Red',3773,'Red@'),('Smith',9889,'Smith@'),('White',2332,'White@');
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `section` (
  `S_Id` int NOT NULL,
  `C_Id` varchar(15) NOT NULL,
  `Term` varchar(15) NOT NULL,
  `Year` int NOT NULL,
  `P_Name` varchar(45) NOT NULL,
  PRIMARY KEY (`S_Id`,`C_Id`),
  KEY `FK_Course1_idx` (`C_Id`),
  KEY `FK_Professor1_idx` (`P_Name`),
  CONSTRAINT `FK_Course1` FOREIGN KEY (`C_Id`) REFERENCES `course` (`C_Id`),
  CONSTRAINT `FK_Professor1` FOREIGN KEY (`P_Name`) REFERENCES `professor` (`P_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
INSERT INTO `section` VALUES (11,'MATH101','Fall',2020,'Black'),(12,'MATH101','Winter',2022,'Green'),(13,'MATH300','Fall',2021,'Smith'),(14,'MATH300','Summer',2021,'Gray'),(15,'MATH400','Winter',2021,'White'),(16,'MATH400','Summer',2021,'Gray'),(20,'CPS209','Fall',2020,'Black'),(21,'CPS209','Winter',2022,'Black'),(22,'CPS406','Fall',2019,'Smith'),(23,'CPS406','Summer',2019,'Green'),(24,'CPS510','Fall',2019,'Green'),(25,'CPS510','Summer',2019,'Smith'),(26,'CPS530','Fall',2020,'Smith'),(27,'CPS530','Summer',2020,'White'),(28,'CPS630','Winter',2022,'White'),(29,'CPS888','Fall',2021,'Red'),(30,'CITM305','Summer',2021,'Red'),(31,'CITM430','Summer',2021,'Gray'),(32,'CIND110','Fall',2021,'Black'),(33,'CIND110','Winter',2022,'Black'),(34,'CIND110','Summer',2020,'Gray'),(35,'CIND800','Fall',2020,'Red'),(36,'CIND800','Summer',2019,'Red'),(37,'CIND850','Summer',2021,'Smith'),(38,'CIND001','Winter',2022,'Smith'),(39,'CIND001','Fall',2021,'Gray'),(40,'CIND001','Winter',2022,'White'),(41,'CITM430','Winter',2022,'Green');
/*!40000 ALTER TABLE `section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `St_Id` int NOT NULL,
  `St_Name` varchar(45) NOT NULL,
  `Major` varchar(45) NOT NULL,
  `Degree` varchar(15) NOT NULL,
  `GPA` float NOT NULL,
  `Email` varchar(100) NOT NULL,
  PRIMARY KEY (`St_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (15010,'Kyle','CS','B.Sc.',3.5,'Kyle@'),(15011,'Mina','CS','B.Sc.',3.6,'Mina@'),(15012,'Lida','Art','B.A.',3.2,'Lida@'),(15013,'Dara','CE','B.Eng.',3.1,'Dara@'),(15014,'Ali','INE','B.Eng.',3.7,'Ali@'),(16005,'Rona','MATH','B.Sc.',3.9,'Rona@'),(16007,'Sam','INE','B.Eng.',3,'Sam@'),(16009,'Alice','CE','B.Eng.',2.98,'Alice@'),(17011,'Mary','CS','B.Sc.',3.5,'Mary@'),(17013,'David','CS','B.Sc.',3.4,'David@'),(17015,'Amir','Art','B.A.',3.45,'Amir@'),(17017,'Tara','Art','B.A.',2.8,'Tara@'),(19003,'Peter','MATH','B.Sc.',3.9,'Peter@'),(19007,'Roy','MATH','B.Sc.',3.75,'Roy@'),(19008,'Kate','INE','B.Eng.',3.3,'Kate@'),(19009,'Lary','CE','B.Eng.',3.85,'Lary@'),(20100,'Lili','Art','B.A.',2.9,'Lili@'),(20101,'Arya','Art','B.A.',3.75,'Arya@'),(20102,'Xue','CE','B.Eng.',3,'Xue@'),(20103,'Sue','CS','B.Sc.',3.1,'Sue@');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teach`
--

DROP TABLE IF EXISTS `teach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teach` (
  `C_Id` varchar(15) NOT NULL,
  `ExamType` varchar(45) NOT NULL,
  PRIMARY KEY (`C_Id`),
  CONSTRAINT `FK_Course2` FOREIGN KEY (`C_Id`) REFERENCES `course` (`C_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teach`
--

LOCK TABLES `teach` WRITE;
/*!40000 ALTER TABLE `teach` DISABLE KEYS */;
INSERT INTO `teach` VALUES ('CIND001','Labs'),('CIND110','Labs'),('CIND800','WTest'),('CIND850','Proj'),('CITM305','WTest'),('CITM430','WTest'),('CPS209','Proj'),('CPS406','WTest'),('CPS510','Proj'),('CPS530','Labs'),('CPS630','Proj'),('CPS888','Proj'),('MATH101','WTest'),('MATH300','Labs'),('MATH400','Proj');
/*!40000 ALTER TABLE `teach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teach_pool`
--

DROP TABLE IF EXISTS `teach_pool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teach_pool` (
  `C_Id` varchar(15) NOT NULL,
  `P_Name` varchar(45) NOT NULL,
  `Term` varchar(15) NOT NULL,
  PRIMARY KEY (`C_Id`,`P_Name`),
  KEY `FK_Professor3_idx` (`P_Name`),
  CONSTRAINT `FK_Course3` FOREIGN KEY (`C_Id`) REFERENCES `course` (`C_Id`),
  CONSTRAINT `FK_Professor3` FOREIGN KEY (`P_Name`) REFERENCES `professor` (`P_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teach_pool`
--

LOCK TABLES `teach_pool` WRITE;
/*!40000 ALTER TABLE `teach_pool` DISABLE KEYS */;
INSERT INTO `teach_pool` VALUES ('CIND001','Smith','Winter'),('CIND110','Adam','Fall'),('CIND110','Green','Summer'),('CIND800','Black','Fall'),('CIND800','Red','Summer'),('CITM430','Black','Fall'),('CPS209','Gray','Summer'),('CPS406','Gray','Summer'),('CPS510','White','Fall'),('CPS888','Adam','Winter'),('MATH101','Black','Winter'),('MATH101','Green','Fall'),('MATH101','Smith','Winter');
/*!40000 ALTER TABLE `teach_pool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'RegistrarDB'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-07 16:38:04

-- Q1
SELECT DISTINCT St_Name AS 'StudentName', St_Id AS 'StudentId', Major
FROM STUDENT
WHERE Major = 'CE';

-- Q2
SELECT DISTINCT St_Name AS 'StudentName', St_Id AS 'StudentId', Major, GPA
FROM STUDENT
WHERE GPA >= 3.5;

-- Q3
SELECT DISTINCT	S.St_Name AS 'StudentName', C.C_Name AS 'CourseName', K.C_Id AS 'CourseId', K.S_Id AS 'SectionId',
				K.Term, K.Year, K.P_Name AS 'ProfName', G.Grade
FROM Section AS K
INNER JOIN Course AS C ON C.C_Id = K.C_Id
INNER JOIN Grade AS G ON G.S_Id = K.S_Id
INNER JOIN Student AS S ON S.St_Id = G.St_Id
WHERE S.St_Name = 'David';

-- Q4
CREATE VIEW Q4 AS
SELECT	S.St_Name AS 'StudentName', S.St_Id AS 'StudentId', K.S_Id AS 'SectionId', K.C_Id AS 'CourseId',
		K.Term, K.Year, K.P_Name AS 'ProfName', G.Grade
FROM Section AS K
JOIN Course AS C ON C.C_Id = K.C_Id
JOIN Grade AS G ON G.S_Id = K.S_Id
JOIN Student AS S ON S.St_Id = G.St_Id
WHERE C.C_Id = 'CPS510' AND G.Grade >= 1.0;

SELECT * FROM Q4;

-- Q5
UPDATE Q4
SET Grade = 4.0
WHERE CourseId = 'CPS510' AND SectionId = '25';

SELECT * FROM Q4;

-- Q6
SELECT DISTINCT * #S.St_Id AS 'StudentId', S.St_Name AS 'StudentName', S.Major, S.Degree, S.GPA, S.Email
FROM STUDENT AS S
JOIN GRADE AS G ON G.St_Id = S.St_Id
JOIN SECTION AS K ON K.S_Id = G.S_Id
WHERE K.C_Id = 'CPS510' AND K.P_Name = 'Smith'
GROUP BY K.S_Id;

-- Q7
SELECT S.St_Id AS 'StudentId', S.St_Name AS 'StudentName', C.C_Id AS 'CourseId', C.C_Name AS 'CourseName'
FROM STUDENT AS S
JOIN GRADE AS G ON G.St_Id = S.St_Id
JOIN SECTION AS K ON K.S_Id = G.S_Id
JOIN Course AS C ON C.C_Id = K.C_Id
WHERE K.Term = 'Fall' AND K.Year = '2021'
ORDER BY S.St_Id ASC;

-- Q8
SELECT K.P_Name AS 'ProfName', C.C_Name AS 'CourseName'
FROM Section AS K
JOIN Course AS C ON C.C_Id = K.C_Id
WHERE K.Term Like 'Winter%' and K.Year = '2022';

-- Q9
SELECT S.St_Name AS 'StudentName', S.St_Id AS 'StudentId', S.Major, S.Degree, S.GPA
FROM Student AS S
WHERE S.Degree = 'B.Sc.' OR S.Degree = 'B.A.'
HAVING S.GPA >= 3.0;

-- Q10
SELECT S.St_Name AS 'StudentName', S.St_Id AS 'StudentId', S.Major, S.Degree, S.GPA
FROM Student AS S
WHERE S.GPA >= 3.0 AND S.GPA <= 4.0;

-- Q11
SELECT S.St_Id AS 'StudentId', S.St_Name AS 'StudentName', S.Major, S.Degree, S.GPA, S.Email, K.Term, K.Year
FROM Student AS S
JOIN Grade AS G ON G.St_Id = S.St_Id
JOIN Section AS K ON K.S_Id = G.S_Id
JOIN Course AS C ON C.C_Id = K.C_Id
WHERE K.Term LIKE 'Winter%' AND K.Year = '2022' 
GROUP BY C.C_Name;

-- Q12
SELECT P.P_Name AS 'ProfName', P.P_Email AS 'ProfEmail', P.P_Phone AS 'ProfPhone', C.C_Name AS 'CourseName',
		C.C_Id AS 'CourseId', K.Term, K.Year
FROM Professor AS P
JOIN Section AS K ON K.P_Name = P.P_Name
JOIN Course AS C ON C.C_Id = K.C_Id
WHERE K.Term Like 'Winter%' AND K.Year = '2022';

-- Q13
SELECT DISTINCT TP.P_Name AS 'ProfName', C.C_Name AS 'CourseName', C.C_Id AS 'CourseId'
FROM Teach_Pool AS TP
JOIN Course AS C ON C.C_Id = TP.C_Id
JOIN Section AS K ON K.C_Id = TP.C_Id
WHERE TP.C_Id = 'CIND110' AND NOT TP.P_Name = K.P_Name;

-- Q14
CREATE VIEW Q14a AS
SELECT DISTINCT TP.P_Name AS 'ProfName', TP.C_Id AS 'CourseId'
FROM Teach_Pool AS TP
WHERE TP.Term LIKE 'Summer%'; 

CREATE VIEW Q14b AS
SELECT DISTINCT K.P_Name AS 'ProfName', K.C_Id AS 'CourseID'
FROM Section AS K
WHERE K.Term LIKE 'Winter%' AND K.Year = '2022';

SELECT *
FROM Q14a
WHERE NOT EXISTS (SELECT * FROM Q14b
					WHERE Q14a.ProfName = Q14b.ProfName AND Q14a.CourseId = Q14b.CourseID);
                    
-- Q15
SELECT DISTINCT C.C_name AS 'CourseName', C.C_Id AS 'CourseId'
FROM Course AS C
WHERE C.C_Name LIKE 'Intro%' OR C.C_Name LIKE 'Into%'; 

-- Q16
SELECT C.C_Name AS 'CourseName', C.C_Id AS 'CourseId', K.Term, K.Year
FROM Course AS C
JOIN Section AS K ON K.C_Id = C.C_Id
WHERE C.C_Prerequisite = 'CPS209';

-- Q17
CREATE VIEW Report1 AS
SELECT	S.St_Id AS 'StudentId', S.St_Name AS 'StudentName', S.Major, S.Degree, S.GPA, 
		S.Email, K.C_Id AS 'CourseId', K.Term, K.Year
FROM Student AS S
JOIN Grade AS G ON G.St_Id = S.St_Id
JOIN Section AS K ON K.S_Id = G.S_Id
WHERE K.Term = 'Summer' AND K.Year = '2021';

SELECT * FROM Report1;  

-- Q18
CREATE VIEW Report_S2022 AS
SELECT	P.P_Name AS 'ProfName', P.P_Phone AS 'ProfNumber', P.P_Email AS 'ProfEmail',
		TP.C_Id AS 'CourseId'
FROM Professor AS P
JOIN Teach_Pool AS TP ON TP.P_Name = P.P_Name
WHERE TP.Term = 'Summer'
ORDER BY P.P_Name ASC;

SELECT * FROM Report_S2022; 

-- Q19
SELECT C.C_Id AS 'CourseId', C.C_name AS 'CourseName', C.C_Credit AS 'CourseCredit',
				C.C_Prerequisite AS 'Prerequisite', C.Department AS 'Department', T.ExamType
FROM Course AS C
JOIN Teach AS T ON T.C_Id = C.C_Id
GROUP BY C.C_Id;

-- 20
SELECT	MIN(S.GPA) AS 'Minimum GPA', MAX(S.GPA) AS 'Maximum GPA', AVG(S.GPA) AS 'Average GPA', 
		VARIANCE(S.GPA) AS 'Variance GPA', STDDEV(S.GPA) AS 'Standard Deviation GPA'
FROM Student AS S; 