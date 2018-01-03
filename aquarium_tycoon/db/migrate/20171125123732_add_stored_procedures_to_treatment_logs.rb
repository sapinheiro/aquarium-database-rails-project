class AddStoredProceduresToTreatmentLogs < ActiveRecord::Migration[5.1]
  def up
execute <<-SQL
CREATE TRIGGER add_treatment
BEFORE INSERT ON treatment_logs
  FOR EACH ROW
BEGIN
  IF New.medicine = '' THEN
    SIGNAL SQLSTATE 'HY000' -- 'HY000' indicates a general error
      SET MESSAGE_TEXT = 'Must input a medicine';
  ELSEIF New.quantity IS NULL THEN
    SIGNAL SQLSTATE 'HY000'
      SET MESSAGE_TEXT = 'Must input a quantity';  
  ELSEIF New.quantity < 0 THEN
    SIGNAL SQLSTATE 'HY000'
      SET MESSAGE_TEXT = 'Must input a valid quantity';   
  END IF;

end;
SQL

  end

  def down
	 execute <<-SQL
	 DROP TRIGGER IF EXISTS add_treatment;
	 SQL
end
end
