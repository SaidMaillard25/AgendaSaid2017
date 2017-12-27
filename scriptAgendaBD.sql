SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `AgendaDB` DEFAULT CHARACTER SET utf8 ;
USE `AgendaDB` ;


-- Tablas de la BD
CREATE TABLE IF NOT EXISTS `AgendaDB`.`tbl_Usuario` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(128) NULL DEFAULT NULL,
  `Apellido_Paterno` VARCHAR(128) NULL DEFAULT NULL,
  `Apellido_Materno` VARCHAR(128) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `AgendaDB`.`tbl_NumeroTelefono` (
  `idtbl_NumeroTel` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `numero` VARCHAR(15) NULL,
  `tbl_Usuario_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idtbl_NumeroTel`, `tbl_Usuario_id`),
  INDEX `fk_tbl_NumeroTelefono_tbl_Usuario_idx` (`tbl_Usuario_id` ASC),
  CONSTRAINT `fk_tbl_NumeroTelefono_tbl_Usuario`
    FOREIGN KEY (`tbl_Usuario_id`)
    REFERENCES `AgendaDB`.`tbl_Usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `AgendaDB`.`tbl_CorreoElectronico` (
  `idtbl_CorreoElectronico` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `correo` VARCHAR(256) NULL,
  `tbl_Usuario_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idtbl_CorreoElectronico`, `tbl_Usuario_id`),
  INDEX `fk_tbl_CorreoElectronico_tbl_Usuario1_idx` (`tbl_Usuario_id` ASC),
  CONSTRAINT `fk_tbl_CorreoElectronico_tbl_Usuario1`
    FOREIGN KEY (`tbl_Usuario_id`)
    REFERENCES `AgendaDB`.`tbl_Usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS `AgendaDB`.`tbl_Grupo` (
  `idtbl_Grupo` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Nombre_Grupo` VARCHAR(128) NULL,
  PRIMARY KEY (`idtbl_Grupo`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `AgendaDB`.`tbl_Usuario_has_tbl_Grupo` (
  `tbl_Usuario_id` INT UNSIGNED NOT NULL,
  `tbl_Grupo_idtbl_Grupo` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`tbl_Usuario_id`, `tbl_Grupo_idtbl_Grupo`),
  INDEX `fk_tbl_Usuario_has_tbl_Grupo_tbl_Grupo1_idx` (`tbl_Grupo_idtbl_Grupo` ASC),
  INDEX `fk_tbl_Usuario_has_tbl_Grupo_tbl_Usuario1_idx` (`tbl_Usuario_id` ASC),
  CONSTRAINT `fk_tbl_Usuario_has_tbl_Grupo_tbl_Usuario1`
    FOREIGN KEY (`tbl_Usuario_id`)
    REFERENCES `AgendaDB`.`tbl_Usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_Usuario_has_tbl_Grupo_tbl_Grupo1`
    FOREIGN KEY (`tbl_Grupo_idtbl_Grupo`)
    REFERENCES `AgendaDB`.`tbl_Grupo` (`idtbl_Grupo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
