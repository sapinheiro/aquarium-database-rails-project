USE aquarium_tycoon_development;

-- ======================================================
-- Events
-- ======================================================
-- -----------------------------------------
-- Update event trigger
-- -----------------------------------------
DROP TRIGGER IF EXISTS invalid_event_update;
DELIMITER //
CREATE TRIGGER invalid_event_update
 BEFORE UPDATE ON events
  FOR EACH ROW
BEGIN
  IF New.managingmployee NOT IN (SELECT employee_id FROM employees) THEN
    SIGNAL SQLSTATE 'HY000' -- 'HY000' indicates a general error
      SET MESSAGE_TEXT = 'Must have a valid managing employee';
  ELSEIF New.event_id IN (SELECT event_id from events) THEN
	SIGNAL SQLSTATE 'HY000'
		SET MESSAGE_TEXT = 'An event with the given ID already exists';
  ELSEIF New.title = '' THEN
	SIGNAL SQLSTATE 'HY000'
		SET MESSAGE_TEXT = 'Must have an event title';
  ELSEIF 0 < (SELECT COUNT(*) FROM EVENTS where event_title = new.title AND event_date = new.event_date) THEN
	SIGNAL SQLSTATE 'HY000'
		SET MESSAGE_TEXT = 'That event is already scheduled on that date';
  ELSEIF 0 < New.max_guests_per_person THEN
	SIGNAL SQLSTATE 'HY000'
		SET MESSAGE_TEXT = 'Max guests per person must be at least 0';
  ELSEIF New.price < 0 THEN
	SIGNAL SQLSTATE 'HY000' 
		SET MESSAGE_TEXT = 'Must have price listed of at least 0';
  ELSEIF New.eventDate <= CURDATE() THEN 
	 SIGNAL SQLSTATE 'HY000'
		SET MESSAGE_TEXT = 'Event must take place after today';
  END IF;
  END //

DELIMITER ;

-- --------------------------------------------------
-- insert event trigger
-- --------------------------------------------------
DROP TRIGGER IF EXISTS invalid_event_insert;
DELIMITER //
CREATE TRIGGER invalid_event_insert
 BEFORE INSERT ON events
  FOR EACH ROW
BEGIN
  IF New.managingmployee NOT IN (SELECT employee_id FROM employees) THEN
    SIGNAL SQLSTATE 'HY000' -- 'HY000' indicates a general error
      SET MESSAGE_TEXT = 'Must have a valid managing employee';
  ELSEIF New.event_id IN (SELECT event_id from events) THEN
	SIGNAL SQLSTATE 'HY000'
		SET MESSAGE_TEXT = 'An event with the given ID already exists';
  ELSEIF New.title = '' THEN
	SIGNAL SQLSTATE 'HY000'
		SET MESSAGE_TEXT = 'Must have an event title';
  ELSEIF 0 < (SELECT COUNT(*) FROM EVENTS where event_title = new.title AND event_date = new.event_date) THEN
	SIGNAL SQLSTATE 'HY000'
		SET MESSAGE_TEXT = 'That event is already scheduled on that date';
  ELSEIF 0 < New.max_guests_per_person THEN
	SIGNAL SQLSTATE 'HY000'
		SET MESSAGE_TEXT = 'Max guests per person must be at least 0';
  ELSEIF New.price < 0 THEN
	SIGNAL SQLSTATE 'HY000' 
		SET MESSAGE_TEXT = 'Must have price listed of at least 0';
  ELSEIF New.eventDate <= CURDATE() THEN 
	 SIGNAL SQLSTATE 'HY000'
		SET MESSAGE_TEXT = 'Event must take place after today';
  END IF;
  END //

DELIMITER ;

-- ========================================================================
-- Member update trigger
-- =========================================================================
DROP TRIGGER IF EXISTS invalid_member_update;
DELIMITER //
CREATE TRIGGER invalid_member_update
 BEFORE UPDATE ON members
  FOR EACH ROW
BEGIN
  IF New.fee < 0 THEN
    SIGNAL SQLSTATE 'HY000' -- 'HY000' indicates a general error
      SET MESSAGE_TEXT = 'Fee must be greater than $0';
  END IF;
  END //

DELIMITER ;

-- =====================================================================
-- Employee update trigger
-- can't change salary below x
-- =====================================================================

-- ===============================================================
-- registration triggers
-- ===============================================================

DROP TRIGGER IF EXISTS update_registration_guests;
DELIMITER //
CREATE TRIGGER update_registration_guests
 BEFORE UPDATE ON event_registrations
  FOR EACH ROW
BEGIN
  IF New.guest_count < 0 THEN
    SIGNAL SQLSTATE 'HY000' -- 'HY000' indicates a general error
      SET MESSAGE_TEXT = 'Guest count must be at least 0';
  END IF;
  END //

DELIMITER ;
Use aquarium_tycoon_development;
DROP TRIGGER IF EXISTS add_registration_guests;
DELIMITER //
CREATE TRIGGER add_registration_guests
 BEFORE INSERT ON event_registrations
  FOR EACH ROW
BEGIN
DECLARE maxGuestsTotal INT DEFAULT 0;
DECLARE guestsSoFar INT DEFAULT 0;
DECLARE maxGuest INT DEFAULT 0;

SET maxGuestsTotal = (SELECT max_attending FROM events where event_id = New.event);
SET maxGuest = (SELECT max_guests_per_person FROM events where event_id = New.event);
SET guestsSoFar = (SELECT SUM(guest_count + 1) FROM event_registrations where event = New.event);
  IF New.guest_count < 0 THEN
    SIGNAL SQLSTATE 'HY000' -- 'HY000' indicates a general error
      SET MESSAGE_TEXT = 'Guest count must be at least 0';
  ELSEIF New.member NOT IN (SELECT member_id from members) THEN
	SIGNAL SQLSTATE 'HY000'
		SET MESSAGE_TEXT = 'Not a valid member';
  ELSEIF New.event NOT IN (SELECT event_id from events) THEN 
	SIGNAL SQLSTATE 'HY000'
		SET MESSAGE_TEXT = 'Not a valid event';
  ELSEIF New.guest_count > maxGuests THEN
	SIGNAL SQLSTATE 'HY000'
		SET MESSAGE_TEXT = 'Number of guests exceeds limit for this event';
  ELSEIF New.guest_count + guestsSoFar > maxGuestsTotal THEN
	SIGNAL SQLSTATE 'HY000'
		SET MESSAGE_TEXT = 'There are not enough tickets for you and your guests';
  END IF;
  END //

DELIMITER ;

-- EMPLOYEE TRIGGERS

DROP TRIGGER IF EXISTS update_employee;
DELIMITER //
CREATE TRIGGER update_employee
 BEFORE UPDATE ON employees
  FOR EACH ROW
BEGIN
  IF New.salary < 40000 THEN
    SIGNAL SQLSTATE 'HY000' -- 'HY000' indicates a general error
      SET MESSAGE_TEXT = '$40,000.00 Is the minimum salary';
  ELSEIF New.fired_date IS NOT NULL AND Old.fired_date IS NOT NULL THEN
    SIGNAL SQLSTATE 'HY000'
      SET MESSAGE_TEXT = 'Cannot refire this employee';
  ELSEIF New.fired_date IS NOT NULL AND events_managed(New.employee_id) > 0 THEN
	SIGNAL SQLSTATE 'HY000'
		SET MESSAGE_TEXT = 'Cannot fire this employee until all events under their management are transferred to another employee';
  END IF;
  END //

DELIMITER ;

DROP TRIGGER IF EXISTS add_employee;
DELIMITER //
CREATE TRIGGER add_employee
 BEFORE INSERT ON employees
  FOR EACH ROW
BEGIN
  IF New.guest_salary < 40000 THEN
    SIGNAL SQLSTATE 'HY000' -- 'HY000' indicates a general error
      SET MESSAGE_TEXT = '$40,000.00 Is the minimum salary';
  ELSEIF New.first_name = '' THEN
	SIGNAL SQLSTATE 'HY000'
		SET MESSAGE_TEXT = 'Must insert first name';
  ELSEIF New.last_name = '' THEN
	SIGNAL SQLSTATE 'HY000'
		SET MESSAGE_TEXT = 'Must insert last name';
  END IF;
  END //
DELIMITER ;
DROP FUNCTION IF EXISTS events_managed;
CREATE FUNCTION events_managed (emp int)
RETURNS int(11)
RETURN (SELECT COUNT(*) FROM events where emp = managing_employee AND events.event_date >= CURDATE());
  

USE aquarium_tycoon_development;
