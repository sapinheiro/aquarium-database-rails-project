=begin
Animal stored procedures originally written by Sam Pinhero.
Adapted for Ruby on Rails by Jackie Ali Cordoba. Thanks Sam!
=end

class AddStoredProceduresToAnimals < ActiveRecord::Migration[5.1]
  def up
execute <<-SQL
      CREATE PROCEDURE all_animals()
      BEGIN
        SELECT * FROM animals;
      END;
SQL

execute <<-SQL
      CREATE PROCEDURE get_by_species
      (
        species_name VARCHAR(45)
      )
      BEGIN
        SELECT * FROM animals
        WHERE species = species_name;
      END;
SQL

execute <<-SQL
      CREATE PROCEDURE get_by_name
      (
        animal_name VARCHAR(45)
      )
      BEGIN
        select * from animals
          where name = animal_name;
      END;
SQL

execute <<-SQL
      CREATE PROCEDURE get_by_tank_name
      (
        tank_name VARCHAR(45)
      )
      BEGIN
        SELECT animal_id, animals.name, species, animals.tank, birth_date
        FROM animals
        JOIN tanks ON animals.tank = tanks.tank_id
        WHERE tanks.name = tank_name;
      END;
SQL

execute <<-SQL
      CREATE PROCEDURE get_by_tank_id
      (
        tank_id integer
      )
      BEGIN
        SELECT *
        FROM animals
        WHERE tank = tank_id;
      END;
SQL

execute <<-SQL
      CREATE PROCEDURE get_by_habitat
      (
        habitat_name VARCHAR(45)
      )
      BEGIN
        SELECT animal_id, animals.name, species, tank, birth_date
        FROM animals
        JOIN tanks on animals.tank = tanks.tank_id
        JOIN habitats on tanks.habitat_id = habitats.habitat_id
        WHERE habitats.name = habitat_name;
      END;
SQL

execute <<-SQL
      CREATE PROCEDURE get_by_birthday
      (
        birthday dateTime
      )
      BEGIN
        SELECT *
          FROM animals
          WHERE birth_date = birthday;
      END;
SQL

execute <<-SQL
      CREATE PROCEDURE create_animal
      (
        a_name varchar(45),
        a_species varchar(45),
        t_id int(11),
        birthday dateTime
      )
      BEGIN
        INSERT INTO animals
        (name, species, tank, birth_date)
        VALUES
        (a_name, a_species, t_id, birthday);
      END;
SQL

execute <<-SQL
      CREATE PROCEDURE update_animal
      (
        a_id int(11),
        a_name varchar(45),
        a_species varchar(45),
        t_id int(11),
        birthday dateTime
      )
      BEGIN
        UPDATE animals
         SET name = IFNULL(a_name, name),
             species    = IFNULL(a_species, species),
             tank   = IFNULL(t_id, tank),
             birthDate = IFNULL(birthday, birth_date)
       WHERE animal_id = a_id;
      END;
SQL

execute <<-SQL
      CREATE PROCEDURE delete_animal
      (
        a_id int(11)
      )
      BEGIN
        DELETE from animals
          WHERE animal_id = a_id;
      END;
SQL

execute <<-SQL
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
      END;
SQL

execute <<-SQL
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
      END;
SQL

execute <<-SQL

CREATE TRIGGER update_animal
BEFORE UPDATE ON animals
  FOR EACH ROW
BEGIN
  IF New.species != Old.species THEN
    SIGNAL SQLSTATE 'HY000' -- 'HY000' indicates a general error
      SET MESSAGE_TEXT = 'Cannot change species';
  ELSEIF New.birth_date != Old.birth_date THEN
    SIGNAL SQLSTATE 'HY000'
      SET MESSAGE_TEXT = 'Cannot change birthday';  
  END IF;
END;
SQL
execute <<-SQL

CREATE TRIGGER add_animal
BEFORE INSERT ON animals
  FOR EACH ROW
BEGIN
  IF New.species = '' THEN
    SIGNAL SQLSTATE 'HY000' -- 'HY000' indicates a general error
      SET MESSAGE_TEXT = 'Must input a species';
  ELSEIF New.birth_date > CURDATE() THEN
    SIGNAL SQLSTATE 'HY000'
      SET MESSAGE_TEXT = 'Can only add animals that have already been born.';  
  END IF;
  END;
  SQL
end


  # TODO: Figure out how to transform all of the "get_by"
  # into one procedure with optional arguments
  def down
execute <<-SQL
	DROP TRIGGER IF EXISTS add_animal;
SQL

execute <<-SQL
	DROP TRIGGER IF EXISTS update_animal;
SQL
execute <<-SQL
      DROP PROCEDURE IF EXISTS all_animals
SQL

execute <<-SQL
      DROP PROCEDURE IF EXISTS get_by_species
SQL

execute <<-SQL
      DROP PROCEDURE IF EXISTS get_by_name
SQL

execute <<-SQL
      DROP PROCEDURE IF EXISTS get_by_tank
SQL

execute <<-SQL
      DROP PROCEDURE IF EXISTS get_by_habitat
SQL

execute <<-SQL
      DROP PROCEDURE IF EXISTS get_by_birthday
SQL

execute <<-SQL
      DROP PROCEDURE IF EXISTS create_animal
SQL

execute <<-SQL
      DROP PROCEDURE IF EXISTS update_animal
SQL

execute <<-SQL
      DROP PROCEDURE IF EXISTS delete_animal
SQL
execute <<-SQL
      DROP PROCEDURE IF EXISTS get_animal
SQL
execute <<-SQL
      DROP FUNCTION IF EXISTS get_animal_count
SQL
  end
end
