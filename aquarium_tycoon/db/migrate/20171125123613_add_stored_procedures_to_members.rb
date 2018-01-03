class AddStoredProceduresToMembers < ActiveRecord::Migration[5.1]
  def up
    
execute <<-SQL
    -- ------------------------------------------
    -- Add a new member
    -- ------------------------------------------

    CREATE PROCEDURE addMember(fName varchar(45), lName varchar(45), expirationDate date, feePaid float)
    BEGIN 

    -- general error handler
    DECLARE sqlError INT DEFAULT FALSE;

    BEGIN
    -- Error handler setups
    DECLARE EXIT HANDLER FOR SQLEXCEPTION SET sqlError = TRUE;


    INSERT INTO Members (firstName, lastName, dateJoined, expirationDate, fee) 
      VALUES (fName, lName, CURDATE(), DATE_ADD(curdate(), INTERVAL 18 month), feePaid)  ;
    SELECT CONCAT('new member "', fName, ' ', lastName, '" was inserted.') AS 'result';    

    END; 
      IF sqlError = TRUE THEN
      SELECT CONCAT('SQL Error. Member "', fName, ' ', lastName, '" was not inserted') AS 'result';    
      END IF;

    END;
SQL

execute <<-SQL
    -- ------------------------------------------
    -- View all members
    -- ------------------------------------------

    CREATE PROCEDURE viewMembers()
    BEGIN 

    SELECT * FROM members
      ORDER BY dateJoined DESC;
    END;
SQL

execute <<-SQL
    -- -----------------------------------------------------
    -- View members expiring within the given number of days
    -- -----------------------------------------------------

    CREATE PROCEDURE expiringMembers(days int)
    BEGIN 

    SELECT * FROM events
      WHERE expirationDate <= DATE_ADD(curdate(), INTERVAL days day)
        ORDER BY time DESC;

    END;

SQL
    
execute <<-SQL

    -- -----------------------------------------------------
    -- Update member: renew membership
    -- -----------------------------------------------------

    CREATE PROCEDURE renewMember(memID int, Newfee float) 

    BEGIN 
    DECLARE memberExist INT DEFAULT 0;
    SET memberExist = (SELECT COUNT(*) FROM members WHERE memID = memberID);

    UPDATE members
    SET expirationDate = DATE_ADD(expirationDate, INTERVAL 18 month), fee = newFee
    WHERE memID = memberID;

    IF memberExist = 0 THEN 
      SELECT CONCAT('Member ', memID, ' does not exist') as 'result';
    ELSEIF memberExist = 1 THEN
      SELECT CONCAT('Member ', memID, ' has renewed their membership.') as 'result';
    END IF;
    END;

SQL
    
execute <<-SQL
    -- ------------------------------------------
    -- delete member
    -- ------------------------------------------

    CREATE PROCEDURE deleteMember(ID int)
    BEGIN 
    DECLARE memberExist INT DEFAULT 0;
    DECLARE sqlError TINYINT DEFAULT FALSE;

    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET sqlError = TRUE;
    SET memberExist = (SELECT COUNT(*) FROM members WHERE ID = memberID);

    DELETE FROM Members WHERE ID = memberID;

    IF sqlError = FALSE and employeeExist = 1 THEN
        SELECT CONCAT('Employee ', ID, ' no longer a member.') as 'result';
    ELSE
      SELECT CONCAT('cannot remove employee ', ID, '.') as 'result';

    END IF;
    END;

SQL

execute <<-SQL
  CREATE PROCEDURE get_member
  (
    memID int(11),
      fName varchar(45),
      lName varchar(45),
      joined date,
      exp date,
      mFee double
  )
  BEGIN
    SELECT * FROM members
      where (memID = memberID OR memID IS NULL) AND
      (fname = firstName OR fName IS NULL) AND
    (lName = lastName OR lName IS NULL) AND
     ( joined = dateJoined OR joined is NULL) AND 
      ( exp = expirationDate OR exp is NULL) AND
      (mFee = fee OR mFee IS NULL);
  END;
SQL

execute <<-SQL
  CREATE FUNCTION get_member_count
  (
    memID int(11),
      fName varchar(45),
      lName varchar(45),
      joined date,
      exp date,
      mFee double
  )
  RETURNS INT
  BEGIN
    DECLARE memCount INT;
      
    SELECT count(*)
      INTO memCount
      FROM members
      where (memID = memberID OR memID IS NULL) AND
      (fname = firstName OR fName IS NULL) AND
    (lName = lastName OR lName IS NULL) AND
     ( joined = dateJoined OR joined is NULL) AND 
      ( exp = expirationDate OR exp is NULL) AND
      (mFee = fee OR mFee IS NULL);
      
      RETURN memCount;
  END;
SQL

execute <<-SQL
-- ------------------------------------------
-- Trigger Update members
-- -------------------------------------------
CREATE TRIGGER invalid_member_update
 BEFORE UPDATE ON members
  FOR EACH ROW
BEGIN
  IF New.fee < 100 THEN
    SIGNAL SQLSTATE 'HY000' -- 'HY000' indicates a general error
      SET MESSAGE_TEXT = 'Fee must be greater than $100';
  ELSEIF New.first_name = '' THEN
    SIGNAL SQLSTATE 'HY000'
      SET MESSAGE_TEXT = 'First name must be input';  
    ELSEIF New.last_name = '' THEN
    SIGNAL SQLSTATE 'HY000'
      SET MESSAGE_TEXT = 'Last name must be input';    
  END IF;
  END;
SQL
    
execute <<-SQL
-- ------------------------------------------
-- Trigger Insert members
-- -------------------------------------------
CREATE TRIGGER invalid_member_insert
 BEFORE INSERT ON members
  FOR EACH ROW
BEGIN
  IF New.fee < 100 THEN
    SIGNAL SQLSTATE 'HY000' -- 'HY000' indicates a general error
      SET MESSAGE_TEXT = 'Fee must be greater than $100';
        ELSEIF New.first_name = '' THEN
    SIGNAL SQLSTATE 'HY000'
      SET MESSAGE_TEXT = 'First name must be input';  
    ELSEIF New.last_name = '' THEN
    SIGNAL SQLSTATE 'HY000'
      SET MESSAGE_TEXT = 'Last name must be input';   
  END IF;
  END;
SQL

execute <<-SQL
CREATE PROCEDURE current_members()
BEGIN
SELECT * FROM members WHERE expiration_date >= CURDATE() ORDER BY last_name asc;
END;
SQL

  end
  
def down

execute <<-SQL
  DROP PROCEDURE IF EXISTS current_members;
  SQL
execute <<-SQL
  DROP TRIGGER IF EXISTS invalid_member_update;
SQL
  
execute <<-SQL
  DROP TRIGGER IF EXISTS invalid_member_insert;
SQL
  
execute <<-SQL
  DROP PROCEDURE IF EXISTS addMember;
SQL
  
execute <<-SQL
  DROP PROCEDURE IF EXISTS viewMembers;
SQL
  
execute <<-SQL
  DROP PROCEDURE IF EXISTS expiringMembers;
SQL  
  
execute <<-SQL
  DROP PROCEDURE IF EXISTS renewMember;
SQL
  
execute <<-SQL
  DROP PROCEDURE IF EXISTS deleteMember;
SQL

execute <<-SQL
  DROP PROCEDURE IF EXISTS get_member;
SQL

execute <<-SQL
  DROP FUNCTION IF EXISTS get_member_count;
SQL
  
end
  
end
