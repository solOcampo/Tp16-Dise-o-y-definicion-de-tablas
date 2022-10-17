-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema tp-16
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema tp-16
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `tp-16` DEFAULT CHARACTER SET utf8mb3 ;
USE `tp-16` ;

-- -----------------------------------------------------
-- Table `tp-16`.`unidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tp-16`.`unidades` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(500) NOT NULL,
  `fechaInicio` DATE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `tp-16`.`cursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tp-16`.`cursos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(500) NOT NULL,
  `cupos` VARCHAR(45) NOT NULL,
  `fechaInicio` DATE NOT NULL,
  `fechaFinalizacion` DATE NOT NULL,
  `unidad` INT NOT NULL,
  `imagen` VARCHAR(100) NOT NULL,
  `unidad_id` INT NOT NULL,
  `visibilidad` TINYINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `unidades_cursos_id_idx` (`unidad_id` ASC) VISIBLE,
  CONSTRAINT `unidades_cursos_id`
    FOREIGN KEY (`unidad_id`)
    REFERENCES `tp-16`.`unidades` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `tp-16`.`bloque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tp-16`.`bloque` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  `marcaDeVisibilidad` VARCHAR(45) NOT NULL,
  `tipoDeDato` VARCHAR(45) NOT NULL,
  `contenido` VARCHAR(45) NOT NULL,
  `cursos_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `bloques_cursos_id_idx` (`cursos_id` ASC) VISIBLE,
  CONSTRAINT `bloques_cursos_id`
    FOREIGN KEY (`cursos_id`)
    REFERENCES `tp-16`.`cursos` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `tp-16`.`categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tp-16`.`categorias` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `tp-16`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tp-16`.`usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `contraseña` VARCHAR(45) NOT NULL,
  `categoria_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `categoria_id_idx` (`categoria_id` ASC) VISIBLE,
  CONSTRAINT `categorias`
    FOREIGN KEY (`categoria_id`)
    REFERENCES `tp-16`.`categorias` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `tp-16`.`usuarios_cursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tp-16`.`usuarios_cursos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuarios_id` INT NOT NULL,
  `cursos_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `usuarios_cursos_id_idx` (`usuarios_id` ASC) VISIBLE,
  INDEX `cursos_usuarios_id_idx` (`cursos_id` ASC) VISIBLE,
  CONSTRAINT `cursos_usuarios_id`
    FOREIGN KEY (`cursos_id`)
    REFERENCES `tp-16`.`cursos` (`id`),
  CONSTRAINT `usuarios_cursos_id`
    FOREIGN KEY (`usuarios_id`)
    REFERENCES `tp-16`.`usuarios` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
