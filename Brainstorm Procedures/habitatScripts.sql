USE aquariumdb;

-- ==========================================
-- HABITAT
-- ==========================================


-- ------------------------------------------
-- Create a new habitat
-- ------------------------------------------

DROP PROCEDURE IF EXISTS createHabitat;

DELIMITER // 
CREATE PROCEDURE createHabitat(habitatName VARCHAR(45), habitatDescription VARCHAR(200))
BEGIN 
   
INSERT INTO HABITATS (name, description, yearAdded) VALUES (habitatName, habitatDescription, YEAR(CURDATE()));
SELECT CONCAT('new habitat "', habitatName, '" was inserted.') AS 'result';    

END //

DELIMITER ;

-- ------------------------------------------------
-- Trigger to throw error if duplicate habitat name
-- ------------------------------------------------
DROP TRIGGER IF EXISTS createHabitatErrors;

DELIMITER //

CREATE TRIGGER createHabitatErrors
  BEFORE INSERT ON habitats
	FOR EACH ROW
		BEGIN
		 IF NEW.name IN (SELECT name FROM habitats) THEN
			SIGNAL SQLSTATE '45000'
           
			  SET MESSAGE_TEXT = 'That habitat already exists';
		  END IF;
END//

DELIMITER ;
SELECT * FROM HABITATS;

-- --------------------------------------------
-- delete a habitat by name
-- --------------------------------------------

DROP PROCEDURE IF EXISTS deleteHabitat;

DELIMITER // 
CREATE PROCEDURE deleteHabitat(habitatName VARCHAR(45))
BEGIN 

DELETE FROM HABITATS WHERE name = habitatName;

	SELECT CONCAT('Habitat "', habitatName, '" removed.') AS 'result';    


END //

DELIMITER ;

-- -------------------------------------
-- view all habitats
-- -------------------------------------

DROP PROCEDURE IF EXISTS viewHabitat;

DELIMITER // 
CREATE PROCEDURE viewHabitat()
BEGIN 

-- general error handler
DECLARE sqlError INT DEFAULT FALSE;

SELECT * FROM habitats;

END //

DELIMITER ;

-- -------------------------------------
-- view habitat with the given name
-- -------------------------------------

DROP PROCEDURE IF EXISTS viewHabitatByName;

DELIMITER // 
CREATE PROCEDURE viewHabitatByName(habitatName VARCHAR(45))
BEGIN 

DECLARE notFound INT DEFAULT FALSE;

SET notFound = (SELECT COUNT(*) FROM habitats where name = habitatName);

SELECT * FROM habitats 
	WHERE name = habitatName;

 
  IF notFound = 0 THEN
    SELECT CONCAT('Habitat "', habitatName, '" does not exist.') AS 'result';
  END IF;

END //

DELIMITER ;

-- -------------------------------------
-- view habitat by construction year
-- -------------------------------------

DROP PROCEDURE IF EXISTS viewHabitatByYear;

DELIMITER // 
CREATE PROCEDURE viewHabitatByYear(constructionYear int)
BEGIN 

DECLARE notFound INT DEFAULT FALSE;

SET notFound = (SELECT COUNT(*) FROM habitats where yearAdded = constructionYear);

SELECT * FROM habitats 
	WHERE yearAdded = constructionYear;
 
  IF notFound = 0 THEN
    SELECT CONCAT('No habitats built in ', constructionYear) AS 'result';
  END IF;

END //

DELIMITER ;

-- ------------------------------------------
-- update habitat name
-- ------------------------------------------


DROP PROCEDURE IF EXISTS updateHabitatName;

DELIMITER // 
CREATE PROCEDURE updateHabitatName(ID int, newName varchar(45))
BEGIN 
DECLARE habitatExist INT DEFAULT 0;
SET habitatExist = (SELECT COUNT(*) FROM habitats WHERE habitatID = ID);

UPDATE habitats
SET name = newName WHERE habitatID = ID;

IF habitatExist = 0 THEN 
	SELECT CONCAT('Habitat ', ID, ' does not exist') as 'result';
ELSEIF employeeExist = 1 THEN
	SELECT CONCAT('Habitat ', ID, '''s name updated to ', newName) as 'result';
END IF;
END //

DELIMITER ;

-- ------------------------------------------
-- update habitat description
-- ------------------------------------------


DROP PROCEDURE IF EXISTS updateHabitatDescription;

DELIMITER // 
CREATE PROCEDURE updateHabitatDescription(ID int, newDescription varchar(200))
BEGIN 
DECLARE habitatExist INT DEFAULT 0;
SET habitatExist = (SELECT COUNT(*) FROM habitats WHERE habitatID = ID);

UPDATE habitats
SET description = newDescription WHERE habitatID = ID;

IF habitatExist = 0 THEN 
	SELECT CONCAT('Habitat ', ID, ' does not exist') as 'result';
ELSEIF employeeExist = 1 THEN
	SELECT CONCAT('Habitat ', ID, '''s description updated to ', newDescription) as 'result';
END IF;
END //

DELIMITER ;
