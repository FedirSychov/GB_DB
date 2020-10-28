-- Задание 1
-- Для создания записей о каждом добавлении, создадим триггеры на каждую таблицу
CREATE TRIGGER `Before_insert_catalogs`
BEFORE INSERT ON `new`.`catalogs` FOR EACH ROW BEGIN
    INSERT INTO `new`.`logs` (created_at, table_name, table_id, name)
	VALUES (
    CURRENT_TIMESTAMP, 
    "catalogs", 
    (SELECT last_insert_id() FROM `new`.`catalogs`), 
    (SELECT name FROM `new`.`catalogs` WHERE id = last_insert_id()));
END;

CREATE TRIGGER `Before_insert_products`
BEFORE INSERT ON `new`.`products` FOR EACH ROW BEGIN
    INSERT INTO `new`.`logs` (created_at, table_name, table_id, name)
	VALUES (
    CURRENT_TIMESTAMP, 
    "products", 
    (SELECT last_insert_id() FROM `new`.`products`), 
    (SELECT name FROM `new`.`products` WHERE id = last_insert_id()));
END;

CREATE TRIGGER `Before_insert_users`
BEFORE INSERT ON `new`.`users` FOR EACH ROW BEGIN
    INSERT INTO `new`.`logs` (created_at, table_name, table_id, name)
	VALUES (
    CURRENT_TIMESTAMP, 
    "users", 
    (SELECT last_insert_id() FROM `new`.`users`), 
    (SELECT name FROM `new`.`users` WHERE id = last_insert_id()));
END;


-- Добавить миллион строк
CREATE DEFINER=`root`@`localhost` PROCEDURE `dowhile`()
BEGIN
  DECLARE v INT DEFAULT 0;
  WHILE v < 100000 DO
    INSERT `values` VALUES (v+1),(v+2),(v+3),(v+4),(v+5),(v+6),(v+7),(v+8),(v+9),(v+10);
    SET v = v + 1;
  END WHILE;
END

-- Redis запросы
-- Задание 2
-- Найти имя по электронному адресу и наоборот
HGET email:myemail@mail.ru username
HGET username:ivan email