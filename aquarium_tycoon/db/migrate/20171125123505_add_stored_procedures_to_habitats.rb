class AddStoredProceduresToHabitats < ActiveRecord::Migration[5.1]
  def up
    execute <<-SQL
        CREATE PROCEDURE createHabitat(habitatName VARCHAR(45), habitatDescription VARCHAR(200))
          BEGIN

          -- Habitats must have unique names
          DECLARE duplicateName INT DEFAULT FALSE;
          -- general error handler
          DECLARE sqlError INT DEFAULT FALSE;

          BEGIN
          -- Error handler setups
          DECLARE CONTINUE HANDLER FOR 1062 SET duplicateName = TRUE;
          DECLARE EXIT HANDLER FOR SQLEXCEPTION SET sqlError = TRUE;
          INSERT INTO HABITATS (name, description, yearAdded) VALUES (habitatName, habitatDescription, YEAR(CURDATE()));
          SELECT CONCAT('new habitat "', habitatName, '" was inserted.') AS 'result';
          END;

          IF duplicateName = TRUE THEN
            SELECT CONCAT('Habitat "', habitatName, '" was not inserted - there is already a habitat with this name') AS 'result';
          ELSEIF sqlError = TRUE THEN
            SELECT CONCAT('SQL Error. Habitat "', habitatName, '" was not inserted') AS 'result';
          END IF;

          END;
    SQL

    execute <<-SQL
    -- --------------------------------------------
    -- delete a habitat by name
    -- --------------------------------------------

    CREATE PROCEDURE deleteHabitat(habitatName VARCHAR(45))
      BEGIN

      -- general error handler
      DECLARE sqlError INT DEFAULT FALSE;

      BEGIN
      -- Error handler setups
      DECLARE EXIT HANDLER FOR SQLEXCEPTION SET sqlError = TRUE;


      -- DELETE HABITAT, DELETE ALL ANIMALS IN IT? **************
      DELETE FROM HABITATS WHERE name = habitatName;

      END;

      IF sqlError = TRUE THEN
        SELECT CONCAT('SQL Error. Habitat "', habitatName, '" was not deleted') AS 'result';
      ELSE
        SELECT CONCAT('Habitat "', habitatName, '" removed.') AS 'result';
      END IF;

    END;
    SQL


    execute <<-SQL
    -- -------------------------------------
    -- view all habitats
    -- -------------------------------------

    CREATE PROCEDURE viewHabitat()
      BEGIN

      -- general error handler
      DECLARE sqlError INT DEFAULT FALSE;

      SELECT * FROM habitats;

      END;
    SQL

    execute <<-SQL
    -- -------------------------------------
    -- view habitat with the given name
    -- -------------------------------------

    CREATE PROCEDURE viewHabitatByName(habitatName VARCHAR(45))
      BEGIN

        DECLARE notFound INT DEFAULT FALSE;

        SET notFound = (SELECT COUNT(*) FROM habitats where name = habitatName);

        SELECT * FROM habitats
        WHERE name = habitatName;

        IF notFound = 0 THEN
          SELECT CONCAT('Habitat "', habitatName, '" does not exist.') AS 'result';
        END IF;

      END;
    SQL

    execute <<-SQL

    -- -------------------------------------
    -- view habitat by construction year
    -- -------------------------------------

    CREATE PROCEDURE viewHabitatByYear(constructionYear int)
      BEGIN

      DECLARE notFound INT DEFAULT FALSE;

      SET notFound = (SELECT COUNT(*) FROM habitats where yearAdded = constructionYear);

      SELECT * FROM habitats
        WHERE yearAdded = constructionYear;

      IF notFound = 0 THEN
        SELECT CONCAT('No habitats built in ', constructionYear) AS 'result';
      END IF;

    END;

    SQL

    execute <<-SQL
    -- ------------------------------------------
    -- update habitat name
    -- ------------------------------------------
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
      END;
    SQL

    execute <<-SQL
    -- ------------------------------------------
    -- update habitat description
    -- ------------------------------------------

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
      END;
    SQL

    execute <<-SQL
      CREATE PROCEDURE get_habitats
      (
        hID int(11),
          hName varchar(45),
          hDescription varchar(200),
          hYear int(11)
      )
      BEGIN
        SELECT * FROM habitats
          where (hID = habitatID OR hID IS NULL) AND
          (hName = name OR hName IS NULL) AND
        (hDescription = description OR hDescription IS NULL) AND
         (hYear = yearAdded OR hYear is NULL);
      END;
    SQL
    execute <<-SQL

CREATE TRIGGER update_habitat
BEFORE UPDATE ON habitats
  FOR EACH ROW
BEGIN
  IF New.name = '' THEN
    SIGNAL SQLSTATE 'HY000' -- 'HY000' indicates a general error
      SET MESSAGE_TEXT = 'Must input a title';
  ELSEIF New.description = '' THEN
    SIGNAL SQLSTATE 'HY000'
      SET MESSAGE_TEXT = 'Must input a description';    
  END IF;

end;
SQL

execute <<-SQL
CREATE TRIGGER add_habitat
BEFORE INSERT ON habitats
  FOR EACH ROW
BEGIN
  IF New.name = '' THEN
    SIGNAL SQLSTATE 'HY000' -- 'HY000' indicates a general error
      SET MESSAGE_TEXT = 'Must input a title';
  ELSEIF New.description = '' THEN
    SIGNAL SQLSTATE 'HY000'
      SET MESSAGE_TEXT = 'Must input a description';  
  END IF;
end;
SQL

  end

  def down
    execute <<-SQL
    	DROP TRIGGER IF EXISTS add_habitat;
	SQL
    execute <<-SQL
	DROP TRIGGER IF EXISTS update_habitat;
	SQL
    
	  
    execute <<-SQL
          DROP PROCEDURE IF EXISTS createHabitat;
    SQL

    execute <<-SQL
          DROP PROCEDURE IF EXISTS deleteHabitat;
    SQL

    execute <<-SQL
          DROP PROCEDURE IF EXISTS viewHabitat;
    SQL

    execute <<-SQL
          DROP PROCEDURE IF EXISTS viewHabitat;
    SQL

    execute <<-SQL
          DROP PROCEDURE IF EXISTS viewHabitatByName;
    SQL

    execute <<-SQL
          DROP PROCEDURE IF EXISTS viewHabitatByYear;
    SQL

    execute <<-SQL
      DROP PROCEDURE IF EXISTS updateHabitatName;
    SQL

    execute <<-SQL
      DROP PROCEDURE IF EXISTS updateHabitatDesscription;
    SQL

    execute <<-SQL
      DROP PROCEDURE IF EXISTS get_habitats;
    SQL
  end
end
