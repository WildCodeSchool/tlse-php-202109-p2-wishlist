-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema giftmefive
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema giftmefive
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `giftmefive` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `giftmefive` ;

-- -----------------------------------------------------
-- Table `giftmefive`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `giftmefive`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `lastname` VARCHAR(70) NOT NULL,
  `firstname` VARCHAR(70) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `password` VARCHAR(70) NOT NULL,
  `birthday` DATE NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `giftmefive`.`event`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `giftmefive`.`event` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `giftmefive`.`list`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `giftmefive`.`list` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `share_link` INT NOT NULL,
  `description` LONGTEXT NOT NULL,
  `limit_date` DATE NOT NULL,
  `creation_date` DATE NOT NULL,
  `user_id` INT NOT NULL,
  `event_id` INT NOT NULL,
  PRIMARY KEY (`id`, `user_id`, `event_id`),
  INDEX `fk_list_user_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_list_event1_idx` (`event_id` ASC) VISIBLE,
  CONSTRAINT `fk_list_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `giftmefive`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_list_event1`
    FOREIGN KEY (`event_id`)
    REFERENCES `giftmefive`.`event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `giftmefive`.`article`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `giftmefive`.`article` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `market_link` VARCHAR(255) NOT NULL,
  `picture` VARCHAR(255) NOT NULL,
  `price` FLOAT NOT NULL,
  `is_gifted` TINYINT NULL DEFAULT '0',
  `list_id` INT NOT NULL,
  PRIMARY KEY (`id`, `list_id`),
  INDEX `fk_article_list1_idx` (`list_id` ASC) VISIBLE,
  CONSTRAINT `fk_article_list1`
    FOREIGN KEY (`list_id`)
    REFERENCES `giftmefive`.`list` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
