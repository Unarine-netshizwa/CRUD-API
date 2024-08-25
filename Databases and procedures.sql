CREATE DATABASE `employee_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

/*  employees table*/

CREATE TABLE `employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `employee_code` varchar(45) DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*employees procedure*/

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_employee_add_or_edit`(
IN _id INT,
IN _name VARCHAR(45),
IN _employee_code VARCHAR(45),
IN _salary INT

)
BEGIN
	IF _id = 0 THEN
		INSERT INTO employees(name,employee_code,salary)
		VALUES (_name,_employee_code,_salary);
        
	ELSE
		UPDATE employees
        SET name = _name,
		employee_code = _employee_code,
        salary = _salary
        WHERE id = _id;
	END IF;
    
    SELECT ROW_COUNT() AS 'affectedRows';
END$$
DELIMITER ;


/*users table*/
CREATE TABLE `users` (
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `contacts` int(11) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `isActive` tinyint(4) DEFAULT 0,
  `createdAt` datetime DEFAULT current_timestamp(),
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*users edit or add procedure*/

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `addEdit`(
IN _id INT,
IN _name VARCHAR(255),
IN _email VARCHAR(255),
IN _password VARCHAR(45),
IN _contacts INT,
IN _age INT,
IN _isActive tinyint,
IN _createdAt date

)
BEGIN
	IF _id=0 THEN
		INSERT INTO users(name,email,Password,Contacts,Age,isActive,createdAt)
		VALUES (_name,_email,_password,_contacts,_age,_isActive,_createdAt);
        
	ELSE
		UPDATE users
        SET name = _name,
         email = _email,
        Password = _password,
        Contacts = _contacts,
        Age = _age,
        isActive = _isActive,
        createdAt = _createdAt
        
         WHERE id = _id;
	END IF;
    
    SELECT ROW_COUNT() AS 'affectedRows';
END$$
DELIMITER ;

