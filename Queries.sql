-- Курсы, на которых обучается больше 30 студентов
SELECT
  id,
  name,
  COUNT(*) AS number_of_students
FROM `geekbrains_db`.`courses`
JOIN `geekbrains_db`.`students_on_course` ON (
  courses.id = students_on_course.courses_id)
GROUP BY name
HAVING number_of_students > 30
ORDER BY number_of_students DESC;

-- Сколько студентов оплатили первый семетр обучения (оплачено больше половины)
SELECT
	profiles_id,
    name,
    surname
    FROM `geekbrains_db`.`payments`
    JOIN `geekbrains_db`.`profiles` ON `geekbrains_db`.`profiles`.id = profiles_id
    WHERE summ_payment > remain_payment
    ORDER BY profiles_id;

-- 3 самых обсуждаемых темы на форуме
SELECT 
	`name`, 
    COUNT(*) AS "num_of_comments"
	FROM `geekbrains_db`.`forums` f
    JOIN `geekbrains_db`.`messages_forums` mf ON mf.forums_id = f.id
    group by name
    ORDER BY `num_of_comments` DESC
    LIMIT 3;

-- View со всеми логинами и паролями и ролью (студент, наставник, преподаватель)
CREATE VIEW all_users
  AS SELECT *, 'student' AS type FROM geekbrains_db.students
    UNION SELECT *, 'mentor' AS type FROM geekbrains_db.mentor
    UNION SELECT *, 'teacher' AS type FROM geekbrains_db.teachers;

-- Или так
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `geekbrains_db`.`all_users2` AS
    SELECT 
        `geekbrains_db`.`students`.`profiles_id` AS `profiles_id`,
        `geekbrains_db`.`students`.`email` AS `email`,
        `geekbrains_db`.`students`.`password` AS `password`,
        'student' AS `type`
    FROM
        `geekbrains_db`.`students` 
    UNION SELECT 
        `geekbrains_db`.`mentor`.`profiles_id` AS `profiles_id`,
        `geekbrains_db`.`mentor`.`email` AS `email`,
        `geekbrains_db`.`mentor`.`password` AS `password`,
        'mentor' AS `type`
    FROM
        `geekbrains_db`.`mentor` 
    UNION SELECT 
        `geekbrains_db`.`teachers`.`profiles_id` AS `profiles_id`,
        `geekbrains_db`.`teachers`.`email` AS `email`,
        `geekbrains_db`.`teachers`.`password` AS `password`,
        'teacher' AS `type`
    FROM
        `geekbrains_db`.`teachers`

-- View со студентами, суммой оплаты и именем оплаченных ими курсов
CREATE VIEW `payment_on_courses` AS
	SELECT 
	`name` AS "user_name", 
    `surname` AS "user_surname",s
    `summ_payment` AS "payed",
    (SELECT `name` FROM `geekbrains_db`.`courses` WHERE courses_id = `courses`.`id`) AS "name_of_course"
	FROM `geekbrains_db`.`profiles` pr
    JOIN `geekbrains_db`.`payments` pm
    ON pr.id = pm.profiles_id;

-- Функция подсчета оплаты курса в процентах
USE `geekbrains_db`;
DROP function IF EXISTS `percent_of_payment`;

DELIMITER $$
USE `geekbrains_db`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `percent_of_payment`(input_id INT) RETURNS decimal(2,2)
    DETERMINISTIC
BEGIN
	DECLARE output DECIMAL(5,2);
    DECLARE payed DECIMAL(8,2);
    DECLARE left_to_pay DECIMAL(8,2);
    
    SET payed = (
		SELECT summ_payment 
        FROM `geekbrains_db`.`payments`
        WHERE profiles_id = input_id);
    SET left_to_pay = (
		SELECT remain_payment 
        FROM `geekbrains_db`.`payments`
        WHERE profiles_id = input_id);
        
    SET output = payed / (payed + left_to_pay);
RETURN output;
END$$

DELIMITER ;

SELECT `geekbrains_db`.percent_of_payment(92);

-- Процедура добавления сертификата студенту с транзакцией добавления
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_mark`(
		n_name VARCHAR(245), 
		n_surname VARCHAR(245), 
        n_course_name VARCHAR(245),
        n_mark TINYINT(1))
BEGIN
	DECLARE _rollback BIT DEFAULT 0;
    
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
		SET _rollback = 1;
       --  GET STACKED DIAGNOSTICS CONDITION 1
		-- 	error_code = RETURNED_SQLSTATE, error_text = MESSAGE_TEXT;
		-- SET tran_result = CONCAT('[', error_code, '] ', error_text);
    END;
    
	START TRANSACTION;
		INSERT INTO `geekbrains_db`.`certificates` (
        profles_id, 
        courses_id, 
        mark)
		VALUES
		((SELECT profiles_id FROM `geekbrains_db`.`profiles`
			WHERE name = n_name AND surname = n_surname),
		(SELECT id FROM `geekbrains_db`.`courses`
			WHERE name = n_course_name),
		n_mark);

	IF _rollback = 1 THEN
		ROLLBACK;
    ELSE
		-- SET tran_result = 'ok';
		COMMIT;
	END IF;
END

CALL `geekbrains_db`.sp_insert_mark("veniam","et","sit",5);

-- Триггер на ввод неправильной оценки
CREATE TRIGGER `Before_insert_mark`
BEFORE INSERT ON `geekbrains.db`.`certificates` FOR EACH ROW BEGIN
    IF mark < 2 AND mark > 5 THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Оценка должна быть от 2 до 5';
    END IF;
END;