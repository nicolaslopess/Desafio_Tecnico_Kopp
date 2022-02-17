-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`tb_finaceiro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_finaceiro` (
  `identificacao_finaceiro` INT NOT NULL,
  `identificacao_re` INT NOT NULL,
  `pagamento` DOUBLE NOT NULL,
  PRIMARY KEY (`identificacao_finaceiro`, `identificacao_re`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tb_remessa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_remessa` (
  `identificacao_re` INT NOT NULL,
  `Identificacao_infracao` INT NOT NULL,
  `tb_finaceiro_identificacao_finaceiro` INT NOT NULL,
  `tb_finaceiro_identificacao_re` INT NOT NULL,
  `total_infracoes` DOUBLE NOT NULL,
  PRIMARY KEY (`identificacao_re`, `Identificacao_infracao`, `tb_finaceiro_identificacao_finaceiro`, `tb_finaceiro_identificacao_re`),
  INDEX `fk_tb_remessa_tb_finaceiro1_idx` (`tb_finaceiro_identificacao_finaceiro` ASC, `tb_finaceiro_identificacao_re` ASC) VISIBLE,
  CONSTRAINT `fk_tb_remessa_tb_finaceiro1`
    FOREIGN KEY (`tb_finaceiro_identificacao_finaceiro` , `tb_finaceiro_identificacao_re`)
    REFERENCES `mydb`.`tb_finaceiro` (`identificacao_finaceiro` , `identificacao_re`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tb_infracoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_infracoes` (
  `identificacao_infracao` INT NOT NULL AUTO_INCREMENT,
  `validade` VARCHAR(4) BINARY NOT NULL COMMENT 'yes or no.',
  `data_hora` DATETIME NOT NULL,
  `velocidade_permitida` INT(60) NOT NULL,
  `velocidade_media` INT(40) NOT NULL,
  `status` VARCHAR(45) NOT NULL COMMENT 'Criada, Expedida, Aceita e Não Aceita.',
  `remessa_identificacao_re` INT NOT NULL,
  `remessa_Identificacao_infracao` INT(1) NOT NULL,
  PRIMARY KEY (`identificacao_infracao`),
  INDEX `fk_tb_infracoes_remessa_idx` (`remessa_identificacao_re` ASC, `remessa_Identificacao_infracao` ASC) VISIBLE,
  CONSTRAINT `fk_tb_infracoes_remessa`
    FOREIGN KEY (`remessa_identificacao_re` , `remessa_Identificacao_infracao`)
    REFERENCES `mydb`.`tb_remessa` (`identificacao_re` , `Identificacao_infracao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
