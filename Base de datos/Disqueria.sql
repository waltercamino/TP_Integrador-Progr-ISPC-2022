-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Disqueria
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Disqueria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Disqueria` DEFAULT CHARACTER SET utf8 ;
USE `Disqueria` ;

-- -----------------------------------------------------
-- Table `Disqueria`.`Formato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Disqueria`.`Formato` (
  `id_formato` INT NOT NULL,
  `tipo` VARCHAR(50) NULL,
  PRIMARY KEY (`id_formato`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Disqueria`.`Interprete`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Disqueria`.`Interprete` (
  `id_interprete` INT NOT NULL,
  `nombre` VARCHAR(30) NULL,
  `foto` VARCHAR(50) NULL,
  PRIMARY KEY (`id_interprete`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Disqueria`.`Genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Disqueria`.`Genero` (
  `id_Genero` INT NOT NULL,
  `nombre` VARCHAR(30) NULL,
  PRIMARY KEY (`id_Genero`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Disqueria`.`Discografica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Disqueria`.`Discografica` (
  `id_discografica` INT NOT NULL,
  `nombre` VARCHAR(30) NULL,
  PRIMARY KEY (`id_discografica`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Disqueria`.`Album`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Disqueria`.`Album` (
  `id_album` INT NOT NULL AUTO_INCREMENT,
  `Cod_album` INT NOT NULL,
  `nombre` VARCHAR(30) NULL,
  `id_interprete` INT NOT NULL,
  `id_Genero` INT NOT NULL,
  `cant_temas` INT NULL,
  `id_discografica` INT NOT NULL,
  `id_formato` INT NOT NULL,
  `fech_lanzamiento` DATETIME NULL,
  `precio` INT NULL,
  `cantidad` INT NULL,
  `caratula` VARCHAR(50) NULL,
  PRIMARY KEY (`id_album`),
  UNIQUE INDEX `id_album_UNIQUE` (`id_album` ASC) ,
  INDEX `fk_Album_Formato_idx` (`id_formato` ASC) ,
  INDEX `fk_Album_Interprete1_idx` (`id_interprete` ASC) ,
  INDEX `fk_Album_Genero1_idx` (`id_Genero` ASC) ,
  INDEX `fk_Album_Discografica1_idx` (`id_discografica` ASC) ,
  CONSTRAINT `fk_Album_Formato`
    FOREIGN KEY (`id_formato`)
    REFERENCES `Disqueria`.`Formato` (`id_formato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Album_Interprete1`
    FOREIGN KEY (`id_interprete`)
    REFERENCES `Disqueria`.`Interprete` (`id_interprete`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Album_Genero1`
    FOREIGN KEY (`id_Genero`)
    REFERENCES `Disqueria`.`Genero` (`id_Genero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Album_Discografica1`
    FOREIGN KEY (`id_discografica`)
    REFERENCES `Disqueria`.`Discografica` (`id_discografica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Disqueria`.`Tema`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Disqueria`.`Tema` (
  `id_tema` INT NOT NULL,
  `titulo` VARCHAR(30) NULL,
  `duracion` INT NULL,
  `compositor` VARCHAR(30) NULL,
  `id_album` INT NOT NULL,
  `autor` VARCHAR(30) NULL,
  `id_interprete` INT NOT NULL,
  PRIMARY KEY (`id_tema`),
  INDEX `fk_Tema_Album1_idx` (`id_album` ASC),
  INDEX `fk_Tema_Interprete1_idx` (`id_interprete` ASC) ,
  CONSTRAINT `fk_Tema_Album1`
    FOREIGN KEY (`id_album`)
    REFERENCES `Disqueria`.`Album` (`id_album`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tema_Interprete1`
    FOREIGN KEY (`id_interprete`)
    REFERENCES `Disqueria`.`Interprete` (`id_interprete`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Disqueria`.`Interprete_has_Genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Disqueria`.`Interprete_has_Genero` (
  `Interprete_id_interprete` INT NOT NULL,
  `Genero_id_Genero` INT NOT NULL,
  PRIMARY KEY (`Interprete_id_interprete`, `Genero_id_Genero`),
  INDEX `fk_Interprete_has_Genero_Genero1_idx` (`Genero_id_Genero` ASC),
  INDEX `fk_Interprete_has_Genero_Interprete1_idx` (`Interprete_id_interprete` ASC) ,
  CONSTRAINT `fk_Interprete_has_Genero_Interprete1`
    FOREIGN KEY (`Interprete_id_interprete`)
    REFERENCES `Disqueria`.`Interprete` (`id_interprete`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Interprete_has_Genero_Genero1`
    FOREIGN KEY (`Genero_id_Genero`)
    REFERENCES `Disqueria`.`Genero` (`id_Genero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Disqueria`.`Interprete_has_Discografica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Disqueria`.`Interprete_has_Discografica` (
  `Interprete_id_interprete` INT NOT NULL,
  `Discografica_id_discografica` INT NOT NULL,
  PRIMARY KEY (`Interprete_id_interprete`, `Discografica_id_discografica`),
  INDEX `fk_Interprete_has_Discografica_Discografica1_idx` (`Discografica_id_discografica` ASC),
  INDEX `fk_Interprete_has_Discografica_Interprete1_idx` (`Interprete_id_interprete` ASC),
  CONSTRAINT `fk_Interprete_has_Discografica_Interprete1`
    FOREIGN KEY (`Interprete_id_interprete`)
    REFERENCES `Disqueria`.`Interprete` (`id_interprete`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Interprete_has_Discografica_Discografica1`
    FOREIGN KEY (`Discografica_id_discografica`)
    REFERENCES `Disqueria`.`Discografica` (`id_discografica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
