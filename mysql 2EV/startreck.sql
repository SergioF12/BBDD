-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema startreck
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `startreck` ;

-- -----------------------------------------------------
-- Schema startreck
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `startreck` ;
SHOW WARNINGS;
USE `startreck` ;

-- -----------------------------------------------------
-- Table `personajes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `personajes` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `personajes` (
  `idPersonaje` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `raza` VARCHAR(45) NOT NULL,
  `rangoMilitar` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPersonaje`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `actores`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `actores` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `actores` (
  `idactor` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `personaje` VARCHAR(45) NOT NULL,
  `fechaNacimiento` VARCHAR(45) NOT NULL,
  `nacionalidad` VARCHAR(45) NOT NULL,
  `personajes_idPersonaje` INT NOT NULL,
  PRIMARY KEY (`idactor`, `personajes_idPersonaje`),
  INDEX `fk_actores_personajes_idx` (`personajes_idPersonaje` ASC) VISIBLE,
  CONSTRAINT `fk_actores_personajes`
    FOREIGN KEY (`personajes_idPersonaje`)
    REFERENCES `personajes` (`idPersonaje`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `personajes_has_personajes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `personajes_has_personajes` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `personajes_has_personajes` (
  `personajes_idPersonaje` INT NOT NULL,
  `personajes_idPersonaje1` INT NOT NULL,
  PRIMARY KEY (`personajes_idPersonaje`),
  INDEX `fk_personajes_has_personajes_personajes2_idx` (`personajes_idPersonaje1` ASC) VISIBLE,
  INDEX `fk_personajes_has_personajes_personajes1_idx` (`personajes_idPersonaje` ASC) VISIBLE,
  CONSTRAINT `fk_personajes_has_personajes_personajes1`
    FOREIGN KEY (`personajes_idPersonaje`)
    REFERENCES `personajes` (`idPersonaje`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_personajes_has_personajes_personajes2`
    FOREIGN KEY (`personajes_idPersonaje1`)
    REFERENCES `personajes` (`idPersonaje`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `peliculas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `peliculas` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `peliculas` (
  `idPelicula` INT NOT NULL,
  `añoLanzamiento` VARCHAR(45) NOT NULL,
  `titulo` VARCHAR(45) NOT NULL,
  `director` VARCHAR(45) NOT NULL,
  `personajes_idPersonaje` INT NOT NULL,
  PRIMARY KEY (`idPelicula`, `personajes_idPersonaje`),
  INDEX `fk_peliculas_personajes1_idx` (`personajes_idPersonaje` ASC) VISIBLE,
  CONSTRAINT `fk_peliculas_personajes1`
    FOREIGN KEY (`personajes_idPersonaje`)
    REFERENCES `personajes` (`idPersonaje`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `peliculas_has_personajes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `peliculas_has_personajes` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `peliculas_has_personajes` (
  `peliculas_idPelicula` INT NOT NULL,
  `peliculas_personajes_idPersonaje` INT NOT NULL,
  `personajes_idPersonaje` INT NOT NULL,
  PRIMARY KEY (`peliculas_idPelicula`, `peliculas_personajes_idPersonaje`, `personajes_idPersonaje`),
  INDEX `fk_peliculas_has_personajes_personajes1_idx` (`personajes_idPersonaje` ASC) VISIBLE,
  INDEX `fk_peliculas_has_personajes_peliculas1_idx` (`peliculas_idPelicula` ASC, `peliculas_personajes_idPersonaje` ASC) VISIBLE,
  CONSTRAINT `fk_peliculas_has_personajes_peliculas1`
    FOREIGN KEY (`peliculas_idPelicula` , `peliculas_personajes_idPersonaje`)
    REFERENCES `peliculas` (`idPelicula` , `personajes_idPersonaje`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_peliculas_has_personajes_personajes1`
    FOREIGN KEY (`personajes_idPersonaje`)
    REFERENCES `personajes` (`idPersonaje`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `capitulos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `capitulos` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `capitulos` (
  `idCapitulo` INT NOT NULL,
  `ordenRodaje` VARCHAR(45) NOT NULL,
  `temporada` VARCHAR(45) NOT NULL,
  `titulo` VARCHAR(45) NOT NULL,
  `fechaEmision` VARCHAR(45) NOT NULL,
  `personajesParticipantes` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCapitulo`, `ordenRodaje`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `capitulos_has_personajes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `capitulos_has_personajes` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `capitulos_has_personajes` (
  `capitulos_idCapitulo` INT NOT NULL,
  `capitulos_ordenRodaje` VARCHAR(45) NOT NULL,
  `personajes_idPersonaje` INT NOT NULL,
  PRIMARY KEY (`capitulos_idCapitulo`, `capitulos_ordenRodaje`, `personajes_idPersonaje`),
  INDEX `fk_capitulos_has_personajes_personajes1_idx` (`personajes_idPersonaje` ASC) VISIBLE,
  INDEX `fk_capitulos_has_personajes_capitulos1_idx` (`capitulos_idCapitulo` ASC, `capitulos_ordenRodaje` ASC) VISIBLE,
  CONSTRAINT `fk_capitulos_has_personajes_capitulos1`
    FOREIGN KEY (`capitulos_idCapitulo` , `capitulos_ordenRodaje`)
    REFERENCES `capitulos` (`idCapitulo` , `ordenRodaje`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_capitulos_has_personajes_personajes1`
    FOREIGN KEY (`personajes_idPersonaje`)
    REFERENCES `personajes` (`idPersonaje`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `planeta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `planeta` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `planeta` (
  `idPlaneta` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `galaxia` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPlaneta`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `nave`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nave` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `nave` (
  `idNave` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`idNave`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `planeta_has_capitulos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `planeta_has_capitulos` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `planeta_has_capitulos` (
  `planeta_idPlaneta` INT NOT NULL,
  `capitulos_idCapitulo` INT NOT NULL,
  `capitulos_ordenRodaje` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`planeta_idPlaneta`, `capitulos_idCapitulo`, `capitulos_ordenRodaje`),
  INDEX `fk_planeta_has_capitulos_capitulos1_idx` (`capitulos_idCapitulo` ASC, `capitulos_ordenRodaje` ASC) VISIBLE,
  INDEX `fk_planeta_has_capitulos_planeta1_idx` (`planeta_idPlaneta` ASC) VISIBLE,
  CONSTRAINT `fk_planeta_has_capitulos_planeta1`
    FOREIGN KEY (`planeta_idPlaneta`)
    REFERENCES `planeta` (`idPlaneta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_planeta_has_capitulos_capitulos1`
    FOREIGN KEY (`capitulos_idCapitulo` , `capitulos_ordenRodaje`)
    REFERENCES `capitulos` (`idCapitulo` , `ordenRodaje`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `planeta_has_capitulos_has_nave`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `planeta_has_capitulos_has_nave` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `planeta_has_capitulos_has_nave` (
  `planeta_has_capitulos_planeta_idPlaneta` INT NOT NULL,
  `planeta_has_capitulos_capitulos_idCapitulo` INT NOT NULL,
  `planeta_has_capitulos_capitulos_ordenRodaje` VARCHAR(45) NOT NULL,
  `nave_idNave` INT NOT NULL,
  `problema` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`planeta_has_capitulos_planeta_idPlaneta`, `planeta_has_capitulos_capitulos_idCapitulo`, `planeta_has_capitulos_capitulos_ordenRodaje`, `nave_idNave`),
  INDEX `fk_planeta_has_capitulos_has_nave_nave1_idx` (`nave_idNave` ASC) VISIBLE,
  INDEX `fk_planeta_has_capitulos_has_nave_planeta_has_capitulos1_idx` (`planeta_has_capitulos_planeta_idPlaneta` ASC, `planeta_has_capitulos_capitulos_idCapitulo` ASC, `planeta_has_capitulos_capitulos_ordenRodaje` ASC) VISIBLE,
  CONSTRAINT `fk_planeta_has_capitulos_has_nave_planeta_has_capitulos1`
    FOREIGN KEY (`planeta_has_capitulos_planeta_idPlaneta` , `planeta_has_capitulos_capitulos_idCapitulo` , `planeta_has_capitulos_capitulos_ordenRodaje`)
    REFERENCES `planeta_has_capitulos` (`planeta_idPlaneta` , `capitulos_idCapitulo` , `capitulos_ordenRodaje`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_planeta_has_capitulos_has_nave_nave1`
    FOREIGN KEY (`nave_idNave`)
    REFERENCES `nave` (`idNave`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
