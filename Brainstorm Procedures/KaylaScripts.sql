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

END //

DELIMITER ;

-- --------------------------------------------
-- delete a habitat by name
-- --------------------------------------------

DROP PROCEDURE IF EXISTS deleteHabitat;

DELIMITER //
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



-- ==========================================
-- EMPLOYEE
-- ==========================================


-- ------------------------------------------
-- Add a new employee
-- ------------------------------------------


DROP PROCEDURE IF EXISTS addEmployee;

DELIMITER //
CREATE PROCEDURE addEmployee(
fName varchar(45), lname varchar(45), salary double)

BEGIN

-- general error handler
DECLARE sqlError INT DEFAULT FALSE;

BEGIN
-- Error handler setups
-- DECLARE EXIT HANDLER FOR SQLEXCEPTION SET sqlError = TRUE;


INSERT INTO EMPLOYEES (firstName, lastName, hiredDate, salary) VALUES (fName, lName, CURDATE(), salary);
SELECT CONCAT('new employee "', fName, ' ', lName, '" added.') AS 'result';

END;
  IF sqlError = TRUE THEN
  SELECT CONCAT('SQL Error. Employee "', fName, ' ', lName, '" was not added.') AS 'result';
  END IF;

END //

DELIMITER ;


-- ------------------------------------------
-- View all employees
-- ------------------------------------------


DROP PROCEDURE IF EXISTS viewEmployees;

DELIMITER //
CREATE PROCEDURE viewEmployees()
BEGIN

SELECT * FROM employees
  ORDER BY lastName desc;

END //

DELIMITER ;

-- -------------------------------------
-- filter employee by name
-- -------------------------------------

DROP PROCEDURE IF EXISTS viewEmployeeRecord;

DELIMITER //
CREATE PROCEDURE viewEmployeeRecord(fName varchar(45), lName varchar(45))
BEGIN

DECLARE notFound INT DEFAULT FALSE;

SET notFound = (SELECT COUNT(*) FROM employees
  WHERE firstName = fName
    AND lastName = lName);

SELECT * FROM employees
  WHERE firstName = fName
    AND lastName = lName;

  IF notFound = 0 THEN
    SELECT CONCAT('Employee ', fName, ' ', lName, ' not found.') AS 'result';
  END IF;

END //

DELIMITER ;

-- -------------------------------------
-- filter employee by salary range
-- -------------------------------------

DROP PROCEDURE IF EXISTS viewEmployeesBySalary;

DELIMITER //
CREATE PROCEDURE viewEmployeesBySalary(low double, high double)
BEGIN

DECLARE notFound INT DEFAULT FALSE;

SET notFound = (SELECT COUNT(*) FROM employees
  WHERE salary >= low
    AND salary <= high);

SELECT * FROM employees
  WHERE salary >= low
    AND salary <= high
      ORDER BY salary desc;

  IF notFound = 0 THEN
    SELECT CONCAT('No employees with salaries in the given range.') AS 'result';
  END IF;

END //

DELIMITER ;

-- ------------------------------------------
-- update employee salary
-- ------------------------------------------


DROP PROCEDURE IF EXISTS updateSalary;

DELIMITER //
CREATE PROCEDURE updateSalary(ID int, newSalary double)
BEGIN
DECLARE employeeExist INT DEFAULT 0;
SET employeeExist = (SELECT COUNT(*) FROM employees WHERE ID = employeeID);

UPDATE employees
SET salary = newSalary WHERE employeeID = ID;

IF employeeExist = 0 THEN
  SELECT CONCAT('Employee ', ID, ' does not exist') as 'result';
ELSEIF employeeExist = 1 THEN
  SELECT CONCAT('Employee ', ID, '''s Salary updated to ', newSalary) as 'result';
END IF;
END //

DELIMITER ;

-- ------------------------------------------
-- update employee firstName
-- ------------------------------------------


DROP PROCEDURE IF EXISTS updateFirstName;

DELIMITER //
CREATE PROCEDURE updateFirstName(ID int, newFName varchar(45))
BEGIN
DECLARE employeeExist INT DEFAULT 0;
SET employeeExist = (SELECT COUNT(*) FROM employees WHERE ID = employeeID);

UPDATE employees
SET firstName = newfName WHERE employeeID = ID;

IF employeeExist = 0 THEN
  SELECT CONCAT('Employee ', ID, ' does not exist') as 'result';
ELSEIF employeeExist = 1 THEN
  SELECT CONCAT('Employee ', ID, '''s first name updated to ', newFName) as 'result';
END IF;
END //

DELIMITER ;


-- ------------------------------------------
-- update employee firstName
-- ------------------------------------------


DROP PROCEDURE IF EXISTS updateLastName;

DELIMITER //
CREATE PROCEDURE updateLastName(ID int, newLName varchar(45))
BEGIN
DECLARE employeeExist INT DEFAULT 0;
SET employeeExist = (SELECT COUNT(*) FROM employees WHERE ID = employeeID);

UPDATE employees
SET lastName = newLName WHERE employeeID = ID;

IF employeeExist = 0 THEN
  SELECT CONCAT('Employee ', ID, ' does not exist') as 'result';
ELSEIF employeeExist = 1 THEN
  SELECT CONCAT('Employee ', ID, '''s last name updated to ', newLName) as 'result';
END IF;
END //

DELIMITER ;

-- ------------------------------------------
-- delete employee by ID
-- ------------------------------------------


DROP PROCEDURE IF EXISTS deleteEmployee;

DELIMITER //
CREATE PROCEDURE deleteEmployee(ID int)
BEGIN
DECLARE employeeExist INT DEFAULT 0;
DECLARE sqlError TINYINT DEFAULT FALSE;

DECLARE fName VARCHAR(45);
DECLARE lName VARCHAR(45);
DECLARE theHiredDate DATE;
DECLARE theSalary double;

DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET sqlError = TRUE;
SET employeeExist = (SELECT COUNT(*) FROM employees WHERE ID = employeeID);

SET fName = (SELECT firstName from employees where ID = employeeID);
SET lName = (SELECT lastName from employees where ID = employeeID);
SET theHiredDate = (SELECT hiredDate from employees where employeeID = ID);
SET theSalary = (SELECT salary from employees where ID = employeeID);


START TRANSACTION;
INSERT INTO formerEmployees VALUES (ID, fName, lName, theHiredDate, CURDATE(), theSalary);
DELETE FROM Employees WHERE ID = employeeID;

IF sqlError = FALSE and employeeExist = 1 THEN
  COMMIT;
    SELECT CONCAT('Employee ', ID, ' no longer listed as current employee') as 'result';
ELSE
  ROLLBACK;
  SELECT CONCAT('cannot remove employee ', ID, '.') as 'result';

END IF;
END //

DELIMITER ;


-- ==========================================
-- FEEDING LOG
-- ==========================================


-- ------------------------------------------
-- Log a feeding
-- ------------------------------------------

DROP PROCEDURE IF EXISTS logFeeding;

DELIMITER //
CREATE PROCEDURE logFeeding(
tankID varchar(45), employeeID int, foodGiven varchar(45), quantityGiven double)

BEGIN
-- general error handler
DECLARE sqlError INT DEFAULT FALSE;

BEGIN
-- Error handler setups
DECLARE EXIT HANDLER FOR SQLEXCEPTION SET sqlError = TRUE;


INSERT INTO FeedingLogs (time, food, quantity, employee, tank) VALUES (NOW(), foodGiven, quantityGiven, employeeID, tankID);
SELECT CONCAT('feeding logged for tank ', tankID) AS 'result';

END;

IF sqlError = TRUE THEN
  SELECT CONCAT('SQL Error. Feeding not logged.') AS 'result';
  END IF;

END //

DELIMITER ;

-- ------------------------------------------
-- View all feedings of one tank
-- ------------------------------------------

DROP PROCEDURE IF EXISTS viewTankFeedings;

DELIMITER //
CREATE PROCEDURE viewTankFeedings(ID int)
BEGIN

DECLARE notFound INT DEFAULT FALSE;

SET notFound = (SELECT COUNT(*) FROM feedingLogs where ID = tank);

SELECT * FROM feedingLogs
  WHERE ID = tank
    ORDER BY time DESC;


  IF notFound = 0 THEN
    SELECT CONCAT('Tank "', ID, '" does not exist.') AS 'result';
  END IF;
END //

DELIMITER ;


-- ------------------------------------------
-- View all feedings by an employee
-- ------------------------------------------

DROP PROCEDURE IF EXISTS viewEmployeeFeedings;

DELIMITER //
CREATE PROCEDURE viewEmployeeFeedings(ID int)
BEGIN

DECLARE notFound INT DEFAULT FALSE;

SET notFound = (SELECT COUNT(*) FROM feedingLogs where ID = employee);

SELECT * FROM feedingLogs
  WHERE ID = employee
    ORDER BY time DESC;


  IF notFound = 0 THEN
    SELECT CONCAT('Employee "', ID, '" does not exist.') AS 'result';
  END IF;
END //

DELIMITER ;

-- ------------------------------------------
-- View all feedings on a certain date
-- ------------------------------------------

DROP PROCEDURE IF EXISTS viewDateFeedings;

DELIMITER //
CREATE PROCEDURE viewDateFeedings(feedingDate DATE)
BEGIN

DECLARE notFound INT DEFAULT FALSE;

SET notFound = (SELECT COUNT(*) FROM feedingLogs where DATE(time) = feedingDate);

SELECT * FROM feedingLogs
  WHERE DATE(time) = feedingDate
    ORDER BY time DESC;


  IF notFound = 0 THEN
    SELECT CONCAT('No feedings on ', feedingDate) AS 'result';
  END IF;
END //

DELIMITER ;
USE AQUARIUM_Tycoon_development;
SELECT * FROM TANKS;

-- ==========================================
-- EVENT
-- ==========================================


-- ------------------------------------------
-- Create an Event
-- ------------------------------------------
DROP PROCEDURE IF EXISTS createEvent;

DELIMITER //
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

END //

DELIMITER ;

-- ------------------------------------------
-- View all events
-- ------------------------------------------

DROP PROCEDURE IF EXISTS viewEvents;

DELIMITER //
CREATE PROCEDURE viewEvents()
BEGIN

SELECT * FROM events
  ORDER BY event_date DESC;
END //

DELIMITER ;

-- --------------------------------------------
-- View all events managed by a given employee
-- --------------------------------------------

DROP PROCEDURE IF EXISTS viewEventsByManager;

DELIMITER //
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
END //

DELIMITER ;

-- --------------------------------------------
-- View all events within a given price range
-- --------------------------------------------

DROP PROCEDURE IF EXISTS viewEventsByPrice;

DELIMITER //
CREATE PROCEDURE viewEventsByPrice(low float, high float)
BEGIN

SELECT * FROM events
  WHERE price >= low AND price <=high
    ORDER BY time DESC;

END //

DELIMITER ;

-- --------------------------------------------
-- View all events for a given month and year
-- --------------------------------------------

DROP PROCEDURE IF EXISTS viewEventsByDate;

DELIMITER //
CREATE PROCEDURE viewEventsByDate(Eyear int, Emonth int)
BEGIN

SELECT * FROM events
  WHERE MONTH(event_date) = Emonth AND YEAR(event_date) = Eyear
    ORDER BY time DESC;

END //

DELIMITER ;

-- --------------------------------------------
-- Update event title
-- --------------------------------------------

DROP PROCEDURE IF EXISTS updateEventTitle;

DELIMITER //
CREATE PROCEDURE updateEventTitle(eventNo int, newTitle varchar(45))
BEGIN
DECLARE eventExist INT DEFAULT 0;
SET eventExist = (SELECT COUNT(*) FROM events WHERE eventNo = eventID);

UPDATE events
SET title = newTitle WHERE eventNo = eventID;

IF eventExist = 0 THEN
  SELECT CONCAT('Event ', eventNo, ' does not exist') as 'result';
ELSEIF eventExist = 1 THEN
  SELECT CONCAT('Event ', eventNo, '''s title updated to ', newTitle) as 'result';
END IF;
END //

DELIMITER ;

-- --------------------------------------------
-- Update event description
-- --------------------------------------------

DROP PROCEDURE IF EXISTS updateEventDescription;

DELIMITER //
CREATE PROCEDURE updateEventDescription(eventNo int, newDescription varchar(45))
BEGIN
DECLARE eventExist INT DEFAULT 0;
SET eventExist = (SELECT COUNT(*) FROM events WHERE eventNo = eventID);

UPDATE events
SET description = newDescription WHERE eventNo = eventID;

IF eventExist = 0 THEN
  SELECT CONCAT('Event ', eventNo, ' does not exist') as 'result';
ELSEIF eventExist = 1 THEN
  SELECT CONCAT('Event ', eventNo, '''s description updated to ', newDescription) as 'result';
END IF;
END //

DELIMITER ;

-- --------------------------------------------
-- Update event manager
-- --------------------------------------------

DROP PROCEDURE IF EXISTS updateEventManager;

DELIMITER //
CREATE PROCEDURE updateEventManager(eventNo int, newManager int)
BEGIN
DECLARE eventExist INT DEFAULT 0;
DECLARE employeeExist INT DEFAULT 0;
SET eventExist = (SELECT COUNT(*) FROM events WHERE eventNo = eventID);
SET employeeExist = (SELECT COUNT(*) FROM employees WHERE newManager = employeeID);

UPDATE events
SET manager = newManager WHERE eventNo = eventID;

IF eventExist = 0 THEN
  SELECT CONCAT('Event ', eventNo, ' does not exist') as 'result';
ELSEIF employeeExist = 0 THEN
  SELECT CONCAT('Employee ', newManger, ' does not exist. Pick a different manager') as 'result';
ELSEIF eventExist = 1 THEN
  SELECT CONCAT('Event ', eventNo, 'is now managed by employee', newManager) as 'result';
END IF;
END //

DELIMITER ;

-- --------------------------------------------
-- Delete an event
-- --------------------------------------------

DROP PROCEDURE IF EXISTS deleteEvent;

DELIMITER //
CREATE PROCEDURE deleteEvent(eventNo int)
BEGIN

-- general error handler
DECLARE sqlError INT DEFAULT FALSE;

BEGIN
-- Error handler setups
DECLARE EXIT HANDLER FOR SQLEXCEPTION SET sqlError = TRUE;

DELETE FROM EVENTS WHERE eventID = eventNo;

END;

  IF sqlError = TRUE THEN
  SELECT CONCAT('SQL Error. Event "', eventNo, '" was not deleted') AS 'result';
  ELSE
  SELECT CONCAT('Event "', eventNo, '" removed.') AS 'result';
  END IF;

END //

DELIMITER ;

-- ==========================================
-- MEMBER
-- ==========================================


-- ------------------------------------------
-- Add a new member
-- ------------------------------------------

DROP PROCEDURE IF EXISTS addMember;

DELIMITER //
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

END //

DELIMITER ;


-- ------------------------------------------
-- View all members
-- ------------------------------------------

DROP PROCEDURE IF EXISTS viewMembers;

DELIMITER //
CREATE PROCEDURE viewMembers()
BEGIN

SELECT * FROM members
  ORDER BY dateJoined DESC;
END //

DELIMITER ;


-- -----------------------------------------------------
-- View members expiring within the given number of days
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS expiringMembers;

DELIMITER //
CREATE PROCEDURE expiringMembers(days int)
BEGIN

SELECT * FROM events
  WHERE expirationDate <= DATE_ADD(curdate(), INTERVAL days day)
    ORDER BY time DESC;

END //

DELIMITER ;

-- -----------------------------------------------------
-- Update member: renew membership
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS renewMember;
DELIMITER //
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
END //

DELIMITER ;


-- ------------------------------------------
-- delete member
-- ------------------------------------------


DROP PROCEDURE IF EXISTS deleteMember;

DELIMITER //
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
END //

DELIMITER ;


-- ==========================================
-- Event Registration
-- ==========================================


-- ---------------------------------------------------
-- calculate number of members registered for an event
-- ---------------------------------------------------

DROP FUNCTION IF EXISTS memsRegistered;
DELIMITER //
CREATE FUNCTION memsRegistered(eventNo int)
RETURNS int
BEGIN
RETURN (SELECT SUM(guestCount + 1) FROM eventRegistrations where event = eventNo);
END //
DELIMITER ;

-- ------------------------------------------
-- Register a member for an event
-- ------------------------------------------

DROP PROCEDURE IF EXISTS registerForEvent;

DELIMITER //
CREATE PROCEDURE registerForEvent(memID int, eventNo int, guests int)

BEGIN
-- general error handler
DECLARE sqlError INT DEFAULT FALSE;
DECLARE maxGuestsPerP INT DEFAULT 0;
DECLARE maxGuestsTotal INT DEFAULT 0;
DECLARE guestsSoFar INT DEFAULT 0;
DECLARE registeredAlready INT DEFAULT 0;

SET registeredAlready = (SELECT count(*) FROM eventRegistrations where eventNo = event AND memID = member);
SET maxGuestsPerP = (SELECT max_guests_per_person FROM events where eventID = eventNo);
SET maxGuestsTotal = (SELECT max_guests_per_person FROM events where eventID = eventNo);
SET guestsSoFar = memsRegistered(eventNo);
BEGIN
-- Error handler setups
DECLARE EXIT HANDLER FOR SQLEXCEPTION SET sqlError = TRUE;

IF (guests >= maxGuestsPerP) THEN
  SELECT CONCAT('Guests exceed maximum allowed. Up to ', maxGuestsPerP, ' permitted.') as 'result';
ELSEIF (guestsSoFar + guests > maxGuestsTotal) THEN
  SELECT CONCAT('Not enough spaces available to register this member and their ', guests, ' guests.') as 'result';
ELSEIF (registeredAlready != 0) THEN
  SELECT CONCAT('Member ', memID, ' already registered for event ', eventNo) as 'result';
ELSE
INSERT INTO EventRegistrations (time, member, event, guestCount)
  VALUES (NOW(), memID, eventNo, guests);
SELECT CONCAT('Registration complete.') AS 'result';
END IF;
END;

IF sqlError = TRUE THEN
  SELECT CONCAT('SQL Error. Registration not logged.') AS 'result';
  END IF;

END //

DELIMITER ;


-- -----------------------------------------------------
-- View all event registrations
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS allRegistrations;

DELIMITER //
CREATE PROCEDURE allRegistrations()
BEGIN

SELECT * FROM eventRegistrations;

END //

DELIMITER ;

-- -----------------------------------------------------
-- View all registrations for a specified event
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS registrationsForEvent;


DELIMITER //
CREATE PROCEDURE registrationsForEvent(eventNo int)
BEGIN

SELECT * FROM eventRegistrations
  WHERE event = eventNo
    ORDER BY time desc;

END //

DELIMITER ;

-- -----------------------------------------------------
-- View all registrations for a specified member
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS registrationsForMember;


DELIMITER //
CREATE PROCEDURE registrationsForMember(memberID int)
BEGIN

SELECT * FROM eventRegistrations
  WHERE member = memberID
    ORDER BY time desc;

END //

DELIMITER ;

-- --------------------------------------------
-- Delete an event registration
-- --------------------------------------------

DROP PROCEDURE IF EXISTS deleteRegistration;

DELIMITER //
CREATE PROCEDURE deleteRegistration(memNo int, eventNo int)
BEGIN

-- general error handler
DECLARE sqlError INT DEFAULT FALSE;

BEGIN
-- Error handler setups
DECLARE EXIT HANDLER FOR SQLEXCEPTION SET sqlError = TRUE;

DELETE FROM EventRegistrations WHERE event = eventNo AND memNo = member;

END;

  IF sqlError = TRUE THEN
  SELECT CONCAT('SQL Error. Registration not eleted.') AS 'result';
  ELSE
  SELECT CONCAT('Registration deleted') AS 'result';
  END IF;

END //

DELIMITER ;
