USE master;
drop database if EXISTS tourism;

--CREATE DATABASE tourism;
--COLLATE Cyrillic_General_CI_AS
--USE tourism;

drop table if EXISTS client;
drop table if EXISTS voucher;
drop table if EXISTS passport;
drop table if EXISTS tourist_route;
drop table if EXISTS hotel;

--CREATE TABLE client (
--id_client int NOT NULL,
--full_name varchar(50) NOT NULL,
--birth_date date NOT NULL,
--phone_number varchar(12),
--id_voucher int NOT NULL,
--PRIMARY KEY(id_client)
--)
--GO

--insert into client values (1, 'fdsfs', '2000-12-03', '837564312345', 1);
--insert into client values (2, 'Dnujhehbn', '1994-01-03', '875773856374', 2);
--insert into client values (3, 'FatheR', '1969-01-15', '875345623675', 3);
--insert into client values (4, 'Mother', '1975-07-23', '882542355424', 4);

--CREATE TABLE voucher (
--id_voucher int NOT NULL,
--voucher_cost money NOT NULL,
--num_of_vouchers int NOT NULL,
--PRIMARY KEY(id_voucher)
--)
--GO

--CREATE TABLE passport (
--series varchar(4) NOT NULL,
--number varchar(6) NOT NULL,
--issue_date datetime NOT NULL,
--full_name varchar(50) NOT NULL,
--birth_date date NOT NULL,
--region varchar(50) NOT NULL,
--PRIMARY KEY(series, number)
--)
--GO

--INSERT INTO passport VALUES('1488', '123456', '2014-05-13T15:32:06.427', 'SashaSlypik', '2000-04-12', 'abcdsvfshbs');
--INSERT INTO passport VALUES('1488', '658439', '2012-12-15T17:21:05.423', 'IvanPetrov', '1998-07-16', 'gurhuhfgu');
--INSERT INTO passport VALUES('1489', '654321', '2015-06-13T15:45:36.527', 'MishaIvanov', '2001-03-06', 'ggdfgfgfgfd');

--CREATE TABLE tourist_route (
--id_route int NOT NULL,
--route_name varchar(50) NOT NULL,
--route_list varchar(50) NOT NULL,
--PRIMARY KEY(id_route)
--)
--GO

--CREATE TABLE hotel (
--id_route int NOT NULL,
--id_hotel int NOT NULL,
--hotel_name varchar(50) NOT NULL,
--hotel_type tinyint NOT NULL,
--PRIMARY KEY(id_hotel)
--)
--GO

---- INSERT
------ ��� �������� ������ �����
--INSERT INTO hotel VALUES (1, 1, 'Paris', 4);
------ � ��������� ������ �����
--INSERT INTO hotel (id_route, id_hotel, hotel_name, hotel_type) VALUES (2, 2, 'Otdihalka', 2);
----  � ������� �������� �� ������ �������
--INSERT INTO client (full_name, birth_date) SELECT full_name, birth_date FROM passport;

---- DELETE
------ ���� �������
--DELETE hotel;
----- -�� �������
--DELETE FROM passport WHERE series = 1489;
------ �������� �������
--TRUNCATE TABLE passport;

---- UPDATE
------ ���� �������
--UPDATE client SET full_name = 'MISHA';
------ �� ������� �������� ���� �������
--UPDATE client SET full_name = 'SAHSA' WHERE id_client = 2;
------ �� ������� �������� ��������� ���������
--UPDATE client SET full_name = 'DIMA', phone_number = '111111111111' WHERE id_client = 3;

----SELECT
------ � ������������ ������� ����������� ���������
--SELECT full_name, birth_date, phone_number FROM client;
------ �� ����� ����������
--SELECT * FROM client;
------ � �������� �� ��������
--SELECT * FROM client WHERE id_client > 2;

---- SELECT ORDER BY + TOP (LIMIT)
------ � ����������� �� ����������� ASC + ����������� ������ ���������� �������
--SELECT TOP 2 * FROM client ORDER BY full_name ASC;
------ � ����������� �� �������� DESC
--SELECT * FROM client ORDER BY full_name DESC;
------ � ����������� �� ���� ��������� + ����������� ������ ���������� �������
--SELECT TOP 2 * FROM client ORDER BY full_name, birth_date DESC;
------ � ����������� �� ������� ��������, �� ������ �����������
--SELECT * FROM client ORDER BY full_name;

---- ������ � ������. ����������, ����� ���� �� ������ ��������� ������� � ����� DATETIME.
------WHERE �� ����
--SELECT * FROM passport WHERE issue_date = '2012-12-15T17:21:05.423';
------������� �� ������� �� ��� ����, � ������ ���. ��������, ��� �������� ������.
--SELECT YEAR(issue_date) AS issue_year FROM passport;

