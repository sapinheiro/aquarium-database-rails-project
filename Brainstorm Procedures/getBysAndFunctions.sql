use AquariumDB;

-- get animal with optional parameters
DROP PROCEDURE IF EXISTS get_animal;

DELIMITER  //

CREATE PROCEDURE get_animal
(
	aID int(11),
    aname varchar(45),
    aspecies varchar(45),
    tID int(11),
    birthday dateTime
)
BEGIN
	SELECT * FROM animals
    where (animalID = aID OR aID IS NULL) AND
    (aname = name OR aname IS NULL) AND
	(aspecies = species OR aspecies IS NULL) AND
   ( tID = tank OR tID is NULL) AND 
    (birthday = birthDate OR birthday IS NULL);
END //

DELIMITER ;
-- CALL get_animal(NULL, NULL, NULL, NULL,  NULL);

-- get animal count with optional parameters
DROP FUNCTION IF EXISTS get_animal_count;

DELIMITER //
 
CREATE FUNCTION get_animal_count
(
	aID int(11),
    aname varchar(45),
    aspecies varchar(45),
    tID int(11),
    birthday dateTime
)
RETURNS INT
BEGIN
	DECLARE numAnimals INT;
    
	SELECT count(*) 
    INTO numAnimals 
    FROM animals
    where (animalID = aID OR aID IS NULL) AND
    (aname = name OR aname IS NULL) AND
	(aspecies = species OR aspecies IS NULL) AND
   ( tID = tank OR tID is NULL) AND 
    (birthday = birthDate OR birthday IS NULL);
    
    RETURN numAnimals;
END //

DELIMITER ;
-- SELECT get_animal_count(NULL, NULL, "American Lobster", NULL,  NULL);

-- get tank with optional parameters
DROP PROCEDURE IF EXISTS get_tank;

DELIMITER  //

CREATE PROCEDURE get_tank
(
	tID int(11),
    tName varchar(45),
    tDescription varchar(200),
    tWater enum ('fresh', 'salt'),
    tVolume double,
    temp double,
    tYear int(11), 
    habitat int(11)
)
BEGIN
	SELECT * FROM tanks
    where (tID = tankID OR tID IS NULL) AND
    (tname = name OR tname IS NULL) AND
	(tDescription = description OR tDescription IS NULL) AND
   ( tWater = waterType OR tWater is NULL) AND 
    (tVolume = volume OR tVolume IS NULL) AND
    ( temp = temperature OR temp is NULL) AND
    ( tYear = yearBuilt OR tYear is NULL) AND
    (habitat = habitatID OR habitat is NULL);
END //

DELIMITER ;
-- CALL get_tank(NULL, NULL, NULL, 'salt', NULL, NULL, '2016', NULL);

-- get tank count with optional parameters
DROP FUNCTION IF EXISTS get_tank_count;

DELIMITER  //

CREATE FUNCTION get_tank_count
(
	tID int(11),
    tName varchar(45),
    tDescription varchar(200),
    tWater enum ('fresh', 'salt'),
    tVolume double,
    temp double,
    tYear int(11), 
    habitat int(11)
)
RETURNS INT
BEGIN
	DECLARE tankCount INT;
    
	SELECT count(*) 
    INTO tankCount
    FROM tanks
    where (tID = tankID OR tID IS NULL) AND
    (tname = name OR tname IS NULL) AND
	(tDescription = description OR tDescription IS NULL) AND
   ( tWater = waterType OR tWater is NULL) AND 
    (tVolume = volume OR tVolume IS NULL) AND
    ( temp = temperature OR temp is NULL) AND
    ( tYear = yearBuilt OR tYear is NULL) AND
    (habitat = habitatID OR habitat is NULL);
    
    RETURN tankCount;
END //

DELIMITER ;
-- SELECT get_tank_count(NULL, NULL, NULL, 'salt', NULL, NULL, '2016', NULL);

-- get employee with optional parameters
DROP PROCEDURE IF EXISTS get_employee;

DELIMITER  //

CREATE PROCEDURE get_employee
(
	eID int(11),
    fName varchar(45),
    lName varchar(45),
    hired varChar(45),
    eSalary double
)
BEGIN
	SELECT * FROM employees
    where (eID = employeeID OR eID IS NULL) AND
    (fname = firstName OR fName IS NULL) AND
	(lName = lastName OR lName IS NULL) AND
   ( hired = hiredDate OR hired is NULL) AND 
    (eSalary = salary OR eSalary IS NULL);
END //

DELIMITER ;
-- CALL get_employee(NULL, NULL, NULL, NULL, '60000');

-- get employee count with optional parameters
DROP FUNCTION IF EXISTS get_employee_count;

DELIMITER  //

CREATE FUNCTION get_employee_count
(
	eID int(11),
    fName varchar(45),
    lName varchar(45),
    hired varChar(45),
    eSalary double
)
RETURNS INT
BEGIN
	DECLARE numEmployees INT;
    
	SELECT count(*)
    INTO numEmployees
    FROM employees
    where (eID = employeeID OR eID IS NULL) AND
    (fname = firstName OR fName IS NULL) AND
	(lName = lastName OR lName IS NULL) AND
   ( hired = hiredDate OR hired is NULL) AND 
    (eSalary = salary OR eSalary IS NULL);
    
    RETURN numEmployees;
END //

DELIMITER ;
-- SELECT get_employee_count(NULL, NULL, NULL, NULL, '50000');

-- get eventregistrations with optional parameters
DROP PROCEDURE IF EXISTS get_event_registration;

DELIMITER  //

CREATE PROCEDURE get_event_registration
(
	regCode int(11),
    eTime datetime,
    eMember int(11),
    eID int(11),
    guests int(11)
)
BEGIN
	SELECT * FROM eventregistrations
    where (regCode = registrationCode OR regCode IS NULL) AND
    (eTime = time OR eTime IS NULL) AND
	(eMember = member OR eMember IS NULL) AND
   ( eID = event OR eID is NULL) AND 
    (guests = guestCount OR guests IS NULL);
END //

DELIMITER ;
-- CALL get_event_registration(NULL, NULL, NULL, NULL, 2);

-- get events with optional parameters
DROP PROCEDURE IF EXISTS get_event;

DELIMITER  //

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
    where (eID = eventID OR eID IS NULL) AND
    (eTitle = title OR eTitle IS NULL) AND
	(eDescription = description OR eDescription IS NULL) AND
   (ePrice = price OR ePrice is NULL) AND 
    (eManager = managing_employee OR eManager IS NULL) AND
    (maxGuests = max_guests_per_person OR maxGuests is NULL) AND
    ( maxAttend = max_attending OR maxAttend is NULL) AND
    (eDate = event_date OR eDate is NULL);
END //

DELIMITER ;
-- CALL get_event(NULL, NULL, NULL, '15', '3', '4', NULL, NULL);
 
 -- get feeding logs with optional parameters
DROP PROCEDURE IF EXISTS get_feeding;

DELIMITER  //

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
	SELECT * FROM feedinglogs
    where (fID = feedingID OR fID IS NULL) AND
    (fTime = time OR fTime IS NULL) AND
	(fFood = food OR fFood IS NULL) AND
   (fQuantity = quantity OR fQuantity is NULL) AND 
    (fEmployee = employee OR fEmployee IS NULL) AND
    (tID = tank OR tID is NULL);
END //

DELIMITER ;
-- CALL get_feeding(NULL, NULL, 'sardines', '60', '6', '12');

-- get habitats with optional parameters
DROP PROCEDURE IF EXISTS get_habitats;

DELIMITER  //

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
END //

DELIMITER ;
-- CALL get_habitats(NULL, NULL, NULL, '2015');

-- get members with optional parameters
DROP PROCEDURE IF EXISTS get_member;

DELIMITER  //

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
END //

DELIMITER ;
-- CALL get_member(NULL, NULL, NULL, NULL, NULL, '400');

-- get members with optional parameters
DROP FUNCTION IF EXISTS get_member_count;

DELIMITER  //

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
END //

DELIMITER ;
-- SELECT get_member_count(NULL, NULL, NULL, NULL, NULL, '400');

-- get treatment with optional parameters
DROP PROCEDURE IF EXISTS get_treatment;

DELIMITER  //

CREATE PROCEDURE get_treatment
(
	tID int(11),
    tTime datetime,
    tMed varchar(45),
    tQuantity float,
    tEmployee int(11),
    aID int(11)
)
BEGIN
	SELECT * FROM treatmentlogs
    where (tID = treatmentID OR tID IS NULL) AND
    (tTime = time OR tTime IS NULL) AND
	(tMed = medicine OR tMed IS NULL) AND
   (tQuantity = quantity OR tQuantity is NULL) AND 
    (tEmployee = employee OR tEmployee IS NULL) AND
    (aID = animal OR aID is NULL);
END //

DELIMITER ;
-- CALL get_treatment(NULL, NULL, NULL, NULL, '1', NULL);

-- get former employee with optional parameters
DROP PROCEDURE IF EXISTS get_former;

DELIMITER  //

CREATE PROCEDURE get_former
(
	eID int(11),
    fName varchar(45),
    lName varchar(45),
    hired date,
    ended date,
    eSalary double
)
BEGIN
	SELECT * FROM formerEmployees
    where (eID = employeeID OR eID IS NULL) AND
    (fname = firstName OR fName IS NULL) AND
	(lName = lastName OR lName IS NULL) AND
   ( hired = hiredDate OR hired is NULL) AND 
   ( ended = endDate OR ended is NULL) AND 
    (eSalary = salary OR eSalary IS NULL);
END //

DELIMITER ;
-- CALL get_former(NULL, NULL, NULL, NULL, NULL, '60000');
