--USE master;
--drop database if EXISTS tourism;

--CREATE DATABASE tourism;
--COLLATE Cyrillic_General_CI_AS;
USE tourism;

drop table if EXISTS client;
drop table if EXISTS voucher;
drop table if EXISTS passport;
drop table if EXISTS tourist_route;
drop table if EXISTS hotel;

CREATE TABLE client (
id_client int NOT NULL,
full_name varchar(50) NOT NULL,
birth_date date NOT NULL,
phone_number varchar(12),
PRIMARY KEY(id_client)
)
GO

insert into client values (1, 'SashaSlypik', '2000-12-03', '837564312345');
insert into client values (2, 'IvanPetrov', '1994-01-03', '875773856374');
insert into client values (3, 'MishaIvanov', '1969-01-15', '875345623675');
insert into client values (4, 'Mother', '1975-07-23', '882542355424');

CREATE TABLE voucher (
id_voucher int NOT NULL,
voucher_cost money NOT NULL,
voucher_class smallint NOT NULL,
voucher_name varchar(50) NOT NULL,
client_id int NOT NULL,
PRIMARY KEY(id_voucher)
)
GO

insert into voucher values(1, 60000, 1, 'turkish', 1);
insert into voucher values(2, 55000, 1, 'turkish', 1);
insert into voucher values(3, 45000, 2, 'anapa', 2);
insert into voucher values(4, 30000, 3, 'anapa', 3);
insert into voucher values(5, 20000, 3, 'anapa', 4);

CREATE TABLE passport (
passport_id int NOT NULL,
series varchar(4) NOT NULL,
number varchar(6) NOT NULL,
issue_date datetime NOT NULL,
full_name varchar(50) NOT NULL,
birth_date date NOT NULL,
region varchar(50) NOT NULL,
PRIMARY KEY(passport_id)
)
GO

INSERT INTO passport VALUES(1, '1488', '123456', '2014-05-13T15:32:06.427', 'SashaSlypik', '2000-04-12', 'abcdsvfshbs');
INSERT INTO passport VALUES(2, '1488', '658439', '2012-12-15T17:21:05.423', 'IvanPetrov', '1998-07-16', 'gurhuhfgu');
INSERT INTO passport VALUES(3, '1489', '654321', '2015-06-13T15:45:36.527', 'MishaIvanov', '2001-03-06', 'ggdfgfgfgfd');
INSERT INTO passport VALUES(4, '1337', '789321', '2016-03-16T14:47:26.427', 'PavelApostol', '2002-03-06', 'dfbgbreybdh');

CREATE TABLE tourist_route (
id_route int NOT NULL,
route_name varchar(50) NOT NULL,
route_list varchar(50) NOT NULL,
PRIMARY KEY(id_route)
)
GO

CREATE TABLE hotel (
id_route int NOT NULL,
id_hotel int NOT NULL,
hotel_name varchar(50) NOT NULL,
hotel_type tinyint NOT NULL,
PRIMARY KEY(id_hotel)
)
GO

-- INSERT
---- Без указания списка полей
INSERT INTO hotel VALUES (1, 1, 'Paris', 4);
---- С указанием списка полей
INSERT INTO hotel (id_route, id_hotel, hotel_name, hotel_type) VALUES (2, 2, 'Otdihalka', 2);
--  С чтением значения из другой таблицы
--INSERT INTO client (full_name, birth_date) SELECT full_name, birth_date FROM passport;

-- DELETE
---- ВСЕХ ЗАПИСЕЙ
DELETE hotel;
--- -ПО УСЛОВИЮ
DELETE FROM passport WHERE series = 1489;
---- ОЧИСТИТЬ ТАБЛИЦУ
TRUNCATE TABLE passport;

-- UPDATE
---- ВСЕХ ЗАПИСЕЙ
UPDATE client SET full_name = 'MISHA';
---- ПО УСЛОВИЮ ОБНОВЛЯЯ ОДИН АТРИБУТ
UPDATE client SET full_name = 'SAHSA' WHERE id_client = 2;
---- ПО УСЛОВИЮ ОБНОВЛЯЯ НЕСКОЛЬКО АТРИБУТОВ
UPDATE client SET full_name = 'DIMA', phone_number = '111111111111' WHERE id_client = 3;

--SELECT
---- С ОПРЕДЕЛЕННЫМ НАБОРОМ ИЗВЛЕКАЕМЫХ АТРИБУТОВ
SELECT full_name, birth_date, phone_number FROM client;
---- СО ВСЕМИ АТРИБУТАМИ
SELECT * FROM client;
---- С УСЛОВИЕМ ПО АТРИБУТУ
SELECT * FROM client WHERE id_client > 2;

-- SELECT ORDER BY + TOP (LIMIT)
---- С сортировкой по возрастанию ASC + ограничение вывода количества записей
SELECT TOP 2 * FROM client ORDER BY full_name ASC;
---- С сортировкой по убыванию DESC
SELECT * FROM client ORDER BY full_name DESC;
---- С сортировкой по двум атрибутам + ограничение вывода количества записей
SELECT TOP 2 * FROM client ORDER BY full_name, birth_date DESC;
---- С сортировкой по первому атрибуту, из списка извлекаемых
SELECT * FROM client ORDER BY full_name;

INSERT INTO passport VALUES(1, '1488', '123456', '2014-05-13T15:32:06.427', 'SAHSA', '2000-04-12', 'abcdsvfshbs');
INSERT INTO passport VALUES(2, '1488', '658439', '2012-12-15T17:21:05.423', 'MISHA', '1998-07-16', 'gurhuhfgu');
INSERT INTO passport VALUES(3, '1489', '654321', '2015-06-13T15:45:36.527', 'MishaIvanov', '2001-03-06', 'ggdfgfgfgfd');
INSERT INTO passport VALUES(4, '1337', '789321', '2016-03-16T14:47:26.427', 'PavelApostol', '2002-03-06', 'dfbgbreybdh');

-- Работа с датами. Необходимо, чтобы одна из таблиц содержала атрибут с типом DATETIME.
----WHERE ПО ДАТЕ
SELECT * FROM passport WHERE issue_date = '2012-12-15T17:21:05.423';
----Извлечь из таблицы не всю дату, а только год. Например, год рождения автора.
SELECT YEAR(issue_date) AS issue_year FROM passport;

--SELECT GROUP BY с функциями агрегации
----min
SELECT voucher_name, MIN(voucher_cost) AS min_price FROM voucher GROUP BY voucher_name;
----max
SELECT voucher_name, MAX(voucher_cost) AS max_price FROM voucher GROUP BY voucher_name;
----avg
SELECT voucher_name, AVG(voucher_cost) AS avg_price FROM voucher GROUP BY voucher_name;
----sum
SELECT voucher_name, SUM(voucher_cost) AS sum_price FROM voucher GROUP BY voucher_name;
----COUNT
SELECT voucher_name, COUNT(voucher_cost) AS sum_num_of_vouchers FROM voucher GROUP BY voucher_name;

--SELECT GROUP BY + HAVING
SELECT voucher_name, MIN(voucher_cost) AS min_price FROM voucher GROUP BY 
voucher_name HAVING MIN(voucher_cost) > 25000;

SELECT voucher_name, MAX(voucher_cost) AS max_price FROM voucher GROUP BY 
voucher_name HAVING MAX(voucher_cost) < 60000;

SELECT voucher_name, SUM(voucher_cost) AS sum_price FROM voucher GROUP BY
voucher_name HAVING SUM(voucher_cost) < 100000;

--SELECT JOIN
----LEFT JOIN двух таблиц и WHERE по одному из атрибутов
SELECT * FROM client LEFT JOIN passport ON client.full_name=passport.full_name WHERE id_client < 3;
----RIGHT JOIN. Получить такую же выборку, как и в 9.1
SELECT * FROM client RIGHT JOIN passport ON client.full_name=passport.full_name WHERE id_client < 3;
----LEFT JOIN трех таблиц + WHERE по атрибуту из каждой таблицы
SELECT client.full_name, client.birth_date, client.phone_number, passport.full_name, passport.birth_date, passport.number, passport.series, voucher.voucher_cost FROM client
LEFT JOIN passport ON client.full_name = passport.full_name LEFT JOIN voucher ON client.id_client=voucher.client_id
WHERE client.id_client > 1 AND passport.passport_id < 2 AND voucher.voucher_cost > 20000;

--Подзапросы
----Написать запрос с WHERE IN (подзапрос)
SELECT * FROM client WHERE client.id_client IN ( SELECT id_client FROM client WHERE full_name != 'MISHA');
----Написать запрос SELECT atr1, atr2, (подзапрос) FROM ...
SELECT full_name, birth_date, (SELECT full_name FROM passport WHERE passport_id = client.id_client) AS passport_name FROM client;