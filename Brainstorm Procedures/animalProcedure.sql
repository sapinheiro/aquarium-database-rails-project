DROP PROCEDURE IF EXISTS all_animals;

DELIMITER  //

CREATE PROCEDURE all_animals
(

)
BEGIN
	select * from animals;
END //

DELIMITER ;
 -- CALL all_animals();

DROP PROCEDURE IF EXISTS get_by_species;

DELIMITER  //

CREATE PROCEDURE get_by_species
(
	speciesName VARCHAR(45)
)
BEGIN
	select * from animals
    where species = speciesName;
END //

DELIMITER ;
-- CALL get_by_species("Common Star Fish");

DROP PROCEDURE IF EXISTS get_by_name;

DELIMITER  //

CREATE PROCEDURE get_by_name
(
	animalName VARCHAR(45)
)
BEGIN
	select * from animals
    where name = animalName;
END //

DELIMITER ;
-- CALL get_by_name("Patrick");

DROP PROCEDURE IF EXISTS get_by_tank;

DELIMITER  //

CREATE PROCEDURE get_by_tank
(
	tankName VARCHAR(45)
)
BEGIN
	select animalID, animals.name, species, tank, birthDate, tankID
    from animals
    join tanks on animals.tank = tanks.tankID
    where tanks.name = tankName;
END //

DELIMITER ;
-- CALL get_by_tank("River");

DROP PROCEDURE IF EXISTS get_by_habitat;

DELIMITER  //

CREATE PROCEDURE get_by_habitat
(
	habitatName VARCHAR(45)
)
BEGIN
	select animalID, animals.name, species, tank, birthDate, tankID
    from animals
    join tanks on animals.tank = tanks.tankID
    join habitats on tanks.habitatID = habitats.habitatID
    where habitats.name = habitatName;
END //

DELIMITER ;
-- CALL get_by_habitat("Amazon Rainforest");

DROP PROCEDURE IF EXISTS get_by_birthday;

DELIMITER  //

CREATE PROCEDURE get_by_birthday
(
	birthday dateTime
)
BEGIN
	select *
    from animals
    where birthDate = birthday;
END //

DELIMITER ;
-- CALL get_by_birthday("2010-01-18 00:00:00");

DROP PROCEDURE IF EXISTS create_animal;

DELIMITER  //

-- all values will have to be entered, or nulls where allowed
CREATE PROCEDURE create_animal
(
	aID int(11),
    aname varchar(45),
    aspecies varchar(45),
    tID int(11),
    birthday dateTime
)
BEGIN
	INSERT INTO animals
    values(aID, aname, aspecies, tID, birthday);
END //

DELIMITER ;
-- CALL create_animal(444, "spot", "seahorse", 4, "2011-03-11 22:22:22");

DROP PROCEDURE IF EXISTS update_animal;

DELIMITER  //

CREATE PROCEDURE update_animal
(
	aID int(11),
    aname varchar(45),
    aspecies varchar(45),
    tID int(11),
    birthday dateTime
)
BEGIN
	UPDATE animals
   SET name     = ifnull(aname, name),
       species    = ifnull(aspecies, species),
       tank   = ifnull(tID, tank),
       birthDate = ifnull(birthday, birthDate)
 WHERE animalID = aID;
END //

DELIMITER ;
-- CALL update_animal(154, "spot", "seahorse", 4, NULL);

DROP PROCEDURE IF EXISTS delete_animal;

DELIMITER  //

CREATE PROCEDURE delete_animal
(
	aID int(11)
)
BEGIN
	DELETE from animals
    WHERE animalID = aID;
END //

DELIMITER ;

-- CALL delete_animal(154);

select * from animals;