class AddStoredProceduresToEvents < ActiveRecord::Migration[5.1]
  def up

execute <<-SQL
    -- ------------------------------------------
    -- Create an Event
    -- ------------------------------------------
    CREATE PROCEDURE createEvent(eventName VARCHAR(45), eventDescription VARCHAR(45), price float, manager int, guestsPerPerson int, maxGuests int, eventStart datetime)
    BEGIN

    -- general error handler
    DECLARE sqlError INT DEFAULT FALSE;

    BEGIN
    -- Error handler setups
    DECLARE EXIT HANDLER FOR SQLEXCEPTION SET sqlError = TRUE;


    INSERT INTO Events (title, description, price, managing_employee, max_guests_per_person, max_attending, event_date)
      VALUES (eventName , eventDescription, price, manager, guestsPerPerson, maxGuests, eventStart);
    SELECT CONCAT('new event "', eventName, '" was inserted.') AS 'result';

    END;

      IF sqlError = TRUE THEN
      SELECT CONCAT('SQL Error. Event "', eventName, '" was not inserted') AS 'result';
      END IF;

    END;
SQL

execute <<-SQL
    -- ------------------------------------------
    -- View all events
    -- ------------------------------------------
    CREATE PROCEDURE viewEvents()
    BEGIN

    SELECT * FROM events
      ORDER BY event_date DESC;
    END;

SQL

execute <<-SQL

    -- --------------------------------------------
    -- View all events managed by a given employee
    -- --------------------------------------------
    CREATE PROCEDURE viewEventsByManager(ID int)
    BEGIN

    DECLARE notFound INT DEFAULT FALSE;

    SET notFound = (SELECT COUNT(*) FROM events where managing_employee = ID);

    SELECT * FROM events
      WHERE ID = Managingemployee
        ORDER BY time DESC;


      IF notFound = 0 THEN
        SELECT CONCAT('Employee "', ID, '" does not have any upcoming events.') AS 'result';
      END IF;
    END;

SQL

execute <<-SQL

    -- --------------------------------------------
    -- View all events within a given price range
    -- --------------------------------------------

    CREATE PROCEDURE viewEventsByPrice(low float, high float)
    BEGIN

    SELECT * FROM events
      WHERE price >= low AND price <=high
        ORDER BY time DESC;

    END;

SQL

execute <<-SQL

    -- --------------------------------------------
    -- View all events for a given month and year
    -- --------------------------------------------
    CREATE PROCEDURE viewEventsByDate(Eyear int, Emonth int)
    BEGIN

    SELECT * FROM events
      WHERE MONTH(event_date) = Emonth AND YEAR(event_date) = Eyear
        ORDER BY time DESC;

    END;

SQL

execute <<-SQL

    -- --------------------------------------------
    -- Update event title
    -- --------------------------------------------

    CREATE PROCEDURE updateEventTitle(eventNo int, newTitle varchar(45))
    BEGIN
    DECLARE eventExist INT DEFAULT 0;
    SET eventExist = (SELECT COUNT(*) FROM events WHERE eventNo = event_ID);

    UPDATE events
    SET title = newTitle WHERE eventNo = event_ID;

    IF eventExist = 0 THEN
      SELECT CONCAT('Event ', eventNo, ' does not exist') as 'result';
    ELSEIF eventExist = 1 THEN
      SELECT CONCAT('Event ', eventNo, '''s title updated to ', newTitle) as 'result';
    END IF;
    END;

SQL

execute <<-SQL

    -- --------------------------------------------
    -- Update event description
    -- --------------------------------------------

    CREATE PROCEDURE updateEventDescription(eventNo int, newDescription varchar(45))
    BEGIN
    DECLARE eventExist INT DEFAULT 0;
    SET eventExist = (SELECT COUNT(*) FROM events WHERE eventNo = event_ID);

    UPDATE events
    SET description = newDescription WHERE eventNo = event_ID;

    IF eventExist = 0 THEN
      SELECT CONCAT('Event ', eventNo, ' does not exist') as 'result';
    ELSEIF eventExist = 1 THEN
      SELECT CONCAT('Event ', eventNo, '''s description updated to ', newDescription) as 'result';
    END IF;
    END;

SQL

execute <<-SQL

    -- --------------------------------------------
    -- Update event manager
    -- --------------------------------------------

   CREATE PROCEDURE updateEventManager(eventNo int, newManager int)
    BEGIN
    DECLARE eventExist INT DEFAULT 0;
    DECLARE employeeExist INT DEFAULT 0;
    SET eventExist = (SELECT COUNT(*) FROM events WHERE eventNo = event_ID);
    SET employeeExist = (SELECT COUNT(*) FROM employees WHERE newManager = employeeID);

    UPDATE events
    SET managing_employee = newManager WHERE eventNo = event_ID;

    IF eventExist = 0 THEN
      SELECT CONCAT('Event ', eventNo, ' does not exist') as 'result';
    ELSEIF employeeExist = 0 THEN
      SELECT CONCAT('Employee ', newManger, ' does not exist. Pick a different manager') as 'result';
    ELSEIF eventExist = 1 THEN
      SELECT CONCAT('Event ', eventNo, 'is now managed by employee', newManager) as 'result';
    END IF;
    END;

SQL

execute <<-SQL
    -- --------------------------------------------
    -- Delete an event
    -- --------------------------------------------
    CREATE PROCEDURE deleteEvent(eventNo int)
    BEGIN

    -- general error handler
    DECLARE sqlError INT DEFAULT FALSE;

    BEGIN
    -- Error handler setups
    DECLARE EXIT HANDLER FOR SQLEXCEPTION SET sqlError = TRUE;

    DELETE FROM EVENTS WHERE event_ID = eventNo;

    END;

      IF sqlError = TRUE THEN
      SELECT CONCAT('SQL Error. Event "', eventNo, '" was not deleted') AS 'result';
      ELSE
      SELECT CONCAT('Event "', eventNo, '" removed.') AS 'result';
      END IF;

    END;
SQL

execute <<-SQL
    CREATE PROCEDURE get_event
    (
        eID int(11),
        eTitle varchar(45),
        eDescription varchar(200),
        ePrice float,
        eManager int(11),
        maxGuests int(11),
        maxAttend int(11),
        eDate dateTime
    )
    BEGIN
        SELECT * FROM events
        where (eID = event_ID OR eID IS NULL) AND
        (eTitle = title OR eTitle IS NULL) AND
        (eDescription = description OR eDescription IS NULL) AND
       (ePrice = price OR ePrice is NULL) AND
        (eManager = managing_employee OR eManager IS NULL) AND
        (maxGuests = max_guests_per_person OR maxGuests is NULL) AND
        ( maxAttend = max_attending OR maxAttend is NULL) AND
        (eDate = event_date OR eDate is NULL);
    END;
SQL

execute <<-SQL
-- -----------------------------------------
-- Update event trigger
-- -----------------------------------------
CREATE TRIGGER invalid_event_update
 BEFORE UPDATE ON events
  FOR EACH ROW
BEGIN
  IF New.managing_employee NOT IN (SELECT employee_id FROM employees) THEN
    SIGNAL SQLSTATE 'HY000' -- 'HY000' indicates a general error
      SET MESSAGE_TEXT = 'Must have a valid managing employee';
  ELSEIF New.title = '' THEN
  SIGNAL SQLSTATE 'HY000'
    SET MESSAGE_TEXT = 'Must have an event title';
  ELSEIF 0 > New.max_guests_per_person THEN
  SIGNAL SQLSTATE 'HY000'
    SET MESSAGE_TEXT = 'Max guests per person must be at least 0';
  ELSEIF New.price < 0 THEN
  SIGNAL SQLSTATE 'HY000'
    SET MESSAGE_TEXT = 'Must have price listed of at least 0';
  ELSEIF DATE(New.event_date) <= CURDATE() THEN
   SIGNAL SQLSTATE 'HY000'
    SET MESSAGE_TEXT = 'Event must take place after today';
  ELSEIF New.event_date < Old.event_date THEN
   SIGNAL SQLSTATE 'HY000'
    SET MESSAGE_TEXT = 'Can only move an event to a later date';
  ELSEIF New.max_attending < Old.max_attending THEN
   SIGNAL SQLSTATE 'HY000'
    SET MESSAGE_TEXT = 'Can only increase the max number of guests';
  ELSEIF 0 < (SELECT COUNT(*) FROM events WHERE event_id != New.event_id AND DATE(event_date) =DATE(New.event_date)) THEN
   SIGNAL SQLSTATE 'HY000'
    SET MESSAGE_TEXT = 'There is already an event scheduled for that date';
  ELSEIF New.max_attending <= New.max_guests_per_person THEN
   SIGNAL SQLSTATE 'HY000'
    SET MESSAGE_TEXT = 'Capacity of event must be greater than the number of guests per person';
  END IF;
  END;

SQL
execute <<-SQL
-- --------------------------------------------------
-- insert event trigger
-- --------------------------------------------------
CREATE TRIGGER invalid_event_insert
 BEFORE INSERT ON events
  FOR EACH ROW
BEGIN
  IF New.managing_employee NOT IN (SELECT employee_id FROM employees) THEN
    SIGNAL SQLSTATE 'HY000' -- 'HY000' indicates a general error
      SET MESSAGE_TEXT = 'Must have a valid managing employee';
  ELSEIF New.event_id IN (SELECT event_id from events) THEN
  SIGNAL SQLSTATE 'HY000'
    SET MESSAGE_TEXT = 'An event with the given ID already exists';
  ELSEIF New.title = '' THEN
  SIGNAL SQLSTATE 'HY000'
    SET MESSAGE_TEXT = 'Must have an event title';
  ELSEIF 0 < (SELECT COUNT(*) FROM events WHERE event_id != New.event_id AND DATE(event_date) = DATE(New.event_date)) THEN
   SIGNAL SQLSTATE 'HY000'
    SET MESSAGE_TEXT = 'There is already an event scheduled for that date';
  ELSEIF 0 > New.max_guests_per_person THEN
  SIGNAL SQLSTATE 'HY000'
    SET MESSAGE_TEXT = 'Max guests per person must be at least 0';
  ELSEIF New.price < 0 THEN
  SIGNAL SQLSTATE 'HY000'
    SET MESSAGE_TEXT = 'Must have price listed of at least 0';
  ELSEIF DATE(New.event_date) <= CURDATE() THEN
   SIGNAL SQLSTATE 'HY000'
    SET MESSAGE_TEXT = 'Event must take place after today';
  ELSEIF New.max_attending <= New.max_guests_per_person THEN
   SIGNAL SQLSTATE 'HY000'
    SET MESSAGE_TEXT = 'Capacity of event must be greater than the number of guests per person';
  END IF;
  END;

SQL

execute <<-SQL
CREATE PROCEDURE upcoming_events()
BEGIN
SELECT * FROM events WHERE event_date >= CURDATE() ORDER BY event_date asc;
END;
SQL

  end

def down

execute <<-SQL
DROP PROCEDURE IF EXISTS upcoming_events;
SQL
execute <<-SQL
    DROP PROCEDURE IF EXISTS createEvent;
SQL

execute <<-SQL
    DROP PROCEDURE IF EXISTS viewEvents;
SQL

execute <<-SQL
    DROP PROCEDURE IF EXISTS viewEventsByManager;
SQL

execute <<-SQL
    DROP PROCEDURE IF EXISTS viewEventsByPrice;
SQL

execute <<-SQL
    DROP PROCEDURE IF EXISTS viewEventsByDate;
SQL

execute <<-SQL
    DROP PROCEDURE IF EXISTS updateEventTitle;
SQL

execute <<-SQL
    DROP PROCEDURE IF EXISTS updateEventDescription;
SQL

execute <<-SQL
    DROP PROCEDURE IF EXISTS updateEventManager;
SQL

execute <<-SQL
    DROP PROCEDURE IF EXISTS deleteEvent;
SQL

execute <<-SQL
    DROP PROCEDURE IF EXISTS get_event;
SQL

execute <<-SQL
    DROP TRIGGER IF EXISTS invalid_event_insert;
SQL

execute <<-SQL
    DROP TRIGGER IF EXISTS invalid_event_update;
SQL


end


end
