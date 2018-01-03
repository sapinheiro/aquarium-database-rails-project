class AddStoredProceduresToFeedingLogs < ActiveRecord::Migration[5.1]
  def up

    execute <<-SQL
    -- ------------------------------------------
    -- Log a feeding
    -- ------------------------------------------
    CREATE PROCEDURE logFeeding(
    tank_IDID varchar(45), employee_IDID int, foodGiven varchar(45), quantityGiven double)

    BEGIN
    -- general error handler
    DECLARE sqlError INT DEFAULT FALSE;

    BEGIN
    -- Error handler setups
    DECLARE EXIT HANDLER FOR SQLEXCEPTION SET sqlError = TRUE;


    INSERT INTO feeding_logs (time, food, quantity, employee_ID, tank_ID) VALUES (NOW(), foodGiven, quantityGiven, employee_IDID, tank_IDID);
    SELECT CONCAT('feeding logged for tank_ID ', tank_IDID) AS 'result';

    END;

    IF sqlError = TRUE THEN
      SELECT CONCAT('SQL Error. Feeding not logged.') AS 'result';
      END IF;

    END;
SQL

execute <<-SQL
    -- ------------------------------------------
    -- View all feedings of one tank_ID
    -- ------------------------------------------

    CREATE PROCEDURE viewTankFeedings(ID int)
    BEGIN

    DECLARE notFound INT DEFAULT FALSE;

    SET notFound = (SELECT COUNT(*) FROM feeding_logs where ID = tank_ID);

    SELECT * FROM feeding_logs
      WHERE ID = tank_ID
        ORDER BY time DESC;


      IF notFound = 0 THEN
        SELECT CONCAT('Tank "', ID, '" does not exist.') AS 'result';
      END IF;
    END;

SQL

execute <<-SQL
    -- ------------------------------------------
    -- View all feedings by an employee_ID
    -- ------------------------------------------

    CREATE PROCEDURE viewEmployeeFeedings(ID int)
    BEGIN

    DECLARE notFound INT DEFAULT FALSE;

    SET notFound = (SELECT COUNT(*) FROM feeding_logs where ID = employee_ID);

    SELECT * FROM feeding_logs
      WHERE ID = employee_ID
        ORDER BY time DESC;


      IF notFound = 0 THEN
        SELECT CONCAT('Employee "', ID, '" does not exist.') AS 'result';
      END IF;
    END;
SQL

execute <<-SQL

    -- ------------------------------------------
    -- View all feedings on a certain date
    -- ------------------------------------------

    CREATE PROCEDURE viewDateFeedings(feedingDate DATE)
    BEGIN

    DECLARE notFound INT DEFAULT FALSE;

    SET notFound = (SELECT COUNT(*) FROM feeding_logs where DATE(time) = feedingDate);

    SELECT * FROM feeding_logs
      WHERE DATE(time) = feedingDate
        ORDER BY time DESC;


      IF notFound = 0 THEN
        SELECT CONCAT('No feedings on ', feedingDate) AS 'result';
      END IF;
    END;
SQL

execute <<-SQL
  CREATE PROCEDURE get_feeding
  (
    fID int(11),
      fTime datetime,
      fFood varchar(45),
      fQuantity float,
      fEmployee int(11),
      tID int(11)
  )
  BEGIN
    SELECT * FROM feeding_logs
      where (fID = feeding_id OR fID IS NULL) AND
      (fTime = time OR fTime IS NULL) AND
    (fFood = food OR fFood IS NULL) AND
     (fQuantity = quantity OR fQuantity is NULL) AND 
      (fEmployee = employee_ID OR fEmployee IS NULL) AND
      (tID = tank_ID OR tID is NULL);
  END;
SQL

    execute <<-SQL

CREATE TRIGGER add_feeding
BEFORE INSERT ON feeding_logs
  FOR EACH ROW
BEGIN
  IF New.food = '' THEN
    SIGNAL SQLSTATE 'HY000' -- 'HY000' indicates a general error
      SET MESSAGE_TEXT = 'Must input food type.';
  ELSEIF New.quantity IS NULL THEN
    SIGNAL SQLSTATE 'HY000'
      SET MESSAGE_TEXT = 'Must input a quantity';  
  ELSEIF New.quantity <= 0 THEN 
    SIGNAL SQLSTATE 'HY000'
      SET MESSAGE_TEXT = 'Must input a valid quantity';    
  END IF;

end;
SQL
  end

def down

execute <<-SQL
    DROP TRIGGER IF EXISTS add_feeding;
SQL

execute <<-SQL
    DROP PROCEDURE IF EXISTS logFeeding;
SQL

execute <<-SQL
     DROP PROCEDURE IF EXISTS viewTankFeedings;
SQL

execute <<-SQL
    DROP PROCEDURE IF EXISTS viewEmployeeFeedings;
SQL

execute <<-SQL
    DROP PROCEDURE IF EXISTS viewDateFeedings;
SQL

execute <<-SQL
    DROP PROCEDURE IF EXISTS get_feeding;
SQL

end
end
