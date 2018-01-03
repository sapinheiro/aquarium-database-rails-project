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
   
INSERT INTO EMPLOYEES (firstName, lastName, hiredDate, salary) VALUES (fName, lName, CURDATE(), salary);
SELECT CONCAT('new employee "', fName, ' ', lName, '" added.') AS 'result';    
  

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