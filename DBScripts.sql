-- MySQL Script generated by MySQL Workbench
-- Mon May  1 13:21:13 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=5;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=9;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema DanceStudio
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `DanceStudio` ;

-- -----------------------------------------------------
-- Schema DanceStudio
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `DanceStudio` DEFAULT CHARACTER SET utf8 ;
USE `DanceStudio` ;

-- -----------------------------------------------------
-- Table `DanceStudio`.`Students`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DanceStudio`.`Students` ;

CREATE TABLE IF NOT EXISTS `DanceStudio`.`Students` (
  `student_id` INT NOT NULL,
  `first_name` VARCHAR(255) NOT NULL,
  `last_name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `phone_number` INT NOT NULL,
  PRIMARY KEY (`student_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DanceStudio`.`Instructors`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DanceStudio`.`Instructors` ;

CREATE TABLE IF NOT EXISTS `DanceStudio`.`Instructors` (
  `instructor_id` INT NOT NULL,
  `first_name` VARCHAR(255) NOT NULL,
  `last_name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `phone_number` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`instructor_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DanceStudio`.`StudioRoom`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DanceStudio`.`studio_room` ;

CREATE TABLE IF NOT EXISTS `DanceStudio`.`studio_room` (
  `room_id` INT NOT NULL  AUTO_INCREMENT,
  `room_name` VARCHAR(255) NOT NULL,
  `max_capacity` INT NOT NULL,  
  PRIMARY KEY (`room_id`)
  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DanceStudio`.`DanceStyle`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DanceStudio`.`dance_style` ;

CREATE TABLE IF NOT EXISTS `DanceStudio`.`dance_style` (
  `style_id` INT NOT NULL  AUTO_INCREMENT,
  `style_name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`style_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DanceStudio`.`room_reservations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DanceStudio`.`room_reservations` ;

CREATE TABLE IF NOT EXISTS `DanceStudio`.`room_reservations` (
  `reservation_id` INT NOT NULL AUTO_INCREMENT,
  `room_id` INT NOT NULL,  
  `class_id` INT NOT NULL,
  `class_start` DATETIME NULL,  
  `class_end` DATETIME NULL,
  `class_start_time` Time NULL,
  `class_end_time` Time NULL,
  `class_duration` int not null,  
  PRIMARY KEY (`reservation_id`),
  INDEX `fk_Instructors_has_StudioRoom_StudioRoom1_idx` (`room_id` ASC) VISIBLE,
  INDEX `fk_Instructors_has_StudioRoom_Instructors1_idx` (`class_id` ASC) VISIBLE,
  CONSTRAINT `fk_Instructors_has_StudioRoom_Instructors1`
    FOREIGN KEY (`room_id`)
    REFERENCES `DanceStudio`.`studio_room` (`room_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Instructors_has_StudioRoom_StudioRoom1`
    FOREIGN KEY (`class_id`)
    REFERENCES `DanceStudio`.`dance_class` (`class_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

ALTER TABLE `DanceStudio`.`room_reservations`
ADD COLUMN `status_id` INT NULL,
ADD CONSTRAINT `fk_roomreservations_status`
    FOREIGN KEY (`status_id`)
    REFERENCES `DanceStudio`.`class_status` (`status_id`);
    
ALTER TABLE `DanceStudio`.`room_reservations`
ADD COLUMN `booking_status_id` INT NULL,
ADD CONSTRAINT `fk_roomreservations_bookingstatus`
    FOREIGN KEY (`booking_status_id`)
    REFERENCES `DanceStudio`.`booking_status` (`status_id`);


-- -----------------------------------------------------
-- Table `DanceStudio`.`DanceClass`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DanceStudio`.`dance_class` ;

CREATE TABLE IF NOT EXISTS `DanceStudio`.`dance_class` (
  `class_id` INT NOT NULL,
  `class_name` VARCHAR(255) NULL,  
  `level` INT NULL,  
  `style_id` INT NOT NULL,
  PRIMARY KEY (`class_id`),  
 
  CONSTRAINT `fk_DanceClass_DanceStyle1`
    FOREIGN KEY (`style_id`)
    REFERENCES `DanceStudio`.`dance_style` (`style_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DanceStudio`.`class_reservations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DanceStudio`.`class_details` ;

CREATE TABLE IF NOT EXISTS `DanceStudio`.`class_details` (
  `class_reservation_id` INT NOT NULL AUTO_INCREMENT,
  `instructor_id` INT NOT NULL,
  `student_id` INT NOT NULL,
  `room_reservation_id` INT NOT NULL,
  `reservation_date` DATETIME NULL,
  PRIMARY KEY (`class_reservation_id`),  
  CONSTRAINT `fk_Students_has_DanceClass_Students1`
    FOREIGN KEY (`student_id`)
    REFERENCES `DanceStudio`.`students` (`student_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Students_has_DanceClass_DanceClass1`
    FOREIGN KEY (`instructor_id`)
    REFERENCES `DanceStudio`.`employees` (`id`),
  CONSTRAINT `fk_classreservations_roomreservation`
    FOREIGN KEY (`room_reservation_id`)
    REFERENCES `DanceStudio`.`room_reservations` (`reservation_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DanceStudio`.`Payment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DanceStudio`.`payment` ;

CREATE TABLE IF NOT EXISTS `DanceStudio`.`payment` (
  `payment_id` INT NOT NULL,
  `student_id` INT NULL,
  `class_id` INT NULL,
  `payment_amount` DECIMAL NULL,
  `payment_date` DATETIME NULL,
  `Students_student_id` INT NOT NULL,
  PRIMARY KEY (`payment_id`, `Students_student_id`),
  INDEX `fk_Payment_Students1_idx` (`Students_student_id` ASC) VISIBLE,
  CONSTRAINT `fk_Payment_Students1`
    FOREIGN KEY (`Students_student_id`)
    REFERENCES `DanceStudio`.`Students` (`student_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `DanceStudio`.`class_status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DanceStudio`.`class_status` ;

CREATE TABLE IF NOT EXISTS `DanceStudio`.`class_status` (
  `status_id` INT NOT NULL AUTO_INCREMENT,
  `status_name` VARCHAR(255) NULL,
  PRIMARY KEY (`status_id`)  
    )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `DanceStudio`.`booking_status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DanceStudio`.`booking_status` ;

CREATE TABLE IF NOT EXISTS `DanceStudio`.`booking_status` (
  `status_id` INT NOT NULL AUTO_INCREMENT,
  `status_name` VARCHAR(255) NULL,
  PRIMARY KEY (`status_id`)  
    )
ENGINE = InnoDB;
-- -----------------------------------------------------
-- VIEW FOR ROOM RESERCATIONS
-- -----------------------------------------------------
DROP VIEW IF EXISTS `DanceStudio`.`v_room_reservations`;

CREATE VIEW `DanceStudio`.`v_room_reservations` AS
    SELECT 
       dc.class_name, ds.Style_name, sr.room_name, CAST(rr.class_start AS DATE) class_start,CAST(rr.class_end AS DATE) class_end,rr.class_start_time, 
       rr.class_end_time,sr.max_capacity,cs.status_name class_status,bs.status_name booking_status
    FROM `DanceStudio`.`room_reservations` rr 
		inner join `DanceStudio`.`studio_room` sr    
			on rr.room_id = sr.room_id
        inner join `DanceStudio`.`dance_class` dc
			on rr.class_id = dc.class_id
		inner join `DanceStudio`.`dance_style` ds
			on dc.style_id = ds.style_id
		inner join `DanceStudio`.`class_status` cs
			on rr.status_id = cs.status_id
		inner join `DanceStudio`.`booking_status` bs
			on rr.booking_status_id = bs.status_id;
  
 select * from   `DanceStudio`.`v_room_reservations` ;   
 
 -- -----------------------------------------------------
-- VIEW FOR Student RESERCATIONS
-- -----------------------------------------------------
DROP VIEW IF EXISTS `DanceStudio`.`v_student_reservations`;

CREATE VIEW `DanceStudio`.`v_student_reservations` AS
    SELECT s.first_name, s.last_name, dc.class_name, e.name, sr.room_name, sr.max_capacity, 
    CAST(rr.class_start AS DATE) class_start,CAST(rr.class_end AS DATE) class_end,rr.class_start_time,rr.class_end_time
		FROM `DanceStudio`.`class_details` cd 
			inner join `DanceStudio`.`students` s
				on cd.student_id = s.student_id
			inner join `DanceStudio`.`employees` e
				on cd.instructor_id= e.id
			inner join room_reservations rr 
				on cd.room_reservation_id = rr.reservation_id
			inner join `DanceStudio`.`studio_room` sr    
				on rr.room_id = sr.room_id
			inner join `DanceStudio`.`dance_class` dc
				on rr.class_id = dc.class_id;        
  
 select * from   `DanceStudio`.`v_student_reservations` ;   
-- -----------------------------------------------------
-- STORED PROCEDURE TO CLACULATE THE STATUS OF A ROOM DEPENDING ON THE ROOM CAPACITY
-- -----------------------------------------------------
DROP  PROCEDURE IF EXISTS `DanceStudio`.sp_check_class_availability;

DELIMITER $$
CREATE PROCEDURE `DanceStudio`.sp_check_class_availability(
    IN_class_reservation_id INT    
)
BEGIN
    DECLARE capacity INT;
    DECLARE local_room_reservation_id INT;
    DECLARE students_enrolled INT;
   

    -- Get Room details from Class Reservation iD
    SELECT room_reservation_id INTO local_room_reservation_id 
		FROM `DanceStudio`.class_details 
			WHERE class_reservation_id = IN_class_reservation_id;

    -- get total number of students enrolled in a particular class
    SELECT COUNT(student_id) INTO students_enrolled
		FROM class_details
			WHERE room_reservation_id = local_room_reservation_id;
	
    -- get max capacity of the input room id
    SELECT sr.max_capacity room_reservations INTO capacity
    FROM room_reservations rr inner join studio_room sr
		ON rr.room_id = sr.room_id
    WHERE rr.reservation_id = local_room_reservation_id;
    
    -- if the total participants < max capacity then update the class status to AVAILABLE
    -- if the toal participants >= max capacity then update the class status to FULL
    IF students_enrolled < capacity THEN
        UPDATE room_reservations set booking_status_id = 2 WHERE reservation_id = local_room_reservation_id;
	ELSE
        UPDATE room_reservations set booking_status_id = 1 WHERE reservation_id = local_room_reservation_id;
    END IF;
END$$

call `DanceStudio`.sp_check_class_availability(22)

-- -----------------------------------------------------
-- STORED PROCEDURE TO UPDATE THE STATUS (COMPLETED) IF THE CURRENT DATE > END DATE 
-- -----------------------------------------------------
DROP  PROCEDURE IF EXISTS `DanceStudio`.sp_update_class_status;

DELIMITER $$
CREATE PROCEDURE `DanceStudio`.sp_update_class_status(IN_class_reservation_id INT)
BEGIN
    DECLARE reservation_id_for_update INT;
    DECLARE done INT DEFAULT FALSE;    
    DECLARE class_end_temp datetime;
    
	DECLARE update_status_cur CURSOR FOR 
  
	-- Get all Room Reservations which are in Active Status 
    SELECT reservation_id FROM room_reservations WHERE status_id = 4 and reservation_id != IN_class_reservation_id;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=TRUE;

  OPEN update_status_cur;
  read_loop: LOOP
    FETCH update_status_cur INTO reservation_id_for_update;

    IF done THEN
      LEAVE read_loop;
    END IF;
    
    SELECT class_end into class_end_temp FROM room_reservations WHERE reservation_id = reservation_id_for_update;

	-- For each record check if the Current Date > End Date, then mark the Class as Completed
    IF (CURDATE() > class_end_temp)  THEN
		UPDATE room_reservations SET status_id = 5 WHERE reservation_id = reservation_id_for_update;        
	END IF;
    SET done=FALSE;
  END LOOP;

  CLOSE update_status_cur;
END$$

call `DanceStudio`.sp_update_class_status()
-- -----------------------------------------------------
-- TRIGGER TO CALL STORED PROCEDURE AFTER EVERY INSERT INTO CLASS_DETAILS TABLE
-- -----------------------------------------------------
DROp TRIGGER IF EXISTS `DanceStudio`.t_class_details

DELIMITER $$
CREATE TRIGGER `DanceStudio`.t_class_details
AFTER INSERT
ON class_details FOR EACH ROW
BEGIN
    CALL `DanceStudio`.sp_check_class_availability (
       NEW.class_reservation_id
    );
END$$

DELIMITER ;
-- -----------------------------------------------------

-- -----------------------------------------------------
-- TRIGGER TO CALL STORED PROCEDURE AFTER EVERY INSERT INTO ROOM RESERVATIONS TABLE
-- -----------------------------------------------------
DROp TRIGGER IF EXISTS `DanceStudio`.t_room_reservations

DELIMITER $$
CREATE TRIGGER `DanceStudio`.t_room_reservations
AFTER INSERT
ON room_reservations FOR EACH ROW
BEGIN
    CALL `DanceStudio`.sp_update_class_status (NEW.reservation_id);
END$$

DELIMITER ;
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Report to show No of Students enrolled in each class with Max Capacity
-- -----------------------------------------------------


-- -----------------------------------------------------
-- Funtion to calculate and return the class sterength 
-- INPUT : Room Reservation ID
-- OUTPUT : Current Class Strength
-- -----------------------------------------------------
DROP FUNCTION IF EXISTS f_get_class_strength
DELIMITER //
CREATE FUNCTION f_get_class_strength ( room_reservation_id_in INT )
RETURNS INT
BEGIN
   DECLARE class_strength INT; 
    -- get total number of students enrolled in a particular class
    SELECT COUNT(student_id) INTO class_strength
		FROM class_details
			WHERE room_reservation_id = room_reservation_id_in;
   RETURN class_strength;
END; //
DELIMITER ;

SELECT f_get_class_strength(1)
-- -----------------------------------------------------
-- -----------------------------------------------------
-- FUNTION TO CHECK IF A CLASS IS VALID FOR REGISTRATION
-- INPUT : Room Reservation ID
-- OUTPUT : True or False indicating if the class is valid or not
-- -----------------------------------------------------
DROP FUNCTION IF EXISTS f_is_class_valid
DELIMITER //
CREATE FUNCTION f_is_class_valid ( room_reservation_id_in INT )
RETURNS boolean
BEGIN
   DECLARE isactive boolean; 
   DECLARE status varchar(50);
    -- class is valid if class is Active as long as it is Not Cancelled or Completed    
    SELECT cs.status_name INTO status
		FROM room_reservations rr inner join class_status cs
			on rr.status_id = cs.status_id
			WHERE reservation_id = room_reservation_id_in;
	IF status = 'Active' THEN
		SET isactive = 1;
    ELSE
		SET isactive = 0; 
	END IF;
    RETURN isactive;
END //
DELIMITER ;

SELECT f_is_class_valid(1)
-- -----------------------------------------------------


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

SET GLOBAL log_bin_trust_function_creators = 1;
