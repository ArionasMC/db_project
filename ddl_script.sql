-- MySQL Script generated by MySQL Workbench
-- Thu May  2 12:11:59 2024
-- Model: New Model    Version: 1.0
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
-- Table `mydb`.`image`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`image` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` TEXT,
  `image_url` TEXT,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cuisine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cuisine` (
  `name` VARCHAR(128) NOT NULL,
  `image_id` INT NOT NULL,
  PRIMARY KEY (`name`),
  INDEX `fk_cuisine_image1_idx` (`image_id` ASC) VISIBLE,
  CONSTRAINT `fk_cuisine_image1`
    FOREIGN KEY (`image_id`)
    REFERENCES `mydb`.`image` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`food_team`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`food_team` (
  `short_name` VARCHAR(64) NOT NULL,
  `description` TEXT NOT NULL,
  `long_name` VARCHAR(64) NOT NULL COMMENT 'category',
  `image_id` INT NOT NULL,
  PRIMARY KEY (`short_name`),
  INDEX `fk_food_team_image1_idx` (`image_id` ASC) VISIBLE,
  CONSTRAINT `fk_food_team_image1`
    FOREIGN KEY (`image_id`)
    REFERENCES `mydb`.`image` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ingredient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ingredient` (
  `name` VARCHAR(64) NOT NULL,
  `cal_per_100` INT NULL,
  `food_team_short_name` VARCHAR(64) NOT NULL,
  `image_id` INT NOT NULL,
  PRIMARY KEY (`name`),
  INDEX `fk_ingredient_food_team1_idx` (`food_team_short_name` ASC) VISIBLE,
  INDEX `fk_ingredient_image1_idx` (`image_id` ASC) VISIBLE,
  CONSTRAINT `fk_ingredient_food_team1`
    FOREIGN KEY (`food_team_short_name`)
    REFERENCES `mydb`.`food_team` (`short_name`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_ingredient_image1`
    FOREIGN KEY (`image_id`)
    REFERENCES `mydb`.`image` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`recipe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`recipe` (
  `type` ENUM('Cooking', 'Pastry') NOT NULL,
  `difficulty` TINYINT NOT NULL CHECK (difficulty > 0 AND difficulty < 6),
  `name` VARCHAR(128) NOT NULL,
  `description` TEXT NULL,
  `prep_time_m` INT NOT NULL,
  `cook_time_m` INT NOT NULL COMMENT 'in minutes\n',
  `cuisine_name` VARCHAR(128) NOT NULL,
  `ingredient_name` VARCHAR(64) NOT NULL,
  `portions` INT NOT NULL,
  `image_id` INT NOT NULL,
  PRIMARY KEY (`name`, `cuisine_name`),
  INDEX `fk_recipe_cuisine_idx` (`cuisine_name` ASC) VISIBLE,
  INDEX `fk_recipe_ingredient1_idx` (`ingredient_name` ASC) VISIBLE,
  INDEX `fk_recipe_image1_idx` (`image_id` ASC) VISIBLE,
  CONSTRAINT `fk_recipe_cuisine`
    FOREIGN KEY (`cuisine_name`)
    REFERENCES `mydb`.`cuisine` (`name`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_recipe_ingredient1`
    FOREIGN KEY (`ingredient_name`)
    REFERENCES `mydb`.`ingredient` (`name`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_recipe_image1`
    FOREIGN KEY (`image_id`)
    REFERENCES `mydb`.`image` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`recipe_has_meal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`recipe_has_meal` (
  `recipe_name` VARCHAR(128) NOT NULL,
  `recipe_cuisine_name` VARCHAR(128) NOT NULL,
  `meal_type` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`recipe_name`, `recipe_cuisine_name`, `meal_type`),
  INDEX `fk_recipe_has_meal_recipe1_idx` (`recipe_name` ASC, `recipe_cuisine_name` ASC) VISIBLE,
  CONSTRAINT `fk_recipe_has_meal_recipe1`
    FOREIGN KEY (`recipe_name` , `recipe_cuisine_name`)
    REFERENCES `mydb`.`recipe` (`name` , `cuisine_name`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`recipe_has_label`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`recipe_has_label` (
  `recipe_name` VARCHAR(128) NOT NULL,
  `recipe_cuisine_name` VARCHAR(128) NOT NULL,
  `label_name` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`recipe_name`, `recipe_cuisine_name`, `label_name`),
  INDEX `fk_recipe_has_label_recipe1_idx` (`recipe_name` ASC, `recipe_cuisine_name` ASC) VISIBLE,
  CONSTRAINT `fk_recipe_has_label_recipe1`
    FOREIGN KEY (`recipe_name` , `recipe_cuisine_name`)
    REFERENCES `mydb`.`recipe` (`name` , `cuisine_name`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tip`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tip` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tip` VARCHAR(256) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`recipe_has_tip`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`recipe_has_tip` (
  `recipe_name` VARCHAR(128) NOT NULL,
  `recipe_cuisine_name` VARCHAR(128) NOT NULL,
  `tip_id` INT NOT NULL,
  PRIMARY KEY (`recipe_name`, `recipe_cuisine_name`, `tip_id`),
  INDEX `fk_recipe_has_tip_tip1_idx` (`tip_id` ASC) VISIBLE,
  INDEX `fk_recipe_has_tip_recipe1_idx` (`recipe_name` ASC, `recipe_cuisine_name` ASC) VISIBLE,
  CONSTRAINT `fk_recipe_has_tip_recipe1`
    FOREIGN KEY (`recipe_name` , `recipe_cuisine_name`)
    REFERENCES `mydb`.`recipe` (`name` , `cuisine_name`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_recipe_has_tip_tip1`
    FOREIGN KEY (`tip_id`)
    REFERENCES `mydb`.`tip` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

DELIMITER //

CREATE TRIGGER up_to_3_tips
BEFORE INSERT ON recipe_has_tip
FOR EACH ROW
BEGIN
    DECLARE tip_count INT;
    SELECT COUNT(*) INTO tip_count FROM recipe_has_tip WHERE recipe_name = NEW.recipe_name AND recipe_cuisine_name = NEW.recipe_cuisine_name;
    IF tip_count >= 3 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'A recipe can have up to 3 useful tips';
    END IF;
END//

DELIMITER ;


-- -----------------------------------------------------
-- Table `mydb`.`equipment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`equipment` (
  `name` VARCHAR(64) NOT NULL,
  `manual` TEXT,
  `image_id` INT NOT NULL,
  PRIMARY KEY (`name`),
  INDEX `fk_equipment_image1_idx` (`image_id` ASC) VISIBLE,
  CONSTRAINT `fk_equipment_image1`
    FOREIGN KEY (`image_id`)
    REFERENCES `mydb`.`image` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`recipe_has_equipment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`recipe_has_equipment` (
  `recipe_name` VARCHAR(128) NOT NULL,
  `recipe_cuisine_name` VARCHAR(128) NOT NULL,
  `equipment_name` VARCHAR(64) NOT NULL,
  PRIMARY KEY (`recipe_name`, `recipe_cuisine_name`, `equipment_name`),
  INDEX `fk_recipe_has_equipment_equipment1_idx` (`equipment_name` ASC) VISIBLE,
  INDEX `fk_recipe_has_equipment_recipe1_idx` (`recipe_name` ASC, `recipe_cuisine_name` ASC) VISIBLE,
  CONSTRAINT `fk_recipe_has_equipment_recipe1`
    FOREIGN KEY (`recipe_name` , `recipe_cuisine_name`)
    REFERENCES `mydb`.`recipe` (`name` , `cuisine_name`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_recipe_has_equipment_equipment1`
    FOREIGN KEY (`equipment_name`)
    REFERENCES `mydb`.`equipment` (`name`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`recipe_has_ingredient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`recipe_has_ingredient` (
  `recipe_name` VARCHAR(128) NOT NULL,
  `recipe_cuisine_name` VARCHAR(128) NOT NULL,
  `ingredient_name` VARCHAR(64) NOT NULL,
  `quantity` INT NULL DEFAULT 20,
  PRIMARY KEY (`recipe_name`, `recipe_cuisine_name`, `ingredient_name`),
  INDEX `fk_recipe_has_ingredient_ingredient1_idx` (`ingredient_name` ASC) VISIBLE,
  INDEX `fk_recipe_has_ingredient_recipe1_idx` (`recipe_name` ASC, `recipe_cuisine_name` ASC) VISIBLE,
  CONSTRAINT `fk_recipe_has_ingredient_recipe1`
    FOREIGN KEY (`recipe_name` , `recipe_cuisine_name`)
    REFERENCES `mydb`.`recipe` (`name` , `cuisine_name`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_recipe_has_ingredient_ingredient1`
    FOREIGN KEY (`ingredient_name`)
    REFERENCES `mydb`.`ingredient` (`name`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`theme`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`theme` (
  `name` VARCHAR(64) NOT NULL,
  `description` TEXT NOT NULL,
  `image_id` INT NOT NULL,
  PRIMARY KEY (`name`),
  INDEX `fk_theme_image1_idx` (`image_id` ASC) VISIBLE,
  CONSTRAINT `fk_theme_image1`
    FOREIGN KEY (`image_id`)
    REFERENCES `mydb`.`image` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`recipe_has_theme`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`recipe_has_theme` (
  `recipe_name` VARCHAR(128) NOT NULL,
  `recipe_cuisine_name` VARCHAR(128) NOT NULL,
  `theme_name` VARCHAR(64) NOT NULL,
  PRIMARY KEY (`recipe_name`, `recipe_cuisine_name`, `theme_name`),
  INDEX `fk_recipe_has_theme_theme1_idx` (`theme_name` ASC) VISIBLE,
  INDEX `fk_recipe_has_theme_recipe1_idx` (`recipe_name` ASC, `recipe_cuisine_name` ASC) VISIBLE,
  CONSTRAINT `fk_recipe_has_theme_recipe1`
    FOREIGN KEY (`recipe_name` , `recipe_cuisine_name`)
    REFERENCES `mydb`.`recipe` (`name` , `cuisine_name`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_recipe_has_theme_theme1`
    FOREIGN KEY (`theme_name`)
    REFERENCES `mydb`.`theme` (`name`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`step`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`step` (
  `number` INT NOT NULL,
  `description` TEXT NOT NULL,
  `recipe_name` VARCHAR(128) NOT NULL,
  `recipe_cuisine_name` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`recipe_name`, `recipe_cuisine_name`, `number`),
  INDEX `fk_step_recipe1_idx` (`recipe_name` ASC, `recipe_cuisine_name` ASC) VISIBLE,
  CONSTRAINT `fk_step_recipe1`
    FOREIGN KEY (`recipe_name` , `recipe_cuisine_name`)
    REFERENCES `mydb`.`recipe` (`name` , `cuisine_name`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`food_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`food_info` (
  `fat` INT NULL,
  `protein` INT NULL,
  `carbohydrate` INT NULL,
  `total_calories` INT NULL,
  `recipe_name` VARCHAR(128) NOT NULL,
  `recipe_cuisine_name` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`recipe_name`, `recipe_cuisine_name`),
  CONSTRAINT `fk_food_info_recipe1`
    FOREIGN KEY (`recipe_name` , `recipe_cuisine_name`)
    REFERENCES `mydb`.`recipe` (`name` , `cuisine_name`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`chef`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`chef` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(64) NOT NULL,
  `last_name` VARCHAR(16) NOT NULL,
  `phone` VARCHAR(32) NOT NULL,
  `date_of_birth` DATE NOT NULL,
  `age` INT DEFAULT 0,
  `years_exp` INT DEFAULT 0,
  `rank` ENUM('C Cook', 'B Cook', 'A Cook', 'Helper Cook', 'Chef') NOT NULL,
  `image_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_chef_image1_idx` (`image_id` ASC) VISIBLE,
  CONSTRAINT `fk_chef_image1`
    FOREIGN KEY (`image_id`)
    REFERENCES `mydb`.`image` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

DELIMITER //
CREATE TRIGGER `calculate_chef_age` BEFORE INSERT ON `mydb`.`chef` FOR EACH ROW
BEGIN
    SET new.age = DATE_FORMAT(FROM_DAYS(DATEDIFF(NOW(), new.date_of_birth)), "%Y")+0;
END
//
DELIMITER ; 

-- -----------------------------------------------------
-- Table `mydb`.`recipe_has_chef'
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `mydb`.`recipe_has_chef` (
  `recipe_name` VARCHAR(128) NOT NULL,
  `recipe_cuisine_name` VARCHAR(128) NOT NULL,
  `chef_id` INT NOT NULL,
  PRIMARY KEY (`recipe_name`, `recipe_cuisine_name`, `chef_id`),
  INDEX `fk_recipe_has_chef_chef1_idx` (`chef_id` ASC) VISIBLE,
  INDEX `fk_recipe_has_chef_recipe1_idx` (`recipe_name` ASC, `recipe_cuisine_name` ASC) VISIBLE,
  CONSTRAINT `fk_recipe_has_chef_recipe1`
    FOREIGN KEY (`recipe_name` , `recipe_cuisine_name`)
    REFERENCES `mydb`.`recipe` (`name` , `cuisine_name`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_recipe_has_chef_chef1`
    FOREIGN KEY (`chef_id`)
    REFERENCES `mydb`.`chef` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`chef_has_cuisine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`chef_has_cuisine` (
  `chef_id` INT NOT NULL,
  `cuisine_name` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`chef_id`, `cuisine_name`),
  INDEX `fk_chef_has_cuisine_cuisine1_idx` (`cuisine_name` ASC) VISIBLE,
  INDEX `fk_chef_has_cuisine_chef1_idx` (`chef_id` ASC) VISIBLE,
  CONSTRAINT `fk_chef_has_cuisine_chef1`
    FOREIGN KEY (`chef_id`)
    REFERENCES `mydb`.`chef` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_chef_has_cuisine_cuisine1`
    FOREIGN KEY (`cuisine_name`)
    REFERENCES `mydb`.`cuisine` (`name`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`episode`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`episode` (
  `id` INT NOT NULL,
  `year` INT NOT NULL,
  `image_id` INT NOT NULL,
  PRIMARY KEY (`id`, `year`),
  INDEX `fk_episode_image1_idx` (`image_id` ASC) VISIBLE,
  CONSTRAINT `fk_episode_image1`
    FOREIGN KEY (`image_id`)
    REFERENCES `mydb`.`image` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`episode_has_cuisine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`episode_has_cuisine` (
  `episode_id` INT NOT NULL,
  `episode_year` INT NOT NULL,
  `cuisine_name` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`episode_id`, `episode_year`, `cuisine_name`),
  INDEX `fk_episode_has_cuisine_cuisine1_idx` (`cuisine_name` ASC) VISIBLE,
  INDEX `fk_episode_has_cuisine_episode1_idx` (`episode_id` ASC, `episode_year` ASC) VISIBLE,
  CONSTRAINT `fk_episode_has_cuisine_episode1`
    FOREIGN KEY (`episode_id` , `episode_year`)
    REFERENCES `mydb`.`episode` (`id` , `year`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_episode_has_cuisine_cuisine1`
    FOREIGN KEY (`cuisine_name`)
    REFERENCES `mydb`.`cuisine` (`name`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`episode_has_chef`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`episode_has_chef` (
  `episode_id` INT NOT NULL,
  `episode_year` INT NOT NULL,
  `chef_id` INT NOT NULL,
  PRIMARY KEY (`episode_id`, `episode_year`, `chef_id`),
  INDEX `fk_episode_has_chef_chef1_idx` (`chef_id` ASC) VISIBLE,
  INDEX `fk_episode_has_chef_episode1_idx` (`episode_id` ASC, `episode_year` ASC) VISIBLE,
  CONSTRAINT `fk_episode_has_chef_episode1`
    FOREIGN KEY (`episode_id` , `episode_year`)
    REFERENCES `mydb`.`episode` (`id` , `year`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_episode_has_chef_chef1`
    FOREIGN KEY (`chef_id`)
    REFERENCES `mydb`.`chef` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`episode_judges`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`episode_judges` (
  `episode_id` INT NOT NULL,
  `episode_year` INT NOT NULL,
  `chef_id` INT NOT NULL,
  PRIMARY KEY (`episode_id`, `episode_year`, `chef_id`),
  INDEX `fk_episode_has_chef1_chef1_idx` (`chef_id` ASC) VISIBLE,
  INDEX `fk_episode_has_chef1_episode1_idx` (`episode_id` ASC, `episode_year` ASC) VISIBLE,
  CONSTRAINT `fk_episode_has_chef1_episode1`
    FOREIGN KEY (`episode_id` , `episode_year`)
    REFERENCES `mydb`.`episode` (`id` , `year`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_episode_has_chef1_chef1`
    FOREIGN KEY (`chef_id`)
    REFERENCES `mydb`.`chef` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`episode_has_recipe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`episode_has_recipe` (
  `episode_id` INT NOT NULL,
  `episode_year` INT NOT NULL,
  `recipe_name` VARCHAR(128) NOT NULL,
  `recipe_cuisine_name` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`episode_id`, `episode_year`, `recipe_name`, `recipe_cuisine_name`),
  INDEX `fk_episode_has_recipe_recipe1_idx` (`recipe_name` ASC, `recipe_cuisine_name` ASC) VISIBLE,
  INDEX `fk_episode_has_recipe_episode1_idx` (`episode_id` ASC, `episode_year` ASC) VISIBLE,
  CONSTRAINT `fk_episode_has_recipe_episode1`
    FOREIGN KEY (`episode_id` , `episode_year`)
    REFERENCES `mydb`.`episode` (`id` , `year`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_episode_has_recipe_recipe1`
    FOREIGN KEY (`recipe_name` , `recipe_cuisine_name`)
    REFERENCES `mydb`.`recipe` (`name` , `cuisine_name`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`grading`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`grading` (
  `episode_id` INT NOT NULL,
  `episode_year` INT NOT NULL,
  `judge_chef_id` INT NOT NULL,
  `participant_chef_id` INT NOT NULL,
  `grade` INT NOT NULL CHECK (grade > 0 AND grade < 6),
  PRIMARY KEY (`episode_id`, `episode_year`, `judge_chef_id`, `participant_chef_id`),
  INDEX `fk_episode_judges_has_episode_has_chef_episode_has_chef1_idx` (`participant_chef_id` ASC) VISIBLE,
  INDEX `fk_episode_judges_has_episode_has_chef_episode_judges1_idx` (`episode_id` ASC, `episode_year` ASC, `judge_chef_id` ASC) VISIBLE,
  CONSTRAINT `fk_episode_judges_has_episode_has_chef_episode_judges1`
    FOREIGN KEY (`episode_id` , `episode_year` , `judge_chef_id`)
    REFERENCES `mydb`.`episode_judges` (`episode_id` , `episode_year` , `chef_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_episode_judges_has_episode_has_chef_episode_has_chef1`
    FOREIGN KEY (`participant_chef_id`)
    REFERENCES `mydb`.`episode_has_chef` (`chef_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `username` VARCHAR(64) NOT NULL,
  `password` VARCHAR(64) NOT NULL,
  PRIMARY KEY (`username`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;