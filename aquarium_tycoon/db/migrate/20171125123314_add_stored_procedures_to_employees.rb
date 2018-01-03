class AddStoredProceduresToEmployees < ActiveRecord::Migration[5.1]
  def up



execute <<-SQL
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
      where (eID = employee_id OR eID IS NULL) AND
      (fname = first_name OR fName IS NULL) AND
    (lName = last_name OR lName IS NULL) AND
     ( hired = hired_date OR hired is NULL) AND
      (eSalary = salary OR eSalary IS NULL);
  END;
SQL

execute <<-SQL
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
      where (eID = employee_id OR eID IS NULL) AND
      (fname = first_name OR fName IS NULL) AND
    (lName = last_name OR lName IS NULL) AND
     ( hired = hired_date OR hired is NULL) AND
      (eSalary = salary OR eSalary IS NULL);

      RETURN numEmployees;
  END;
SQL

execute <<-SQL
CREATE FUNCTION events_managed (emp int)
RETURNS int(11)
RETURN (SELECT COUNT(*) FROM events where emp = managing_employee AND events.event_date >= CURDATE());
SQL

execute <<-SQL
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
  END;

SQL
    
execute <<-SQL
CREATE TRIGGER add_employee
 BEFORE INSERT ON employees
  FOR EACH ROW
BEGIN
  IF New.salary < 40000 THEN
    SIGNAL SQLSTATE 'HY000' -- 'HY000' indicates a general error
      SET MESSAGE_TEXT = '$40,000.00 Is the minimum salary';
  ELSEIF New.first_name = '' THEN
	SIGNAL SQLSTATE 'HY000'
		SET MESSAGE_TEXT = 'Must insert first name';
  ELSEIF New.last_name = '' THEN
	SIGNAL SQLSTATE 'HY000'
		SET MESSAGE_TEXT = 'Must insert last name';
  END IF;
  END;
SQL

execute <<-SQL
CREATE PROCEDURE current_employees()
BEGIN
SELECT * FROM employees WHERE fired_date IS NULL ORDER BY last_name;
END;


SQL

end

def down

  execute <<-SQL
  DROP PROCEDURE IF EXISTS current_employees;
  SQL

  execute <<-SQL
  DROP FUNCTION IF EXISTS events_managed;
  SQL

  execute <<-SQL
  DROP TRIGGER IF EXISTS add_employee;
SQL
  execute <<-SQL
  DROP TRIGGER IF EXISTS update_employee;
SQL
  ;
  SQL
  execute <<- SQL
    DROP PROCEDURE IF EXISTS get_employee;
  SQL
  execute <<- SQL
    DROP FUNCTION IF EXISTS get_employee_count;
  SQL
end

end
