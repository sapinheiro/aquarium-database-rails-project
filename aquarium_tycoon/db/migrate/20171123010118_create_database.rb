=begin
This migration initializes all of the tables in our database.

We're using the up/down methods from old school Rails rather than
change because we think it makes it easier to embed our SQL code and reverse
the effects if need be.

Note: Using SQL code in Rails migrations for simple tasks like creating tables
and attributes is bad practice. It should only be used for things like setting
foreign key/more complicated constraints. Despite that, we are writing it this way
because this class requires more SQL code in the backend than API best practices
traditionally allow.

NOTE: The CREATE TABLE commands in this migration were originally written by
Kayla Brady in another file. They were adapted for Ruby on Rails by Jackie Ali Cordoba.
Thanks for the schema, Kayla!
=end

class CreateDatabase < ActiveRecord::Migration[5.1]
  # This method contains the changes introduced in this migration
  def up
    execute <<-SQL
      CREATE TABLE `habitats` (
        `habitat_id` int(11) NOT NULL AUTO_INCREMENT,
        `name` varchar(45) NOT NULL,
        `description` varchar(200) DEFAULT NULL,
        `year_added` int(11) NOT NULL,
 CHECK (year_added <= YEAR(CURDATE)),
        PRIMARY KEY (`habitat_id`) 

      );
    SQL

    execute <<-SQL
      CREATE TABLE `tanks` (
        `tank_id` int(11) NOT NULL AUTO_INCREMENT,
        `name` varchar(45) NOT NULL,
        `description` varchar(200) DEFAULT NULL,
        `water_type` enum('fresh','salt') NOT NULL,
        `volume` double NOT NULL,
        `temperature` double NOT NULL,
        `year_built` int(11) NOT NULL,
        `habitat_id` int(11) NOT NULL,
        PRIMARY KEY (`tank_id`),
        CONSTRAINT `fk_habitat_tank` FOREIGN KEY (`habitat_id`) REFERENCES `habitats` (`habitat_id`) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT valid_temp CHECK (temperature < 100 AND temperautre > 0)      
);
    SQL

    execute <<-SQL
      CREATE TABLE `animals` (
        `animal_id` int(11) NOT NULL AUTO_INCREMENT,
        `name` varchar(45) DEFAULT NULL,
        `species` varchar(45) NOT NULL,
        `tank_id` int(11) NOT NULL,
        birth_date datetime DEFAULT NULL,
        PRIMARY KEY (animal_id),
        CONSTRAINT fk_tank_animal FOREIGN KEY (tank_id) REFERENCES tanks(tank_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT valid_bday CHECK (birth_date <= CURDATE())
      );
    SQL

    execute <<-SQL
      CREATE TABLE employees (
        employee_id int(11) NOT NULL AUTO_INCREMENT,
        first_name varchar(45) NOT NULL,
        last_name varchar(45) NOT NULL,
        hired_date date NOT NULL,
        fired_date date NULL,
        salary double NOT NULL,
        PRIMARY KEY (employee_id),
	CONSTRAINT valid_sal CHECK (salary >= 40000)
      );
    SQL


    execute <<-SQL
      CREATE TABLE feeding_logs (
        feeding_id int(11) NOT NULL AUTO_INCREMENT,
        time datetime NOT NULL,
        food varchar(45) NOT NULL,
        quantity float NOT NULL,
        employee_id int(11) NOT NULL,
        tank_id int(11) DEFAULT NULL,
        PRIMARY KEY (feeding_id),
        CONSTRAINT fk_tank_feeding FOREIGN KEY (tank_id) REFERENCES tanks(tank_id)
        ON DELETE SET NULL ON UPDATE CASCADE,
        CONSTRAINT fk_employee_feeding FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
        ON DELETE CASCADE ON UPDATE CASCADE
      );
    SQL

    execute <<-SQL
      CREATE TABLE treatment_logs (
        treatment_id int(11) NOT NULL AUTO_INCREMENT,
        time datetime NOT NULL,
        medicine varchar(45) NOT NULL,
        quantity float NOT NULL,
        employee_id int(11) NOT NULL,
        animal_id int(11) NOT NULL,
        PRIMARY KEY (treatment_id),
        CONSTRAINT fk_animal_treatment FOREIGN KEY (animal_id) REFERENCES animals(animal_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT fk_employee_treatment FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
        ON DELETE CASCADE ON UPDATE CASCADE
      );
    SQL

    execute <<-SQL
      CREATE TABLE events (
        event_id int(11) NOT NULL AUTO_INCREMENT,
        title varchar(45) NOT NULL,
        description varchar(200),
        price float NOT NULL,
        managing_employee int(11) NOT NULL,
        max_guests_per_person int(11) DEFAULT NULL,
        max_attending int(11) NOT NULL,
        event_date datetime NOT NULL,
        PRIMARY KEY (event_id),
        KEY manager (managing_employee),
        CONSTRAINT fk_employee_events FOREIGN KEY (managing_employee) REFERENCES employees(employee_id) ON UPDATE CASCADE,
  	CONSTRAINT valid_guest_limit CHECK (max_guests_per_person <= max_attending)	
);
    SQL

    execute <<-SQL
      CREATE TABLE members (
        member_id int(11) NOT NULL AUTO_INCREMENT,
        first_name varchar(45) NOT NULL,
        last_name varchar(45) NOT NULL,
        date_joined date NOT NULL,
        expiration_date date NOT NULL,
        fee double NOT NULL,
        PRIMARY KEY (member_id)
      );
    SQL

    execute <<-SQL
      CREATE TABLE event_registrations (
        registration_code int(11) NOT NULL AUTO_INCREMENT,
        time datetime NOT NULL,
        member_id int(11) NOT NULL,
        event_id int(11) NOT NULL,
        guest_count int(11) DEFAULT NULL,
        PRIMARY KEY (registration_code),
        KEY eventRegistered (event_id),
        KEY memberRegistering (member_id),
        CONSTRAINT fk_event_registration FOREIGN KEY (event_id) REFERENCES events(event_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT fk_member_registration FOREIGN KEY (member_id) REFERENCES members(member_id)
        ON DELETE CASCADE ON UPDATE CASCADE
      );
    SQL
  end

  # This method details steps for reversing the migration if it needs to be rolled back
  def down
    execute <<-SQL
      DROP TABLE event_registrations;
    SQL

    execute <<-SQL
      DROP TABLE members;
    SQL

    execute <<-SQL
      DROP TABLE events;
    SQL

    execute <<-SQL
      DROP TABLE treatment_logs;
    SQL

    execute <<-SQL
      DROP TABLE feeding_logs;
    SQL

    execute <<-SQL
      DROP TABLE employees;
    SQL

    execute <<-SQL
      DROP TABLE animals;
    SQL

    execute <<-SQL
      DROP TABLE tanks;
    SQL

    execute <<-SQL
      DROP TABLE habitats;
    SQL
  end
end
