-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema A1_CompanyDB
-- -----------------------------------------------------
-- Assignment 1: Company Database

-- -----------------------------------------------------
-- Schema A1_CompanyDB
--
-- Assignment 1: Company Database
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `A1_CompanyDB` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `A1_CompanyDB` ;

-- -----------------------------------------------------
-- Table `A1_CompanyDB`.`Department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `A1_CompanyDB`.`Department` (
  `Dname` VARCHAR(15) NOT NULL,
  `Dnumber` INT NOT NULL AUTO_INCREMENT,
  `Mgr_ssn` CHAR(9) NOT NULL,
  `Mgr_start_date` DATE NULL,
  PRIMARY KEY (`Dnumber`),
  INDEX `fk_Depart_Emp_idx` (`Mgr_ssn` ASC) INVISIBLE,
  UNIQUE INDEX `Dname_UNIQUE` (`Dname` ASC) VISIBLE,
  CONSTRAINT `fk_Depart_Emp`
    FOREIGN KEY (`Mgr_ssn`)
    REFERENCES `A1_CompanyDB`.`Employee` (`Ssn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `A1_CompanyDB`.`Employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `A1_CompanyDB`.`Employee` (
  `Fname` VARCHAR(15) NOT NULL,
  `Minit` CHAR NULL,
  `Lname` VARCHAR(15) NOT NULL,
  `Ssn` CHAR(9) NOT NULL,
  `BDate` DATE NOT NULL,
  `Address` VARCHAR(30) NULL,
  `Sex` CHAR NULL,
  `Salary` DECIMAL(10,2) NULL,
  `Super_ssn` CHAR(9) NULL,
  `Dno` INT NOT NULL,
  PRIMARY KEY (`Ssn`),
  INDEX `fk_Emp_Depart_idx` (`Dno` ASC) INVISIBLE,
  INDEX `fk_Employee_Employee_idx` (`Super_ssn` ASC) VISIBLE,
  CONSTRAINT `fk_Employee_Employee`
    FOREIGN KEY (`Super_ssn`)
    REFERENCES `A1_CompanyDB`.`Employee` (`Ssn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Employee_Department1`
    FOREIGN KEY (`Dno`)
    REFERENCES `A1_CompanyDB`.`Department` (`Dnumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `A1_CompanyDB`.`Dept_Locations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `A1_CompanyDB`.`Dept_Locations` (
  `Dnumber` INT NOT NULL,
  `Dlocations` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`Dnumber`),
  INDEX `fk_Dept_Loc_Depart_idx` (`Dnumber` ASC) INVISIBLE,
  CONSTRAINT `fk_Dept_Locations_Department1`
    FOREIGN KEY (`Dnumber`)
    REFERENCES `A1_CompanyDB`.`Department` (`Dnumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `A1_CompanyDB`.`Project`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `A1_CompanyDB`.`Project` (
  `Pname` VARCHAR(15) NULL,
  `Pnumber` INT NOT NULL,
  `Plocation` VARCHAR(15) NULL,
  `Dnum` INT NOT NULL,
  PRIMARY KEY (`Pnumber`),
  INDEX `fk_Proj_Depart_idx` (`Dnum` ASC) VISIBLE,
  CONSTRAINT `fk_Project_Department1`
    FOREIGN KEY (`Dnum`)
    REFERENCES `A1_CompanyDB`.`Department` (`Dnumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `A1_CompanyDB`.`Works_On`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `A1_CompanyDB`.`Works_On` (
  `Essn` CHAR(9) NOT NULL,
  `Pno` INT NOT NULL,
  `Hours` DECIMAL(3,1) NULL,
  PRIMARY KEY (`Essn`, `Pno`),
  INDEX `fk_Works_On_Emp_idx` (`Essn` ASC) VISIBLE,
  CONSTRAINT `fk_Works_On_Project1`
    FOREIGN KEY (`Pno`)
    REFERENCES `A1_CompanyDB`.`Project` (`Pnumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Works_On_Employee1`
    FOREIGN KEY (`Essn`)
    REFERENCES `A1_CompanyDB`.`Employee` (`Ssn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `A1_CompanyDB`.`Dependents`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `A1_CompanyDB`.`Dependents` (
  `Essn` CHAR(9) NOT NULL,
  `Dependent_name` VARCHAR(15) NOT NULL,
  `Sex` CHAR NULL,
  `Bdate` DATE NULL,
  `Relationship` VARCHAR(8) NULL,
  PRIMARY KEY (`Essn`),
  CONSTRAINT `fk_Dependents_Employee1`
    FOREIGN KEY (`Essn`)
    REFERENCES `A1_CompanyDB`.`Employee` (`Ssn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `A1_CompanyDB`.`Department`
-- -----------------------------------------------------
START TRANSACTION;
USE `A1_CompanyDB`;
INSERT INTO `A1_CompanyDB`.`Department` (`Dname`, `Dnumber`, `Mgr_ssn`, `Mgr_start_date`) VALUES ('Research', 5, '333445555', '1988-05-22');
INSERT INTO `A1_CompanyDB`.`Department` (`Dname`, `Dnumber`, `Mgr_ssn`, `Mgr_start_date`) VALUES ('Administration', 4, '987654321', '1995-01-01');
INSERT INTO `A1_CompanyDB`.`Department` (`Dname`, `Dnumber`, `Mgr_ssn`, `Mgr_start_date`) VALUES ('Headquarters', 1, '888665555', '1981-06-19');

COMMIT;


-- -----------------------------------------------------
-- Data for table `A1_CompanyDB`.`Employee`
-- -----------------------------------------------------
START TRANSACTION;
USE `A1_CompanyDB`;
INSERT INTO `A1_CompanyDB`.`Employee` (`Fname`, `Minit`, `Lname`, `Ssn`, `BDate`, `Address`, `Sex`, `Salary`, `Super_ssn`, `Dno`) VALUES ('John', 'B', 'Smith', '123456789', '1965-01-09', '731 Fondren, Houston, TX', 'M', 30000, '333445555', 5);
INSERT INTO `A1_CompanyDB`.`Employee` (`Fname`, `Minit`, `Lname`, `Ssn`, `BDate`, `Address`, `Sex`, `Salary`, `Super_ssn`, `Dno`) VALUES ('Franklin', 'T', 'Wong', '333445555', '1955-12-08', '638 Voss, Houston, TX', 'M', 40000, '888665555', 5);
INSERT INTO `A1_CompanyDB`.`Employee` (`Fname`, `Minit`, `Lname`, `Ssn`, `BDate`, `Address`, `Sex`, `Salary`, `Super_ssn`, `Dno`) VALUES ('Alicia', 'J', 'Zelaya', '999887777', '1968-01-19', '3321 Castle, Spring, TX', 'F', 25000, '987654321', 4);
INSERT INTO `A1_CompanyDB`.`Employee` (`Fname`, `Minit`, `Lname`, `Ssn`, `BDate`, `Address`, `Sex`, `Salary`, `Super_ssn`, `Dno`) VALUES ('Jennifer', 'S', 'Wallace', '987654321', '1941-06-20', '291 Berry, Bellaire, TX', 'F', 43000, '888665555', 4);
INSERT INTO `A1_CompanyDB`.`Employee` (`Fname`, `Minit`, `Lname`, `Ssn`, `BDate`, `Address`, `Sex`, `Salary`, `Super_ssn`, `Dno`) VALUES ('Ramesh', 'K', 'Narayan', '666884444', '1962-09-15', '975 Fire Oak, Humble, TX', 'M', 38000, '333445555', 5);
INSERT INTO `A1_CompanyDB`.`Employee` (`Fname`, `Minit`, `Lname`, `Ssn`, `BDate`, `Address`, `Sex`, `Salary`, `Super_ssn`, `Dno`) VALUES ('Joyce', 'A', 'English', '453453453', '1972-07-31', '5631 Rice, Houston, TX', 'F', 25000, '333445555', 5);
INSERT INTO `A1_CompanyDB`.`Employee` (`Fname`, `Minit`, `Lname`, `Ssn`, `BDate`, `Address`, `Sex`, `Salary`, `Super_ssn`, `Dno`) VALUES ('Ahmad', 'V', 'Jabbar', '987987987', '1969-03-29', '980 Dallas, Houston, TX', 'M', 25000, '987654321', 4);
INSERT INTO `A1_CompanyDB`.`Employee` (`Fname`, `Minit`, `Lname`, `Ssn`, `BDate`, `Address`, `Sex`, `Salary`, `Super_ssn`, `Dno`) VALUES ('James', 'E', 'Borg', '888665555', '1937-11-10', '450 Stone, Houston, TX', 'M', 55000, NULL, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `A1_CompanyDB`.`Dept_Locations`
-- -----------------------------------------------------
START TRANSACTION;
USE `A1_CompanyDB`;
INSERT INTO `A1_CompanyDB`.`Dept_Locations` (`Dnumber`, `Dlocations`) VALUES (1, 'Houston');
INSERT INTO `A1_CompanyDB`.`Dept_Locations` (`Dnumber`, `Dlocations`) VALUES (4, 'Stafford');
INSERT INTO `A1_CompanyDB`.`Dept_Locations` (`Dnumber`, `Dlocations`) VALUES (5, 'Bellaire');

COMMIT;


-- -----------------------------------------------------
-- Data for table `A1_CompanyDB`.`Project`
-- -----------------------------------------------------
START TRANSACTION;
USE `A1_CompanyDB`;
INSERT INTO `A1_CompanyDB`.`Project` (`Pname`, `Pnumber`, `Plocation`, `Dnum`) VALUES ('ProductX', 1, 'Bellaire', 5);
INSERT INTO `A1_CompanyDB`.`Project` (`Pname`, `Pnumber`, `Plocation`, `Dnum`) VALUES ('Computerization', 10, 'Stafford', 4);
INSERT INTO `A1_CompanyDB`.`Project` (`Pname`, `Pnumber`, `Plocation`, `Dnum`) VALUES ('Reorganization', 20, 'Houston', 1);
INSERT INTO `A1_CompanyDB`.`Project` (`Pname`, `Pnumber`, `Plocation`, `Dnum`) VALUES ('Newbenefits', 30, 'Stafford', 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `A1_CompanyDB`.`Works_On`
-- -----------------------------------------------------
START TRANSACTION;
USE `A1_CompanyDB`;
INSERT INTO `A1_CompanyDB`.`Works_On` (`Essn`, `Pno`, `Hours`) VALUES ('123456789', 1, 32.5);
INSERT INTO `A1_CompanyDB`.`Works_On` (`Essn`, `Pno`, `Hours`) VALUES ('666884444', 1, 40);
INSERT INTO `A1_CompanyDB`.`Works_On` (`Essn`, `Pno`, `Hours`) VALUES ('453453453', 1, 20);
INSERT INTO `A1_CompanyDB`.`Works_On` (`Essn`, `Pno`, `Hours`) VALUES ('333445555', 1, 20);
INSERT INTO `A1_CompanyDB`.`Works_On` (`Essn`, `Pno`, `Hours`) VALUES ('333445555', 10, 10);
INSERT INTO `A1_CompanyDB`.`Works_On` (`Essn`, `Pno`, `Hours`) VALUES ('333445555', 20, 10);
INSERT INTO `A1_CompanyDB`.`Works_On` (`Essn`, `Pno`, `Hours`) VALUES ('999887777', 30, 30);
INSERT INTO `A1_CompanyDB`.`Works_On` (`Essn`, `Pno`, `Hours`) VALUES ('999887777', 10, 10);
INSERT INTO `A1_CompanyDB`.`Works_On` (`Essn`, `Pno`, `Hours`) VALUES ('987987987', 10, 35);
INSERT INTO `A1_CompanyDB`.`Works_On` (`Essn`, `Pno`, `Hours`) VALUES ('987987987', 30, 5);
INSERT INTO `A1_CompanyDB`.`Works_On` (`Essn`, `Pno`, `Hours`) VALUES ('987654321', 30, 20);
INSERT INTO `A1_CompanyDB`.`Works_On` (`Essn`, `Pno`, `Hours`) VALUES ('987654321', 20, 15);
INSERT INTO `A1_CompanyDB`.`Works_On` (`Essn`, `Pno`, `Hours`) VALUES ('888665555', 20, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `A1_CompanyDB`.`Dependents`
-- -----------------------------------------------------
START TRANSACTION;
USE `A1_CompanyDB`;
INSERT INTO `A1_CompanyDB`.`Dependents` (`Essn`, `Dependent_name`, `Sex`, `Bdate`, `Relationship`) VALUES ('333445555', 'Alice', 'F', '1986-04-05', 'Daughter');
INSERT INTO `A1_CompanyDB`.`Dependents` (`Essn`, `Dependent_name`, `Sex`, `Bdate`, `Relationship`) VALUES ('987654321', 'Abner', 'M', '1942-02-28', 'Spouse');
INSERT INTO `A1_CompanyDB`.`Dependents` (`Essn`, `Dependent_name`, `Sex`, `Bdate`, `Relationship`) VALUES ('123456789', 'Michael', 'M', '1988-01-04', 'Son');

COMMIT;

