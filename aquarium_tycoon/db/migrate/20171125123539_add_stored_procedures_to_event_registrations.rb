class AddStoredProceduresToEventRegistrations < ActiveRecord::Migration[5.1]
  def up

    execute <<-SQL
    -- ---------------------------------------------------
    -- calculate number of members registered for an event
    -- ---------------------------------------------------
    CREATE FUNCTION memsRegistered(eventNo int)
    RETURNS int
    BEGIN
    RETURN (SELECT SUM(guest_count + 1) FROM event_registrations where event_id = eventNo);
    END;
SQL

    execute <<-SQL
        -- -----------------------------------------------------
        -- View all event registrations
        -- -----------------------------------------------------

        CREATE PROCEDURE allRegistrations()
        BEGIN

        SELECT * FROM event_registrations;

        END;
SQL


    execute <<-SQL
        -- -----------------------------------------------------
        -- View all registrations for a specified event
        -- -----------------------------------------------------

        CREATE PROCEDURE registrationsForEvent(eventNo int)
        BEGIN

        SELECT * FROM event_registrations
          WHERE event_id = eventNo
            ORDER BY time desc;

        END;
SQL


    execute <<-SQL
        -- -----------------------------------------------------
        -- View all registrations for a specified member
        -- -----------------------------------------------------
        CREATE PROCEDURE registrationsForMember(memberID int)
        BEGIN

        SELECT * FROM event_registrations
          WHERE member_id = memberID
            ORDER BY time desc;

        END;
SQL

execute <<-SQL
        -- --------------------------------------------
        -- Delete an event registration
        -- --------------------------------------------
        CREATE PROCEDURE deleteRegistration(memNo int, eventNo int)
        BEGIN

        -- general error handler
        DECLARE sqlError INT DEFAULT FALSE;

        BEGIN
        -- Error handler setups
        DECLARE EXIT HANDLER FOR SQLEXCEPTION SET sqlError = TRUE;

        DELETE FROM event_registrations WHERE event_id = eventNo AND member_id = memNo;

        END;

          IF sqlError = TRUE THEN
          SELECT CONCAT('SQL Error. Registration not eleted.') AS 'result';
          ELSE
          SELECT CONCAT('Registration deleted') AS 'result';
          END IF;

        END;
SQL

    execute <<-SQL
      CREATE PROCEDURE get_event_registration
      (
        regCode int(11),
          eTime datetime,
          eMember int(11),
          eID int(11),
          guests int(11)
      )
      BEGIN
        SELECT * FROM event_registrations
          where (regCode = registration_code OR regCode IS NULL) AND
          (eTime = time OR eTime IS NULL) AND
        (eMember = member_id OR eMember IS NULL) AND
         ( eID = event_id OR eID is NULL) AND
          (guests = guest_count OR guests IS NULL);
      END;
SQL

execute <<-SQL
CREATE TRIGGER update_registration_guests
 BEFORE UPDATE ON event_registrations
  FOR EACH ROW
BEGIN
  IF New.guest_count < 0 THEN
    SIGNAL SQLSTATE 'HY000' -- 'HY000' indicates a general error
      SET MESSAGE_TEXT = 'Guest count must be at least 0';
  ELSEIF New.event_id != Old.event_id THEN
    SIGNAL SQLSTATE 'HY000'
      SET MESSAGE_TEXT = 'To register for a different event, cancel this registration and start a new one.';  
 ELSEIF New.member_id != Old.member_id THEN
    SIGNAL SQLSTATE 'HY000'
      SET MESSAGE_TEXT = 'To register a different member, cancel this registration and start a new one.';
 ELSEIF New.guest_count > (SELECT max_guests_per_person FROM events WHERE event_id = New.event_id) THEN
    SIGNAL SQLSTATE 'HY000'
      SET MESSAGE_TEXT = 'Exceeding guest limit';
  END IF;
  END;
SQL

execute <<-SQL
CREATE TRIGGER add_registration_guests
 BEFORE INSERT ON event_registrations
  FOR EACH ROW
BEGIN
DECLARE maxGuestsTotal INT DEFAULT 0;
DECLARE guestsSoFar INT DEFAULT 0;
DECLARE maxGuest INT DEFAULT 0;

SET maxGuestsTotal = (SELECT max_attending FROM events where event_id = New.event_id);
SET maxGuest = (SELECT max_guests_per_person FROM events where event_id = New.event_id);
SET guestsSoFar = (SELECT SUM(guest_count + 1) FROM event_registrations where event_id= New.event_id);
  IF New.guest_count < 0 THEN
    SIGNAL SQLSTATE 'HY000' -- 'HY000' indicates a general error
      SET MESSAGE_TEXT = 'Guest count must be at least 0';
  ELSEIF New.member_id IN (SELECT member_id FROM event_registrations WHERE New.event_id = event_id) THEN
    SIGNAL SQLSTATE 'HY000'
      SET MESSAGE_TEXT = 'This member is already registered for this event';

  ELSEIF New.member_id NOT IN (SELECT member_id from members) THEN
  SIGNAL SQLSTATE 'HY000'
    SET MESSAGE_TEXT = 'Not a valid member';
  ELSEIF New.event_id NOT IN (SELECT event_id from events) THEN
  SIGNAL SQLSTATE 'HY000'
    SET MESSAGE_TEXT = 'Not a valid event';
  ELSEIF New.guest_count > maxGuest THEN
  SIGNAL SQLSTATE 'HY000'
    SET MESSAGE_TEXT = 'Number of guests exceeds limit for this event';
  ELSEIF New.guest_count + guestsSoFar > maxGuestsTotal THEN
  SIGNAL SQLSTATE 'HY000'
    SET MESSAGE_TEXT = 'There are not enough tickets for you and your guests';
  ELSEIF (SELECT DATE(event_date) FROM events WHERE event_id = New.event_id) > (SELECT DATE(expiration_date) FROM members WHERE member_id = new.member_id) THEN
    SIGNAL SQLSTATE 'HY000'
    SET MESSAGE_TEXT = 'That member must renew their membership in order to attend.';  
  END IF;
END;
SQL



  end

  def down
    execute <<-SQL
    DROP TRIGGER IF EXISTS add_registration_guests;
SQL

execute <<-SQL
    DROP TRIGGER IF EXISTS update_registration_guests;
SQL
    execute <<-SQL
      DROP PROCEDURE IF EXISTS registerForEvent;
SQL

    execute <<-SQL
      DROP PROCEDURE IF EXISTS allRegistrations;
SQL

    execute <<-SQL
      DROP PROCEDURE IF EXISTS registrationsForEvent;
SQL

    execute <<-SQL
      DROP PROCEDURE IF EXISTS registrationsForMember;
SQL

    execute <<-SQL
      DROP PROCEDURE IF EXISTS deleteRegistration;
SQL

    execute <<-SQL
      DROP PROCEDURE IF EXISTS get_event_registration;
SQL
  end
end
