class AddStoredProceduresToTanks < ActiveRecord::Migration[5.1]
  def up
     execute <<-SQL

CREATE TRIGGER update_tank
BEFORE UPDATE ON tanks
  FOR EACH ROW
BEGIN
  IF New.name = '' THEN
    SIGNAL SQLSTATE 'HY000' -- 'HY000' indicates a general error
      SET MESSAGE_TEXT = 'Must input a title';
  ELSEIF New.description = '' THEN
    SIGNAL SQLSTATE 'HY000'
      SET MESSAGE_TEXT = 'Must input a description';  
  ELSEIF New.volume < 500 OR New.Volume > 100000 THEN
    SIGNAL SQLSTATE 'HY000'
      SET MESSAGE_TEXT = 'Volume must be between 500 and 100,000 gallons';
  ELSEIF New.volume IS NULL THEN
    SIGNAL SQLSTATE 'HY000'
      SET MESSAGE_TEXT = 'Must input volume';
  ELSEIF New.temperature IS NULL THEN
    SIGNAL SQLSTATE 'HY000'
  	SET MESSAGE_TEXT = 'Must input a temperature';
  ELSEIF New.temperature < 0 OR New.Temperature > 100 THEN
    SIGNAL SQLSTATE 'HY000'
  	SET MESSAGE_TEXT = 'Temerature must be between 0 and 100';	
  ELSEIF New.volume < Old.volume THEN
    SIGNAL SQLSTATE 'HY000'
    	SET MESSAGE_TEXT = 'Cannot shrink a tank.';
  END IF;

end;

SQL

     execute <<-SQL

CREATE TRIGGER add_tank
BEFORE INSERT ON tanks
  FOR EACH ROW
BEGIN
  IF New.name = '' THEN
    SIGNAL SQLSTATE 'HY000' -- 'HY000' indicates a general error
      SET MESSAGE_TEXT = 'Must input a title';
  ELSEIF New.description = '' THEN
    SIGNAL SQLSTATE 'HY000'
      SET MESSAGE_TEXT = 'Must input a description';  
  ELSEIF New.volume < 500 OR New.Volume > 100000 THEN
    SIGNAL SQLSTATE 'HY000'
      SET MESSAGE_TEXT = 'Volume must be between 500 and 100,000 gallons';
  ELSEIF New.volume IS NULL THEN
    SIGNAL SQLSTATE 'HY000'
      SET MESSAGE_TEXT = 'Must input volume';
  ELSEIF New.temperature IS NULL THEN
    SIGNAL SQLSTATE 'HY000'
  	SET MESSAGE_TEXT = 'Must input a temperature';
  ELSEIF New.temperature < 0 OR New.Temperature > 100 THEN
    SIGNAL SQLSTATE 'HY000'
  	SET MESSAGE_TEXT = 'Temerature must be between 0 and 100';	
  END IF;

end;

SQL


  end

  def down

execute <<-SQL
DROP TRIGGER IF EXISTS add_tank;
SQL

execute <<-SQL
DROP TRIGGER IF EXISTS update_tank;
SQL
	  
  end

end
