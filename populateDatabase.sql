LOCK TABLES `habitats` WRITE;
INSERT INTO `habitats` VALUES (1,'Amazon Rainforest','Explore the exotic aquatic animals of the Amazon Rainforest. Located in South America, the Amazon Rainforest is home to thousands of diverse species.',2015),(2,'New England Shallows','There are plenty of fascinating animals living close to home! Meet creatures big and small who live just off our shores.',2015),(3,'Coral Reef','Colorful and full of activity, coral reefs are captivating habitats in need of protection. ',2015),(4,'Artic','While the cold tundra might seem menacing at first, it is full of many complex communities of animals who thrive in the cold environment. Meet a few different penguin species here!',2016);
UNLOCK TABLES;

LOCK TABLES `tanks` WRITE;
INSERT INTO `tanks` VALUES (1,'River','Meet the menacing inhabitants of the Amazon River!','fresh',2000,76,2015,1),(2,'Swamp','Lots of semi-aquatic creatures dwell in the murky marshes of the Amazon.','fresh',1500,78,2015,1),(3,'Waterfall','Look carefully to spot the bright spots of poison dart frogs hiding near the waterfall!','fresh',700,78,2015,1),(4,'Touch Tank','Meet the critters living off our shore! Carefully touch inhabitants of this shallow tank.','salt',3000,50,2015,2),(5,'Tidal Pool','Its almost low tide! See who has made a home in the shallow waters of our New England beaches.','salt',2000,52,2015,2),(6,'Lobster Hatchery','View infant and juvenile lobsters at different stages in the development process.','salt',2500,52,2017,2),(7,'Shark Hatchery','Look closely to see sharks developing as embryos. ','salt',1000,54,2016,2),(8,'Kids Tank','Plenty of bright fish call coral reefs home. See if you can spot Dory and Nemo!','salt',3500,60,2015,3),(9,'Posionous Fish','Not all members of coral reef communities are friendly. Though their bright colors might seem inviting, these fish produce deadly venoms.','salt',1000,58,2015,3),(10,'Deep Waters','Deep in the coral reef, large fish travel in schools. See if you can spot our Hammerhead!','salt',850,54,2015,3),(11,'Carribean Shallows','Closer to the surface, Carribean coral reefs are home to slow moving turtles and quick barracudas.','salt',10000,75,2016,3),(12,'Emperor Penguins','These regal penguins live in close knit family units and can weigh almost 90 pounds!','salt',6000,28,2017,4),(13,'Macaroni Penguins','Macaroni penguins are named for their distinctive yellow head feathers and are the most ubiquitous penguin on Earth!','salt',5000,26,2013,4),(14,'Chinstrap Penguins','Chinstrap penguins are named for the line of dark feathers below their beak.They are also called \"bearded penguins.\"\" \"','salt',6500,26,2015,4);
UNLOCK TABLES;

LOCK TABLES `animals` WRITE;
INSERT INTO `animals` VALUES
(1,NULL,'Piranha',1,'2010-01-18 00:00:00'),(2,NULL,'Piranha',1,'2010-01-18 00:00:00'),(3,NULL,'Piranha',1,'2010-05-18 00:00:00'),(4,NULL,'Piranha',1,'2010-01-18 00:00:00'),(5,NULL,'Piranha',1,'2010-06-06 00:00:00'),(6,NULL,'Piranha',1,'2015-12-14 00:00:00'),(7,NULL,'Piranha',1,'2010-01-18 00:00:00'),(8,NULL,'Piranha',1,'2012-01-18 00:00:00'),(9,NULL,'Piranha',1,'2010-01-18 00:00:00'),(10,NULL,'Piranha',1,'2010-01-18 00:00:00'),(11,'Sally','Pancake Stingray',1,'2008-04-05 00:00:00'),(12,'Raymond','Pancake Stingray',1,'2011-07-10 00:00:00'),(13,'Syrup','Pancake Stingray',1,'2011-06-04 00:00:00'),(14,'Annie','Anaconda',2,'2009-05-05 00:00:00'),(15,'Albert','Anaconda',2,'2008-03-01 00:00:00'),(16,'Spot','Yellow-Spotted Turtle',2,'2011-04-07 00:00:00'),(17,'Stripe','Yellow-Spotted Turtle',2,'2011-02-01 00:00:00'),(18,NULL,'Rummy Nose Tetra',2,'2011-01-03 00:00:00'),(19,NULL,'Rummy Nose Tetra',2,'2011-01-03 00:00:00'),(20,NULL,'Rummy Nose Tetra',2,'2011-01-03 00:00:00'),(21,NULL,'Rummy Nose Tetra',2,'2011-01-03 00:00:00'),(22,NULL,'Rummy Nose Tetra',2,'2011-01-03 00:00:00'),(23,NULL,'Rummy Nose Tetra',2,'2011-01-03 00:00:00'),(24,NULL,'Rummy Nose Tetra',2,'2011-01-03 00:00:00'),(25,'Red','Poison Dart Frog',3,NULL),(26,'Green','Poison Dart Frog',3,NULL),(27,'Yellow','Poison Dart Frog',3,NULL),(28,'BlueSpots','Poison Dart Frog',3,NULL),(29,'BlueStripe','Poison Dart Frog',3,NULL),(30,'Patrick','Common Star Fish',4,NULL),(31,'Patrisha','Common Star Fish',4,NULL),(32,'Estella','Common Star Fish',4,NULL),(33,'Stew','Common Star Fish',4,NULL),(34,'Banana','Orange-Footed Sea Cucumber',4,NULL),(35,'Cuke','Orange-Footed Sea Cucumber',4,NULL),(36,'Lucky','Horseshoe Crab',4,NULL),(37,'Larry','Horseshoe Crab',4,NULL),(38,'Harry','Hermit Crab',4,NULL),(39,'Henrietta','Hermit Crab',4,'2017-05-05 00:00:00'),(40,NULL,'Northern Read Anemone',5,NULL),(41,NULL,'Northern Read Anemone',5,NULL),(42,NULL,'Northern Read Anemone',5,NULL),(43,NULL,'Frilled Anemone',5,NULL),(44,NULL,'Frilled Anemone',5,NULL),(45,NULL,'Frilled Anemone',5,NULL),(46,NULL,'Frilled Anemone',5,NULL),(47,'Toady','Toad Crab',5,'2016-05-06 00:00:00'),(48,'Toadette','Toad Crab',5,'2016-05-06 00:00:00'),(49,'Larry','American Lobster',6,'2016-05-06 00:00:00'),(50,'Lolly','American Lobster',6,'2016-06-07 00:00:00'),(51,'Lucas','American Lobster',6,'2016-10-10 00:00:00'),(52,'Laura','American Lobster',6,'2017-04-04 00:00:00'),(53,'Lilly','American Lobster',6,'2017-05-05 00:00:00'),(54,'Sammy','Sandbar Shark',7,'2017-08-09 00:00:00'),(55,'Sandy','Sandbar Shark',7,'2017-10-15 00:00:00'),(56,'Silly','Sandbar Shark',7,'2017-02-02 00:00:00'),(57,'Bark','Dogfish Shark',7,NULL),(58,'Snoopy','Dogfish Shark',7,NULL),(59,NULL,'Clown Fish',8,NULL),(60,NULL,'Clown Fish',8,NULL),(61,NULL,'Clown Fish',8,NULL),(62,NULL,'Clown Fish',8,NULL),(63,NULL,'Clown Fish',8,NULL),(64,NULL,'Clown Fish',8,NULL),(65,NULL,'Clown Fish',8,NULL),(66,NULL,'Clown Fish',8,NULL),(67,NULL,'Clown Fish',8,NULL),(68,NULL,'Clown Fish',8,NULL),(69,NULL,'Clown Fish',8,NULL),(70,NULL,'Clown Fish',8,NULL),(71,NULL,'Clown Fish',8,NULL),(72,NULL,'Clown Fish',8,NULL),(73,NULL,'Clown Fish',8,NULL),(74,NULL,'Clown Fish',8,NULL),(75,NULL,'Clown Fish',8,NULL),(76,NULL,'Blue Tang',8,NULL),(77,NULL,'Parrotfish',8,NULL),(78,NULL,'Parrotfish',8,NULL),(79,NULL,'Parrotfish',8,NULL),(80,NULL,'Parrotfish',8,NULL),(81,NULL,'Parrotfish',8,NULL),(82,NULL,'Parrotfish',8,NULL),(83,NULL,'Parrotfish',8,NULL),(84,NULL,'Parrotfish',8,NULL),(85,NULL,'Rabbitfish',8,NULL),(86,NULL,'Rabbitfish',8,NULL),(87,NULL,'Rabbitfish',8,NULL),(88,NULL,'Rabbitfish',8,NULL),(89,NULL,'Rabbitfish',8,NULL),(90,NULL,'Rabbitfish',8,NULL),(91,'Simba','Lionfish',9,'2017-01-05 00:00:00'),(92,'Mufasa','Lionfish',9,NULL),(93,'Nala','Lionfish',9,NULL),(94,'Scar','Lionfish',9,NULL),(95,'Flotsam','Moray Eel',10,'2017-05-08 00:00:00'),(96,'Jetsam','Moray Eel',10,'2016-11-04 00:00:00'),(97,NULL,'Blowfish',10,NULL),(98,NULL,'Blowfish',10,NULL),(99,NULL,'Blowfish',10,NULL),(100,NULL,'Blowfish',10,NULL),(101,NULL,'Blowfish',10,NULL),(102,NULL,'Blowfish',10,NULL),(103,NULL,'Blowfish',10,NULL),(104,NULL,'Blowfish',10,NULL),(105,NULL,'Blowfish',10,NULL),(106,NULL,'Blowfish',10,NULL),(107,'Ham','Hammerhead Shark',10,'2015-01-06 00:00:00'),(108,'Nail','Hammerhead Shark',10,'2015-01-06 00:00:00'),(109,'Crush','Loggerhead Turtle',11,'1985-06-07 00:00:00'),(110,'Speedy','Loggerhead Turtle',11,'2001-08-03 00:00:00'),(111,NULL,'Barracuda',11,NULL),(112,NULL,'Barracuda',11,NULL),(113,NULL,'Barracuda',11,NULL),(114,NULL,'Barracuda',11,NULL),(115,NULL,'Barracuda',11,NULL),(116,NULL,'Barracuda',11,NULL),(117,NULL,'Barracuda',11,NULL),(118,NULL,'Barracuda',11,NULL),(119,NULL,'Barracuda',11,NULL),(120,NULL,'Barracuda',11,NULL),(121,NULL,'Yellow Tang',11,NULL),(122,NULL,'Yellow Tang',11,NULL),(123,NULL,'Yellow Tang',11,NULL),(124,NULL,'Yellow Tang',11,NULL),(125,NULL,'Dwarf Seahorse',11,NULL),(126,NULL,'Dwarf Seahorse',11,NULL),(127,NULL,'Dwarf Seahorse',11,NULL),(128,NULL,'Dwarf Seahorse',11,NULL),(129,NULL,'Dwarf Seahorse',11,NULL),(130,'King','Emperor Penguin',12,'2015-01-06 00:00:00'),(131,'Queen','Emperor Penguin',12,'2015-01-06 00:00:00'),(132,'Joker','Emperor Penguin',12,'2016-03-04 00:00:00'),(133,'Ace','Emperor Penguin',12,'2016-11-11 00:00:00'),(134,'Jack','Emperor Penguin',12,'2016-08-12 00:00:00'),(135,'Jill','Emperor Penguin',12,'2016-09-09 00:00:00'),(136,'Elizabeth','Emperor Penguin',12,'2017-03-03 00:00:00'),(137,'Philip','Emperor Penguin',12,'2017-02-07 00:00:00'),(138,'Harry','Emperor Penguin',12,'2017-04-04 00:00:00'),(139,'Kate','Emperor Penguin',12,'2017-04-15 00:00:00'),(140,'George','Emperor Penguin',12,'2017-03-03 00:00:00'),(141,'William','Emperor Penguin',12,'2017-02-27 00:00:00'),(142,'Spaghetti','Macaroni Penguin',13,'2015-05-16 00:00:00'),(143,'Tortellini','Macaroni Penguin',13,'2017-02-07 00:00:00'),(144,'Spirallini','Macaroni Penguin',13,'2016-02-03 00:00:00'),(145,'Fusilli','Macaroni Penguin',13,'2016-05-05 00:00:00'),(146,'Bowtie','Macaroni Penguin',13,'2011-02-16 00:00:00'),(147,'Kraft','Macaroni Penguin',13,'2016-04-03 00:00:00'),(148,'Lasagna','Macaroni Penguin',13,'2017-06-07 00:00:00'),(149,'Gotee','Chinstrap Penguin',14,'2015-09-09 00:00:00'),(150,'Muttonchop','Chinstrap Penguin',14,'2015-10-15 00:00:00'),(151,'Soulpatch','Chinstrap Penguin',14,'2016-02-02 00:00:00'),(152,'Anchor','Chinstrap Penguin',14,'2016-02-02 00:00:00'),(153,'Boxed','Chinstrap Penguin',14,'2017-06-07 00:00:00'),(154,'Handlebar','Chinstrap Penguin',14,'2017-02-16 00:00:00');
UNLOCK TABLES;

LOCK TABLES `employees` WRITE;
INSERT INTO `employees` VALUES (1,'Alice','Edleman','2015/01/01',NULL,60000),(2,'Bob','Franklin','2015/01/01',NULL,67000),(3,'Carla','Gerard','2016/02/04',NULL,50000),(4,'Dom','Howard','2017/02/06',NULL,50000),(5,'Isac','Noll','2015/01/01',NULL,60000),(6,'Jamie','Ogre','2015/01/01',NULL,67000),(7,'Karl','Pinkman','2016/06/06',NULL,50000),(8,'Laura','Quinn','2017/02/06',NULL,48000),(9,'Maria','Richard','2017/02/06',NULL,48000);
UNLOCK TABLES;

LOCK TABLES `events` WRITE;
INSERT INTO `events` VALUES (1,'Amazon River Lecture','Listen to a panel of Amazon River researchers as they recount their decades of experience in the habitat. ',15,3,4,60,'2018-01-01 19:00:00'),(2,'New  England Shore Lecture','A local sea turtle rescuer recounts her experiences and details efforts that must be taken to protect these gentle creatures.',15,3,4,60,'2018-03-01 19:00:00'),(3,'Octopus Night','Learn about the wide variety of octopi that inhabit our oceans!',15,3,4,60,'2018-06-01 19:00:00'),(4,'Touch tank after hours','Members only afterhours admitance to the touch tank. ',15,3,4,60,'2018-09-01 18:00:00'),(5,'Valentines day dinner','A romantic dinner in our main atrium.',30,3,3,30,'2018-02-14 19:30:00'),(6,'St Patricks Day','Celebrate by learning about the green wonders of our seas - turtles, anenomes, dart frogs, and more!',30,2,3,30,'2018-03-17 17:00:00'),(7,'Summer Solstice Bash','Spend the longest day of the year at our afterhours bash!',30,2,3,30,'2018-06-21 18:00:00'),(8,'Sea Turtle Benefit','Dinner to support our sea turtle rescue efforts',50,2,2,50,'2018-04-04 19:00:00'),(9,'Coral Reef Expansion Benefit','Support our efforts to expand our coral reef exhibits to include even more diverse wildlife!',50,2,2,50,'2018-05-25 15:00:00'),(10,'Behind the scenes - penguins','Get a closer look at the penguin habitat and the inner workings of our aquarium',50,2,2,50,'2018-01-15 15:00:00'),(11,'Behind the scenes - penguins','Get a closer look at the penguin habitat and the inner workings of our aquarium',50,2,2,50,'2018-10-31 15:00:00');
UNLOCK TABLES;

LOCK TABLES `members` WRITE;
INSERT INTO `members` VALUES (1,'Adrian','Zora','2011-05-05','2018-02-05',400),(2,'Barry','Yelp','2011-01-01','2017-04-04',400),(3,'Carrie','Xaviar','2011-01-02','2017-03-03',400),(4,'Daryl','Wellington','2011-01-03','2019-02-06',400),(5,'Earl','Verda','2011-01-04','2019-02-17',400),(6,'Fanni','Ulper','2011-01-05','2019-02-18',400),(7,'Garry','Tillman','2011-01-06','2019-02-19',500),(8,'Henrietta','Sharp','2011-01-07','2019-02-20',500),(9,'Isabel','Richards','2014-05-05','2019-02-21',500),(10,'Jasmine','Qunito','2014-05-05','2019-02-22',500),(11,'Kip','Pearlman','2015-05-08','2019-02-23',550),(12,'Lisa','Overton','2015-05-09','2017-02-04',550),(13,'Monica','North','2015-05-10','2019-04-02',550),(14,'Nora','Martian','2015-05-11','2016-02-17',550),(15,'Oscar','Lamberg','2015-05-12','2016-02-01',400),(16,'Priscilla','King','2015-05-13','2016-02-02',400),(17,'Queenie','Jasper','2015-05-14','2016-02-03',400),(18,'Regine','Icer','2015-05-15','2016-02-04',400),(19,'Shiela','Hopper','2015-05-16','2016-02-05',400),(20,'Tim','Gorman','2015-05-17','2016-02-06',400),(21,'Ugne','Fair','2017-02-02','2020-02-07',400),(22,'Veronica','Eager','2017-02-03','2020-02-08',400),(23,'Wilber','Dean','2017-02-04','2020-02-09',400),(24,'Xavier','Coleper','2017-02-05','2020-02-10',400),(25,'Yolanda','Bevers','2017-02-06','2020-02-11',400),(26,'Zach','Apple','2017-02-07','2020-02-12',400);
UNLOCK TABLES;

LOCK TABLES `event_registrations` WRITE;
INSERT INTO `event_registrations` VALUES (1,'2017-10-15 00:00:00',8,1,3);
INSERT INTO `event_registrations` VALUES (2,'2017-10-16 00:00:00',10,3,1);
INSERT INTO `event_registrations` VALUES (3,'2017-10-17 00:00:00',8,3,0);
INSERT INTO `event_registrations` VALUES (4,'2017-10-18 00:00:00',6,1,1);
INSERT INTO `event_registrations` VALUES (5,'2017-10-19 00:00:00',11,5,2);
INSERT INTO `event_registrations` VALUES (6,'2017-10-20 00:00:00',7,6,3);
INSERT INTO `event_registrations` VALUES (7,'2017-10-21 00:00:00',5,1,4);
INSERT INTO `event_registrations` VALUES (8,'2017-10-22 00:00:00',5,4,4);
INSERT INTO `event_registrations` VALUES (9,'2017-10-23 00:00:00',5,2,3);
INSERT INTO `event_registrations` VALUES (10,'2017-10-24 00:00:00',6,5,2);
INSERT INTO `event_registrations` VALUES (11,'2017-10-25 00:00:00',8,8,1);
INSERT INTO `event_registrations` VALUES (12,'2017-10-26 00:00:00',10,2,2);
INSERT INTO `event_registrations` VALUES (13,'2017-10-27 00:00:00',11,1,0);
INSERT INTO `event_registrations` VALUES (14,'2017-10-28 00:00:00',6,10,2);
INSERT INTO `event_registrations` VALUES(15,'2017-10-29 00:00:00',6,3,2);
INSERT INTO `event_registrations` VALUES (16,'2017-10-30 00:00:00',7,2,1);
INSERT INTO `event_registrations` VALUES (17,'2017-10-31 00:00:00',9,9,0);
INSERT INTO `event_registrations` VALUES (18,'2017-11-01 00:00:00',10,11,2);
UNLOCK TABLES;

LOCK TABLES `feeding_logs` WRITE;
INSERT INTO `feeding_logs` VALUES (1,'2017-11-01 00:00:00','sardines',60,6,12),(2,'2017-11-02 00:00:00','sardines',65,6,12),(3,'2017-11-03 00:00:00','sardines',60,6,12),(4,'2017-11-04 00:00:00','sardines',50,6,12),(5,'2017-11-05 00:00:00','sardines',60,6,12),(6,'2017-11-06 00:00:00','sardines',60,6,12),(7,'2017-11-07 00:00:00','sardines',60,6,12),(8,'2017-11-08 00:00:00','sardines',60,6,12),(9,'2017-11-09 00:00:00','sardines',60,6,12),(10,'2017-11-10 00:00:00','sardines',60,6,12),(11,'2017-11-11 00:00:00','sardines',60,6,12),(12,'2017-11-12 00:00:00','sardines',70,2,12),(13,'2017-11-13 00:00:00','sardines',60,2,12),(14,'2017-11-14 00:00:00','sardines',60,2,12),(15,'2017-11-15 00:00:00','sardines',60,2,12),(16,'2017-11-16 00:00:00','sardines',60,2,12),(17,'2017-11-17 00:00:00','sardines',60,2,12),(18,'2017-11-18 00:00:00','sardines',60,2,12),(19,'2017-11-19 00:00:00','sardines',55,2,12),(20,'2017-11-20 00:00:00','sardines',60,2,12),(21,'2017-11-21 00:00:00','sardines',60,2,12),(22,'2017-11-22 00:00:00','sardines',60,2,12),(23,'2017-11-23 00:00:00','sardines',68,2,12),(24,'2017-11-24 00:00:00','sardines',60,2,12),(25,'2017-11-25 00:00:00','sardines',60,2,12),(26,'2017-11-26 00:00:00','sardines',60,2,12),(27,'2017-11-27 00:00:00','sardines',57,2,12),(28,'2017-11-28 00:00:00','sardines',60,2,12),(29,'2017-11-01 00:00:00','sardines',60,3,13),(30,'2017-11-02 00:00:00','sardines',65,3,13),(31,'2017-11-03 00:00:00','sardines',60,3,13),(32,'2017-11-04 00:00:00','sardines',50,3,13),(33,'2017-11-05 00:00:00','sardines',60,3,13),(34,'2017-11-06 00:00:00','sardines',60,3,13),(35,'2017-11-07 00:00:00','sardines',60,3,13),(36,'2017-11-08 00:00:00','sardines',60,3,13),(37,'2017-11-09 00:00:00','sardines',60,3,13),(38,'2017-11-10 00:00:00','sardines',60,3,13),(39,'2017-11-11 00:00:00','sardines',60,3,13),(40,'2017-11-12 00:00:00','sardines',70,3,13),(41,'2017-11-13 00:00:00','sardines',60,3,13),(42,'2017-11-14 00:00:00','sardines',60,3,13),(43,'2017-11-15 00:00:00','sardines',60,3,13),(44,'2017-11-16 00:00:00','sardines',60,3,13),(45,'2017-11-17 00:00:00','sardines',60,3,13),(46,'2017-11-18 00:00:00','sardines',60,3,13),(47,'2017-11-19 00:00:00','sardines',55,3,13),(48,'2017-11-20 00:00:00','sardines',60,3,13),(49,'2017-11-21 00:00:00','sardines',60,3,13),(50,'2017-11-22 00:00:00','sardines',60,3,13),(51,'2017-11-23 00:00:00','sardines',68,3,13),(52,'2017-11-24 00:00:00','sardines',60,6,13),(53,'2017-11-25 00:00:00','sardines',60,6,13),(54,'2017-11-26 00:00:00','sardines',60,6,13),(55,'2017-11-27 00:00:00','sardines',57,6,13),(56,'2017-11-28 00:00:00','sardines',60,6,13),(57,'2017-11-01 00:00:00','sardines',60,6,14),(58,'2017-11-02 00:00:00','sardines',65,6,14),(59,'2017-11-03 00:00:00','sardines',60,6,14),(60,'2017-11-04 00:00:00','sardines',50,6,14),(61,'2017-11-05 00:00:00','sardines',60,6,14),(62,'2017-11-06 00:00:00','sardines',60,6,14),(63,'2017-11-07 00:00:00','sardines',60,6,14),(64,'2017-11-08 00:00:00','sardines',60,2,14),(65,'2017-11-09 00:00:00','sardines',60,2,14),(66,'2017-11-10 00:00:00','sardines',60,2,14),(67,'2017-11-11 00:00:00','sardines',60,2,14),(68,'2017-11-12 00:00:00','sardines',70,2,14),(69,'2017-11-13 00:00:00','sardines',60,2,14),(70,'2017-11-14 00:00:00','sardines',60,2,14),(71,'2017-11-15 00:00:00','sardines',60,2,14),(72,'2017-11-16 00:00:00','sardines',60,2,14),(73,'2017-11-17 00:00:00','sardines',60,2,14),(74,'2017-11-18 00:00:00','sardines',60,2,14),(75,'2017-11-19 00:00:00','sardines',55,2,14),(76,'2017-11-20 00:00:00','sardines',60,2,14),(77,'2017-11-21 00:00:00','sardines',60,2,14),(78,'2017-11-22 00:00:00','sardines',60,2,14),(79,'2017-11-23 00:00:00','sardines',68,2,14),(80,'2017-11-24 00:00:00','sardines',60,2,14),(81,'2017-11-25 00:00:00','sardines',60,2,14),(82,'2017-11-26 00:00:00','sardines',60,2,14),(83,'2017-11-27 00:00:00','sardines',57,2,14),(84,'2017-11-28 00:00:00','sardines',60,2,14),(85,'2017-11-01 00:00:00','mice',2,2,2),(86,'2017-11-02 00:00:00','crushed grubs',1,2,2),(87,'2017-11-03 00:00:00','mice',2,2,2),(88,'2017-11-04 00:00:00','crushed grubs',1,2,2),(89,'2017-11-05 00:00:00','mice',2,2,2),(90,'2017-11-06 00:00:00','crushed grubs',1,2,2),(91,'2017-11-07 00:00:00','mice',2,2,2),(92,'2017-11-08 00:00:00','crushedgrubs',1,2,2),(93,'2017-11-09 00:00:00','mice',2,3,2),(94,'2017-11-10 00:00:00','crushed grubs',1,3,2),(95,'2017-11-11 00:00:00','mice',2,3,2),(96,'2017-11-12 00:00:00','crushed grubs',1,3,2),(97,'2017-11-13 00:00:00','mice',2,3,2),(98,'2017-11-14 00:00:00','crushed grubs',1,3,2),(99,'2017-11-15 00:00:00','mice',2,3,2),(100,'2017-11-16 00:00:00','crushedgrubs',1,3,2),(101,'2017-11-17 00:00:00','mice',2,3,2),(102,'2017-11-18 00:00:00','crushed grubs',1,3,2),(103,'2017-11-19 00:00:00','mice',2,4,2),(104,'2017-11-20 00:00:00','crushed grubs',1,4,2),(105,'2017-11-21 00:00:00','mice',2,4,2),(106,'2017-11-22 00:00:00','crushed grubs',1,4,2),(107,'2017-11-23 00:00:00','mice',2,4,2),(108,'2017-11-24 00:00:00','crushedgrubs',1,4,2),(109,'2017-11-25 00:00:00','crushed grubs',1,6,2),(110,'2017-11-26 00:00:00','mice',2,6,2),(111,'2017-11-27 00:00:00','crushed grubs',1,6,2),(112,'2017-11-28 00:00:00','mice',2,6,2),(113,'2017-11-01 00:00:00','fish carcass',4,2,1),(114,'2017-11-02 00:00:00','fish carcass',4,2,1),(115,'2017-11-03 00:00:00','fish carcass',4,2,1),(116,'2017-11-04 00:00:00','fish carcass',4,2,1),(117,'2017-11-05 00:00:00','fish carcass',4,2,1),(118,'2017-11-06 00:00:00','fish carcass',4,2,1),(119,'2017-11-07 00:00:00','fish carcass',4,2,1),(120,'2017-11-08 00:00:00','fish carcass',4,2,1),(121,'2017-11-09 00:00:00','fish carcass',4,2,1),(122,'2017-11-10 00:00:00','fish carcass',4,3,1),(123,'2017-11-11 00:00:00','fish carcass',4,3,1),(124,'2017-11-12 00:00:00','fish carcass',4,3,1),(125,'2017-11-13 00:00:00','fish carcass',4,3,1),(126,'2017-11-14 00:00:00','fish carcass',4,3,1),(127,'2017-11-15 00:00:00','fish carcass',4,3,1),(128,'2017-11-16 00:00:00','fish carcass',4,3,1),(129,'2017-11-17 00:00:00','fish carcass',4,3,1),(130,'2017-11-18 00:00:00','fish carcass',4,3,1),(131,'2017-11-19 00:00:00','fish carcass',4,3,1),(132,'2017-11-20 00:00:00','fish carcass',4,3,1),(133,'2017-11-21 00:00:00','fish carcass',4,3,1),(134,'2017-11-22 00:00:00','fish carcass',4,3,1),(135,'2017-11-23 00:00:00','fish carcass',4,3,1),(136,'2017-11-24 00:00:00','fish carcass',4,3,1),(137,'2017-11-25 00:00:00','fish carcass',4,3,1),(138,'2017-11-26 00:00:00','fish carcass',4,3,1),(139,'2017-11-27 00:00:00','fish carcass',4,3,1),(140,'2017-11-28 00:00:00','fish carcass',4,3,1),(141,'2017-11-01 00:00:00','crushed grubs',2,6,3),(142,'2017-11-02 00:00:00','crushed grubs',2,6,3),(143,'2017-11-03 00:00:00','crushed grubs',2.5,6,3),(144,'2017-11-04 00:00:00','crushed grubs',2,6,3),(145,'2017-11-05 00:00:00','crushed grubs',2,6,3),(146,'2017-11-06 00:00:00','crushed grubs',2,6,3),(147,'2017-11-07 00:00:00','crushed grubs',2,6,3),(148,'2017-11-08 00:00:00','crushed grubs',2,6,3),(149,'2017-11-09 00:00:00','crushed grubs',2,6,3),(150,'2017-11-10 00:00:00','crushed grubs',1.5,6,3),(151,'2017-11-11 00:00:00','crushed grubs',2,6,3),(152,'2017-11-12 00:00:00','crushed grubs',2,6,3),(153,'2017-11-13 00:00:00','crushed grubs',2,6,3),(154,'2017-11-14 00:00:00','crushed grubs',2.5,6,3),(155,'2017-11-15 00:00:00','crushed grubs',2,6,3),(156,'2017-11-16 00:00:00','crushed grubs',2,6,3),(157,'2017-11-17 00:00:00','crushed grubs',2,6,3),(158,'2017-11-18 00:00:00','crushed grubs',2,2,3),(159,'2017-11-19 00:00:00','crushed grubs',2,2,3),(160,'2017-11-20 00:00:00','crushed grubs',1.5,2,3),(161,'2017-11-21 00:00:00','crushed grubs',2,2,3),(162,'2017-11-22 00:00:00','crushed grubs',2,2,3),(163,'2017-11-23 00:00:00','crushed grubs',2,2,3),(164,'2017-11-24 00:00:00','crushed grubs',2,2,3),(165,'2017-11-25 00:00:00','crushed grubs',2,2,3),(166,'2017-11-26 00:00:00','crushed grubs',2,2,3),(167,'2017-11-27 00:00:00','crushed grubs',2,2,3),(168,'2017-11-28 00:00:00','crushed grubs',2,2,3),(169,'2017-11-01 00:00:00','plankton',7,4,4),(170,'2017-11-02 00:00:00','plankton',7,4,4),(171,'2017-11-03 00:00:00','plankton',7.5,4,4),(172,'2017-11-04 00:00:00','plankton',7,4,4),(173,'2017-11-05 00:00:00','plankton',7,6,4),(174,'2017-11-06 00:00:00','plankton',7,6,4),(175,'2017-11-07 00:00:00','plankton',8,6,4),(176,'2017-11-08 00:00:00','plankton',7,6,4),(177,'2017-11-09 00:00:00','plankton',7,6,4),(178,'2017-11-10 00:00:00','plankton',7,6,4),(179,'2017-11-11 00:00:00','plankton',7,6,4),(180,'2017-11-12 00:00:00','plankton',7,6,4),(181,'2017-11-13 00:00:00','plankton',9,4,4),(182,'2017-11-14 00:00:00','plankton',7,4,4),(183,'2017-11-15 00:00:00','plankton',7,4,4),(184,'2017-11-16 00:00:00','plankton',7,4,4),(185,'2017-11-17 00:00:00','plankton',7,4,4),(186,'2017-11-18 00:00:00','plankton',7,4,4),(187,'2017-11-19 00:00:00','plankton',7,3,4),(188,'2017-11-20 00:00:00','plankton',8,3,4),(189,'2017-11-21 00:00:00','plankton',7,3,4),(190,'2017-11-22 00:00:00','plankton',7,3,4),(191,'2017-11-23 00:00:00','plankton',7,3,4),(192,'2017-11-24 00:00:00','plankton',7,3,4),(193,'2017-11-25 00:00:00','plankton',7,3,4),(194,'2017-11-26 00:00:00','plankton',6,3,4),(195,'2017-11-27 00:00:00','plankton',7,3,4),(196,'2017-11-28 00:00:00','plankton',7,3,4),(197,'2017-11-01 00:00:00','minnows',4,6,5),(198,'2017-11-02 00:00:00','minnows',3.5,6,5),(199,'2017-11-03 00:00:00','minnows',3,6,5),(200,'2017-11-04 00:00:00','minnows',3,6,5),(201,'2017-11-05 00:00:00','minnows',3,6,5),(202,'2017-11-06 00:00:00','minnows',4.5,6,5),(203,'2017-11-07 00:00:00','minnows',5,6,5),(204,'2017-11-08 00:00:00','minnows',3,6,5),(205,'2017-11-09 00:00:00','minnows',3,6,5),(206,'2017-11-10 00:00:00','minnows',3.5,6,5),(207,'2017-11-11 00:00:00','minnows',3,6,5),(208,'2017-11-12 00:00:00','minnows',3,4,5),(209,'2017-11-13 00:00:00','minnows',3,4,5),(210,'2017-11-14 00:00:00','minnows',4.5,4,5),(211,'2017-11-15 00:00:00','minnows',5,4,5),(212,'2017-11-16 00:00:00','minnows',3,4,5),(213,'2017-11-17 00:00:00','minnows',3,4,5),(214,'2017-11-18 00:00:00','minnows',3.5,4,5),(215,'2017-11-19 00:00:00','minnows',3,4,5),(216,'2017-11-20 00:00:00','minnows',3,4,5),(217,'2017-11-21 00:00:00','minnows',3,4,5),(218,'2017-11-22 00:00:00','minnows',4.5,2,5),(219,'2017-11-23 00:00:00','minnows',5,2,5),(220,'2017-11-24 00:00:00','minnows',3,2,5),(221,'2017-11-25 00:00:00','minnows',3,2,5),(222,'2017-11-26 00:00:00','minnows',4,2,5),(223,'2017-11-27 00:00:00','minnows',4,2,5),(224,'2017-11-28 00:00:00','minnows',4.5,2,5),(225,'2017-11-01 00:00:00','minnows',2,6,6),(226,'2017-11-02 00:00:00','minnows',2,6,6),(227,'2017-11-03 00:00:00','minnows',2,6,6),(228,'2017-11-04 00:00:00','minnows',2,6,6),(229,'2017-11-05 00:00:00','minnows',2,6,6),(230,'2017-11-06 00:00:00','minnows',2,6,6),(231,'2017-11-07 00:00:00','minnows',2.5,6,6),(232,'2017-11-08 00:00:00','minnows',2,6,6),(233,'2017-11-09 00:00:00','minnows',2,6,6),(234,'2017-11-10 00:00:00','minnows',2,6,6),(235,'2017-11-11 00:00:00','minnows',1.5,6,6),(236,'2017-11-12 00:00:00','minnows',2,4,6),(237,'2017-11-13 00:00:00','minnows',2,4,6),(238,'2017-11-14 00:00:00','minnows',2,4,6),(239,'2017-11-15 00:00:00','minnows',2,4,6),(240,'2017-11-16 00:00:00','minnows',2.5,4,6),(241,'2017-11-17 00:00:00','minnows',2,4,6),(242,'2017-11-18 00:00:00','minnows',2,4,6),(243,'2017-11-19 00:00:00','minnows',1.5,4,6),(244,'2017-11-20 00:00:00','minnows',2,4,6),(245,'2017-11-21 00:00:00','minnows',2,4,6),(246,'2017-11-22 00:00:00','minnows',2,2,6),(247,'2017-11-23 00:00:00','minnows',2,2,6),(248,'2017-11-24 00:00:00','minnows',2.5,2,6),(249,'2017-11-25 00:00:00','minnows',2,2,6),(250,'2017-11-26 00:00:00','minnows',2,2,6),(251,'2017-11-27 00:00:00','minnows',2,2,6),(252,'2017-11-28 00:00:00','minnows',2,2,6),(253,'2017-11-01 00:00:00','guppies',14,5,7),(254,'2017-11-02 00:00:00','guppies',14,5,7),(255,'2017-11-03 00:00:00','guppies',14,5,7),(256,'2017-11-04 00:00:00','guppies',14,5,7),(257,'2017-11-05 00:00:00','guppies',14,5,7),(258,'2017-11-06 00:00:00','guppies',14,5,7),(259,'2017-11-07 00:00:00','guppies',14,5,7),(260,'2017-11-08 00:00:00','guppies',14,5,7),(261,'2017-11-09 00:00:00','guppies',14,5,7),(262,'2017-11-10 00:00:00','guppies',14,5,7),(263,'2017-11-11 00:00:00','guppies',14,5,7),(264,'2017-11-12 00:00:00','guppies',14,5,7),(265,'2017-11-13 00:00:00','guppies',14,5,7),(266,'2017-11-14 00:00:00','guppies',14,5,7),(267,'2017-11-15 00:00:00','guppies',14,2,7),(268,'2017-11-16 00:00:00','guppies',14,2,7),(269,'2017-11-17 00:00:00','guppies',14,2,7),(270,'2017-11-18 00:00:00','guppies',14,2,7),(271,'2017-11-19 00:00:00','guppies',14,2,7),(272,'2017-11-20 00:00:00','guppies',14,2,7),(273,'2017-11-21 00:00:00','guppies',14,2,7),(274,'2017-11-22 00:00:00','guppies',14,2,7),(275,'2017-11-23 00:00:00','guppies',14,2,7),(276,'2017-11-24 00:00:00','guppies',14,2,7),(277,'2017-11-25 00:00:00','guppies',14,2,7),(278,'2017-11-26 00:00:00','guppies',14,6,7),(279,'2017-11-27 00:00:00','guppies',14,6,7),(280,'2017-11-28 00:00:00','guppies',14,6,7),(281,'2017-11-01 00:00:00','plankton',12,2,8),(282,'2017-11-02 00:00:00','plankton',13,2,8),(283,'2017-11-03 00:00:00','plankton',12,2,8),(284,'2017-11-04 00:00:00','plankton',12,2,8),(285,'2017-11-05 00:00:00','plankton',12,2,8),(286,'2017-11-06 00:00:00','plankton',12,2,8),(287,'2017-11-07 00:00:00','plankton',12,6,8),(288,'2017-11-08 00:00:00','plankton',12,6,8),(289,'2017-11-09 00:00:00','plankton',11,6,8),(290,'2017-11-10 00:00:00','plankton',12,6,8),(291,'2017-11-11 00:00:00','plankton',13,6,8),(292,'2017-11-12 00:00:00','plankton',12,6,8),(293,'2017-11-13 00:00:00','plankton',12,6,8),(294,'2017-11-14 00:00:00','plankton',12,6,8),(295,'2017-11-15 00:00:00','plankton',11,6,8),(296,'2017-11-16 00:00:00','plankton',12,6,8),(297,'2017-11-17 00:00:00','plankton',12,6,8),(298,'2017-11-18 00:00:00','plankton',12,3,8),(299,'2017-11-19 00:00:00','plankton',12,3,8),(300,'2017-11-20 00:00:00','plankton',12,3,8),(301,'2017-11-21 00:00:00','plankton',12,3,8),(302,'2017-11-22 00:00:00','plankton',11,3,8),(303,'2017-11-23 00:00:00','plankton',12,3,8),(304,'2017-11-24 00:00:00','plankton',12,3,8),(305,'2017-11-25 00:00:00','plankton',12,3,8),(306,'2017-11-26 00:00:00','plankton',12,3,8),(307,'2017-11-27 00:00:00','plankton',12,3,8),(308,'2017-11-28 00:00:00','plankton',12,3,8),(309,'2017-11-01 00:00:00','shrimp',15,4,9),(310,'2017-11-02 00:00:00','shrimp',15,4,9),(311,'2017-11-03 00:00:00','shrimp',15,4,9),(312,'2017-11-04 00:00:00','shrimp',15,4,9),(313,'2017-11-05 00:00:00','shrimp',15,4,9),(314,'2017-11-06 00:00:00','shrimp',15,4,9),(315,'2017-11-07 00:00:00','shrimp',15,4,9),(316,'2017-11-08 00:00:00','shrimp',16,4,9),(317,'2017-11-09 00:00:00','shrimp',15,4,9),(318,'2017-11-10 00:00:00','shrimp',15,4,9),(319,'2017-11-11 00:00:00','shrimp',15,4,9),(320,'2017-11-12 00:00:00','shrimp',15,4,9),(321,'2017-11-13 00:00:00','shrimp',15,6,9),(322,'2017-11-14 00:00:00','shrimp',15,6,9),(323,'2017-11-15 00:00:00','shrimp',15,6,9),(324,'2017-11-16 00:00:00','shrimp',15,6,9),(325,'2017-11-17 00:00:00','shrimp',15,6,9),(326,'2017-11-18 00:00:00','shrimp',16,6,9),(327,'2017-11-19 00:00:00','shrimp',15,6,9),(328,'2017-11-20 00:00:00','shrimp',15,6,9),(329,'2017-11-21 00:00:00','shrimp',15,6,9),(330,'2017-11-22 00:00:00','shrimp',15,6,9),(331,'2017-11-23 00:00:00','shrimp',15,6,9),(332,'2017-11-24 00:00:00','shrimp',15,6,9),(333,'2017-11-25 00:00:00','shrimp',16,6,9),(334,'2017-11-26 00:00:00','shrimp',15,6,9),(335,'2017-11-27 00:00:00','shrimp',15,6,9),(336,'2017-11-28 00:00:00','shrimp',15,6,9),(337,'2017-11-01 00:00:00','plankton',30,3,11),(338,'2017-11-02 00:00:00','lettuce',10,4,11),(339,'2017-11-03 00:00:00','plankton',30,3,11),(340,'2017-11-04 00:00:00','lettuce',10,4,11),(341,'2017-11-05 00:00:00','plankton',30,3,11),(342,'2017-11-06 00:00:00','lettuce',10,4,11),(343,'2017-11-07 00:00:00','plankton',30,3,11),(344,'2017-11-08 00:00:00','lettuce',10,4,11),(345,'2017-11-09 00:00:00','plankton',30,3,11),(346,'2017-11-10 00:00:00','lettuce',10,4,11),(347,'2017-11-11 00:00:00','plankton',30,3,11),(348,'2017-11-12 00:00:00','lettuce',10,4,11),(349,'2017-11-13 00:00:00','plankton',30,3,11),(350,'2017-11-14 00:00:00','lettuce',10,4,11),(351,'2017-11-15 00:00:00','plankton',30,3,11),(352,'2017-11-16 00:00:00','lettuce',10,4,11),(353,'2017-11-17 00:00:00','plankton',30,3,11),(354,'2017-11-18 00:00:00','lettuce',10,4,11),(355,'2017-11-19 00:00:00','plankton',30,3,11),(356,'2017-11-20 00:00:00','lettuce',10,4,11),(357,'2017-11-21 00:00:00','plankton',30,3,11),(358,'2017-11-22 00:00:00','lettuce',10,4,11),(359,'2017-11-23 00:00:00','plankton',30,3,11),(360,'2017-11-24 00:00:00','lettuce',10,4,11),(361,'2017-11-25 00:00:00','plankton',30,3,11),(362,'2017-11-26 00:00:00','lettuce',10,4,11),(363,'2017-11-27 00:00:00','plankton',30,3,11),(364,'2017-11-28 00:00:00','lettuce',10,4,11),(365,'2017-11-01 00:00:00','sardines',15,6,10),(366,'2017-11-02 00:00:00','sardines',14,6,10),(367,'2017-11-03 00:00:00','sardines',15,6,10),(368,'2017-11-04 00:00:00','sardines',16,6,10),(369,'2017-11-05 00:00:00','sardines',15,6,10),(370,'2017-11-06 00:00:00','sardines',15,2,10),(371,'2017-11-07 00:00:00','sardines',17,2,10),(372,'2017-11-08 00:00:00','sardines',15,2,10),(373,'2017-11-09 00:00:00','sardines',15,2,10),(374,'2017-11-10 00:00:00','sardines',15,2,10),(375,'2017-11-11 00:00:00','sardines',15,2,10),(376,'2017-11-12 00:00:00','sardines',15,2,10),(377,'2017-11-13 00:00:00','sardines',14,2,10),(378,'2017-11-14 00:00:00','sardines',15,2,10),(379,'2017-11-15 00:00:00','sardines',15,2,10),(380,'2017-11-16 00:00:00','sardines',15,2,10),(381,'2017-11-17 00:00:00','sardines',15,2,10),(382,'2017-11-18 00:00:00','sardines',15,2,10),(383,'2017-11-19 00:00:00','sardines',15,2,10),(384,'2017-11-20 00:00:00','sardines',14,2,10),(385,'2017-11-21 00:00:00','sardines',15,6,10),(386,'2017-11-22 00:00:00','sardines',15,6,10),(387,'2017-11-23 00:00:00','sardines',15,6,10),(388,'2017-11-24 00:00:00','sardines',15,6,10),(389,'2017-11-25 00:00:00','sardines',15,6,10),(390,'2017-11-26 00:00:00','sardines',14,6,10),(391,'2017-11-27 00:00:00','sardines',15,6,10),(392,'2017-11-28 00:00:00','sardines',15,6,10);
UNLOCK TABLES;

LOCK TABLES `treatment_logs` WRITE;
INSERT INTO `treatment_logs` VALUES (1,'2017-01-01 00:00:00','Cophicin',20,1,150),(2,'2017-01-02 00:00:00','Cophicin',20,1,150),(3,'2017-01-03 00:00:00','Cophicin',30,1,150),(4,'2017-01-04 00:00:00','Cophicin',30,1,150),(5,'2017-03-05 00:00:00','Finitra',20,1,20),(6,'2017-03-06 00:00:00','Finitra',20,1,20),(7,'2017-03-07 00:00:00','Finitra',15.5,1,20),(8,'2017-03-08 00:00:00','Finitra',15.5,4,20),(9,'2017-05-07 00:00:00','Shellator',20,4,20),(10,'2017-05-08 00:00:00','Shellator',20,4,17),(11,'2017-05-09 00:00:00','Shellator',20,4,17),(12,'2017-05-10 00:00:00','Shellator',20,4,17),(13,'2017-05-11 00:00:00','Shellator',20,4,17),(14,'2017-05-12 00:00:00','Shellator',20,4,17),(15,'2017-05-13 00:00:00','Shellator',20,4,17),(16,'2017-05-14 00:00:00','Shellator',50,1,109),(17,'2017-05-15 00:00:00','Shellator',50,1,109),(18,'2017-05-16 00:00:00','Shellator',50,1,109),(19,'2017-05-17 00:00:00','Shellator',50,1,109),(20,'2017-05-18 00:00:00','Shellator',50,1,109),(21,'2017-05-19 00:00:00','Shellator',50,1,109),(22,'2017-05-20 00:00:00','Shellator',50,1,109),(23,'2017-05-21 00:00:00','Shellator',50,1,109),(24,'2017-05-22 00:00:00','Shellator',50,1,109),(25,'2017-05-23 00:00:00','Shellator',50,1,109),(26,'2017-05-24 00:00:00','Shellator',50,1,109),(27,'2017-05-25 00:00:00','Shellator',50,1,109),(28,'2017-05-26 00:00:00','Shellator',50,1,109),(29,'2017-05-27 00:00:00','Shellator',50,1,109),(30,'2017-05-28 00:00:00','Shellator',50,1,109),(31,'2017-05-29 00:00:00','Shellator',30,1,109),(32,'2017-05-30 00:00:00','Shellator',30,1,109),(33,'2017-05-31 00:00:00','Shellator',30,1,109),(34,'2017-06-01 00:00:00','Shellator',30,4,109),(35,'2017-06-02 00:00:00','Shellator',30,4,109),(36,'2017-06-03 00:00:00','Shellator',30,4,109),(37,'2017-06-04 00:00:00','Shellator',30,4,109),(38,'2017-06-05 00:00:00','Shellator',30,4,109),(39,'2017-06-06 00:00:00','Shellator',30,4,109),(40,'2017-06-07 00:00:00','Shellator',30,4,109),(41,'2017-06-08 00:00:00','Shellator',30,4,109),(42,'2017-06-09 00:00:00','Shellator',30,4,109),(43,'2017-06-10 00:00:00','Shellator',30,4,109),(44,'2017-06-11 00:00:00','Shellator',30,4,109),(45,'2017-06-12 00:00:00','Shellator',30,4,109),(46,'2017-06-13 00:00:00','Shellator',10,4,109),(47,'2017-06-14 00:00:00','Shellator',10,4,109),(48,'2017-06-15 00:00:00','Shellator',10,4,109),(49,'2017-06-16 00:00:00','Shellator',10,4,109),(50,'2017-06-17 00:00:00','Shellator',10,4,109),(51,'2017-06-18 00:00:00','Shellator',10,4,109),(52,'2017-06-19 00:00:00','Shellator',10,4,109);
UNLOCK TABLES;
