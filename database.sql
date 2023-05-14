-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema confectionery
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema confectionery
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `confectionery` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `confectionery` ;

-- -----------------------------------------------------
-- Table `confectionery`.`employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `confectionery`.`employees` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `full_name` VARCHAR(255) NOT NULL,
  `position` VARCHAR(255) NOT NULL,
  `phone` VARCHAR(12) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `enabled` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `phone_UNIQUE` (`phone` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `confectionery`.`role_employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `confectionery`.`role_employees` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `confectionery`.`authorities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `confectionery`.`authorities` (
  `id_user` INT NOT NULL,
  `id_authority` INT NOT NULL,
  PRIMARY KEY (`id_user`, `id_authority`),
  UNIQUE INDEX `id_user` (`id_user` ASC, `id_authority` ASC) VISIBLE,
  INDEX `id_authority` (`id_authority` ASC) VISIBLE,
  CONSTRAINT `authorities_ibfk_1`
    FOREIGN KEY (`id_user`)
    REFERENCES `confectionery`.`employees` (`id`),
  CONSTRAINT `authorities_ibfk_2`
    FOREIGN KEY (`id_authority`)
    REFERENCES `confectionery`.`role_employees` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `confectionery`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `confectionery`.`clients` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `full_name` VARCHAR(255) NOT NULL,
  `phone` VARCHAR(20) NOT NULL,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  `password` VARCHAR(255) NOT NULL,
  `delivery_address` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `phone_UNIQUE` (`phone` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `confectionery`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `confectionery`.`categories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `description` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `confectionery`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `confectionery`.`products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `category_id` INT NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `price` DECIMAL(10,2) NOT NULL,
  `image_url` VARCHAR(1024) NULL DEFAULT NULL,
  `is_stock` TINYINT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  INDEX `category_id` (`category_id` ASC) VISIBLE,
  CONSTRAINT `products_ibfk_1`
    FOREIGN KEY (`category_id`)
    REFERENCES `confectionery`.`categories` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `confectionery`.`cart_items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `confectionery`.`cart_items` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `client_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `quantity` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `client_id` (`client_id` ASC) VISIBLE,
  INDEX `product_id` (`product_id` ASC) VISIBLE,
  CONSTRAINT `cart_items_ibfk_1`
    FOREIGN KEY (`client_id`)
    REFERENCES `confectionery`.`clients` (`id`),
  CONSTRAINT `cart_items_ibfk_2`
    FOREIGN KEY (`product_id`)
    REFERENCES `confectionery`.`products` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 63
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `confectionery`.`payments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `confectionery`.`payments` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `payment_method` ENUM('FOX', 'QIWI') NOT NULL,
  `status` ENUM('COMPLETED', 'DECLINED', 'CANCELED', 'PENDING', 'APPROVED', 'REFUNDED', 'PROCESSING') NOT NULL,
  `payment_date` DATETIME NULL DEFAULT NULL,
  `amount` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `confectionery`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `confectionery`.`orders` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `client_id` INT NULL DEFAULT NULL,
  `order_date` DATETIME NOT NULL,
  `status` ENUM('NEW', 'IN_PROCESS', 'IN_PRODUCTION', 'READY_FOR_PICKUP', 'FULFILLED', 'CANCELLED') NOT NULL,
  `total_cost` DECIMAL(10,2) NOT NULL,
  `payment_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `client_id` (`client_id` ASC) VISIBLE,
  INDEX `payment_id` (`payment_id` ASC) VISIBLE,
  CONSTRAINT `orders_ibfk_1`
    FOREIGN KEY (`client_id`)
    REFERENCES `confectionery`.`clients` (`id`),
  CONSTRAINT `orders_ibfk_2`
    FOREIGN KEY (`payment_id`)
    REFERENCES `confectionery`.`payments` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `confectionery`.`ordered_products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `confectionery`.`ordered_products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `order_id` INT NULL DEFAULT NULL,
  `product_id` INT NULL DEFAULT NULL,
  `quantity` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `order_id` (`order_id` ASC) VISIBLE,
  INDEX `product_id` (`product_id` ASC) VISIBLE,
  CONSTRAINT `ordered_products_ibfk_1`
    FOREIGN KEY (`order_id`)
    REFERENCES `confectionery`.`orders` (`id`),
  CONSTRAINT `ordered_products_ibfk_2`
    FOREIGN KEY (`product_id`)
    REFERENCES `confectionery`.`products` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `confectionery`.`suppliers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `confectionery`.`suppliers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `phone` VARCHAR(20) NULL DEFAULT NULL,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  `address` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `confectionery`.`purchases`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `confectionery`.`purchases` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `supplier_id` INT NULL DEFAULT NULL,
  `product_id` INT NULL DEFAULT NULL,
  `purchase_date` DATETIME NOT NULL,
  `quantity` INT NOT NULL,
  `purchase_price` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `supplier_id` (`supplier_id` ASC) VISIBLE,
  INDEX `product_id` (`product_id` ASC) VISIBLE,
  CONSTRAINT `purchases_ibfk_1`
    FOREIGN KEY (`supplier_id`)
    REFERENCES `confectionery`.`suppliers` (`id`),
  CONSTRAINT `purchases_ibfk_2`
    FOREIGN KEY (`product_id`)
    REFERENCES `confectionery`.`products` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
