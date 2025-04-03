CREATE DATABASE analytics;

\c analytics
CREATE SCHEMA raw AUTHORIZATION postgres;

CREATE TABLE raw.users (
  "id" INT PRIMARY KEY,
  "Name" VARCHAR(100),
  "IsTestUser" BOOLEAN,
  "CurrencyCode" VARCHAR(3),
  "CreatedAt" TIMESTAMP
);

INSERT INTO raw.users ("id", "Name", "IsTestUser", "CurrencyCode", "CreatedAt") VALUES
  (1,'Alice', FALSE, 'GBP', '2020-01-01'),
  (2,'Bob', FALSE, 'GBP', '2020-01-02'),
  (3,'Charlie', FALSE, 'GBP', '2020-01-03'),
  (4,'David', FALSE, 'GBP', '2020-01-04'),
  (5,'Eve', FALSE, 'GBP', '2020-01-05'),
  (6,'Frank', FALSE, 'GBP', '2020-01-06'),
  (7,'Grace', FALSE, 'GBP', '2020-01-07'),
  (8,'Heidi', FALSE, 'GBP', '2020-01-08'),
  (9,'Ivan', FALSE, 'GBP', '2020-01-09'),
  (10,'Judy', FALSE, 'GBP', '2020-01-10'),
  (11,'Kevin', FALSE, 'GBP', '2020-01-11'),
  (12,'Linda', FALSE, 'GBP', '2020-01-12'),
  (13,'Michael', FALSE, 'GBP', '2020-01-13'),
  (14,'Nancy', FALSE, 'GBP', '2020-01-14'),
  (15,'Oliver', FALSE, 'GBP', '2020-01-15'),
  (16,'Pamela', FALSE, 'GBP', '2020-01-16'),
  (17,'Quincy', FALSE, 'GBP', '2020-01-17'),
  (18,'Randy', FALSE, 'GBP', '2020-01-18'),
  (19,'Samantha', TRUE, 'GBP', '2020-01-19'),
  (20,'Tina', FALSE, 'GBP', '2020-01-20'),
  (21,'Ulysses', FALSE, 'GBP', '2020-01-21'),
  (22,'Victoria', FALSE, 'GBP', '2020-01-22'),
  (23,'Walter', FALSE, 'GBP', '2020-01-23'),
  (24,'Xavier', FALSE, 'EUR', '2020-01-24'),
  (25,'Yvonne', FALSE, 'EUR', '2020-01-25'),
  (26,'Zachary', FALSE, 'EUR', '2020-01-26'),
  (27,'Alice', FALSE, 'EUR', '2020-01-27'),
  (28,'Bob', FALSE, 'EUR', '2020-01-28'),
  (29,'Charlie', FALSE, 'EUR', '2020-01-29'),
  (30,'David', FALSE, 'EUR', '2020-01-30'),
  (31,'Eve', FALSE, 'EUR', '2020-02-01'),
  (32,'Frank', FALSE, 'EUR', '2020-02-01'),
  (33,'Grace', FALSE, 'EUR', '2020-02-01'),
  (34,'Heidi', FALSE, 'EUR', '2020-02-01'),
  (35,'Ivan', FALSE, 'EUR', '2020-02-01'),
  (36,'Judy', FALSE, 'EUR', '2020-02-01'),
  (37,'Kevin', FALSE, 'EUR', '2020-02-06'),
  (38,'Linda', FALSE, 'EUR', '2020-02-07'),
  (39,'Michael', FALSE, 'EUR', '2020-02-08'),
  (40,'Nancy', FALSE, 'EUR', '2020-02-09'),
  (41,'Oliver', FALSE, 'EUR', '2020-02-10'),
  (42,'Pamela', FALSE, 'GBP', '2020-02-11'),
  (43,'Quincy', FALSE, 'GBP', '2020-02-12'),
  (44,'Randy', FALSE, 'GBP', '2020-02-15'),
  (45,'Samantha', FALSE, 'GBP', '2020-02-15'),
  (46,'Tina', FALSE, 'GBP', '2020-02-15'),
  (47,'Ulysses', FALSE, 'GBP', '2020-02-16'),
  (48,'Victoria', FALSE, 'GBP', '2020-02-17'),
  (49,'Walter', FALSE, 'GBP', '2020-02-18'),
  (50,'Xavier', FALSE, 'GBP', '2020-02-19'),
  (51,'Yvonne', FALSE, 'GBP', '2020-02-20'),
  (52,'Zachary', FALSE, 'GBP', '2020-02-21'),
  (53,'Alice', FALSE, 'GBP', '2020-02-22'),
  (54,'Bob', FALSE, 'GBP', '2020-02-23'),
  (55,'Charlie', FALSE, 'GBP', '2020-02-24'),
  (56,'David', FALSE, 'GBP', '2020-03-01'),
  (57,'Eve', FALSE, 'GBP', '2020-03-01'),
  (58,'Frank', FALSE, 'GBP', '2020-03-01'),
  (59,'Grace', FALSE, 'GBP', '2020-03-01'),
  (60,'Heidi', FALSE, 'GBP', '2020-03-01'),
  (61,'Ivan', FALSE, 'GBP', '2020-03-01'),
  (62,'Judy', FALSE, 'GBP', '2020-03-01'),
  (63,'Kevin', FALSE, 'GBP', '2020-03-08'),
  (64,'Linda', FALSE, 'GBP', '2020-03-09'),
  (65,'Michael', FALSE, 'GBP', '2020-03-10'),
  (66,'Nancy', FALSE, 'GBP', '2020-03-11'),
  (67,'Oliver', FALSE, 'GBP', '2020-03-12'),
  (68,'Pamela', FALSE, 'GBP', '2020-03-13'),
  (69,'Quincy', FALSE, 'GBP', '2020-03-15'),
  (70,'Randy', FALSE, 'GBP', '2020-03-15'),
  (71,'Samantha', FALSE, 'EUR', '2020-03-15'),
  (72,'Tina', FALSE, 'EUR', '2020-03-15'),
  (73,'Ulysses', FALSE, 'EUR', '2020-03-18'),
  (74,'Victoria', FALSE, 'EUR', '2020-03-19'),
  (75,'Walter', FALSE, 'EUR', '2020-03-20'),
  (76,'Xavier', FALSE, 'EUR', '2020-03-21'),
  (77,'Yvonne', FALSE, 'EUR', '2020-03-22'),
  (78,'Zachary', FALSE, 'EUR', '2020-03-23'),
  (79,'Alice', FALSE, 'EUR', '2020-03-24'),
  (80,'Bob', FALSE, 'GBP', '2020-03-25'),
  (81,'Charlie', FALSE, 'GBP', '2020-03-26'),
  (82,'David', FALSE, 'GBP', '2020-04-01'),
  (83,'Eve', FALSE, 'GBP', '2020-04-01'),
  (84,'Frank', FALSE, 'GBP', '2020-04-01'),
  (85,'Grace', FALSE, 'GBP', '2020-04-01'),
  (86,'Heidi', FALSE, 'GBP', '2020-04-01'),
  (87,'Ivan', FALSE, 'GBP', '2020-04-01'),
  (88,'Judy', FALSE, 'GBP', '2020-04-01'),
  (89,'Kevin', FALSE, 'GBP', '2020-04-08'),
  (90,'Linda', FALSE, 'GBP', '2020-04-09'),
  (91,'Michael', FALSE, 'GBP', '2020-04-10'),
  (92,'Nancy', FALSE, 'GBP', '2020-04-11'),
  (93,'Oliver', FALSE, 'GBP', '2020-04-12'),
  (94,'Pamela', FALSE, 'GBP', '2020-04-13'),
  (95,'Quincy', FALSE, 'EUR', '2020-04-15'),
  (96,'Randy', FALSE, 'EUR', '2020-04-15'),
  (97,'Samantha', FALSE, 'EUR', '2020-04-03'),
  (98,'Tina', FALSE, 'EUR', '2020-04-15'),
  (99,'Ulysses', FALSE, 'EUR', '2020-04-18'),
  (100,'Victoria', FALSE, 'EUR', '2020-04-19')
;

CREATE TABLE raw.user_address (
  user_id INT PRIMARY KEY,
  "address" VARCHAR(100),
  country_code VARCHAR(3)
);

INSERT INTO raw.user_address (user_id, "address", country_code) VALUES
  (1,'123 Main St', 'GB'),
  (2,'456 Elm St', 'GB'),
  (3,'789 Oak St', 'GB'),
  (4,'101 Pine St', 'GB'),
  (5,'202 Maple St', 'GB'),
  (6,'303 Cedar St', 'GB'),
  (7,'404 Walnut St', 'GB'),
  (8,'505 Spruce St', 'GB'),
  (9,'606 Birch St', 'GB'),
  (10,'707 Ash St', 'GB'),
  (11,'808 Elm St', 'GB'),
  (12,'909 Oak St', 'GB'),
  (13,'1010 Pine St', 'GB'),
  (14,'1111 Maple St', 'GB'),
  (15,'1212 Cedar St', 'GB'),
  (16,'1313 Walnut St', 'GB'),
  (17,'1414 Spruce St', 'GB'),
  (19,'1616 Ash St', 'GB'),
  (20,'1717 Elm St', 'GB'),
  (21,'1818 Oak St', 'GB'),
  (22,'1919 Pine St', 'GB'),
  (23,'2020 Maple St', 'GB'),
  (24,'2121 Cedar St', 'IR'),
  (25,'2222 Walnut St', 'IE'),
  (26,'2323 Spruce St', 'IE'),
  (27,'2424 Birch St', 'IE'),
  (28,'2525 Ash St', 'IE'),
  (29,'2626 Elm St', 'IE'),
  (30,'2727 Oak St', 'IE'),
  (31,'123 Green St', 'IE'),
(32,'456 Clover St', 'IE'),
(33,'789 Shamrock St', 'IE'),
(34,'1234 Leprechaun St', 'IE'),
(35,'5678 Gaelic St', 'IE'),
(36,'91011 Celtic St', 'IE'),
(37,'1213 Dublin St', 'IE'),
(38,'1415 Cork St', 'IE'),
(39,'1617 Galway St', 'IE'),
(40,'1819 Limerick St', 'IE'),
(41,'2021 Waterford St', 'IE'),
(42,'2223 Kilkenny St', 'GB'),
(43,'2425 Belfast St', 'GB'),
(44,'2627 Londonderry St', 'GB'),
(45,'2829 Armagh St', 'GB'),
(46,'3031 Lisburn St', 'GB'),
(47,'3233 Newry St', 'GB'),
(48,'3435 Derry St', 'GB'),
(49,'3637 Antrim St', 'GB'),
(50,'3839 Down St', 'GB'),
(51,'4041 Tyrone St', 'GB'),
(52,'4243 Fermanagh St', 'GB'),
(53,'4445 Dungannon St', 'GB'),
(54,'4647 Bangor St', 'GB'),
(55,'4849 Omagh St', 'GB'),
(56,'5051 Enniskillen St', 'GB'),
(57,'5253 Ballymena St', 'GB'),
(58,'5455 Coleraine St', 'GB'),
(59,'5657 Carrickfergus St', 'GB'),
(60,'5859 Ballymoney St', 'GB'),
(61,'6061 Magherafelt St', 'GB'),
(62,'6263 Strabane St', 'GB'),
(63,'6465 Newtownabbey St', 'GB'),
(64,'6667 Banbridge St', 'GB'),
(65,'6869 Cookstown St', 'GB'),
(66,'7071 Larne St', 'GB'),
(67,'7273 Limavady St', 'GB'),
(68,'7475 Portrush St', 'GB'),
(69,'7677 Newcastle St', 'GB'),
(70,'7879 Warrenpoint St', 'GB'),
(71,'8081 Portstewart St', 'IE'),
(72,'8283 Killarney St', 'IE'),
(73,'8485 Tralee St', 'IE'),
(74,'8687 Carlow St', 'IE'),
(75,'8889 Naas St', 'IE'),
(76,'9091 Athlone St', 'IE'),
(77,'9293 Mullingar St', 'IE'),
(78,'9495 Wexford St', 'IE'),
(79,'9697 Dundalk St', 'IE'),
(80,'9899 Sligo St', 'GB'),
(81,'100101 Letterkenny St', 'GB'),
(82,'102103 Drogheda St', 'GB'),
(83,'104105 Bray St', 'GB'),
(84,'106107 Navan St', 'GB'),
(85,'108109 Kildare St', 'GB'),
(86,'110111 Balbriggan St', 'GB'),
(87,'112113 Ashbourne St', 'GB'),
(88,'114115 Swords St', 'GB'),
(89,'116117 Greystones St', 'GB'),
(90,'118119 Clonmel St', 'GB'),
(91,'120121 Maynooth St', 'GB'),
(92,'122123 Tallaght St', 'GB'),
(93,'124125 Clondalkin St', 'GB'),
(94,'126127 Leixlip St', 'GB'),
(95,'128129 Malahide St', 'IE'),
(96,'130131 Rathmines St', 'IE'),
(97,'132133 Skerries St', 'IE'),
(98,'134135 Loughrea St', 'IE'),
(99,'136137 Roscommon St', 'IE'),
(100,'138139 Youghal St', 'IE')
;

CREATE TABLE raw.bet_outcome (
  id INT PRIMARY KEY,
  outcome VARCHAR(50)
);

INSERT INTO raw.bet_outcome (id, outcome) VALUES
  (1,'winner'),
  (2,'loser'),
  (3,'draw')
;

CREATE TABLE raw.game (
  id INT PRIMARY KEY,
  "name" VARCHAR(100),
  vertical VARCHAR(50),
  created_at TIMESTAMP
);

INSERT INTO raw.game (id, "name", vertical, created_at) VALUES
  (1, 'Rugby League', 'sports', '2020-01-01'),
  (2, 'Tennis', 'sports', '2020-01-02'),
  (3, 'Football', 'sports', '2020-01-03'),
  (4, 'Call-of-duty', 'esports', '2020-01-04'),
  (5, 'Rugby league', 'sports', '2020-01-05'),
  (6, 'Blackjack', 'casino', '2020-01-06'),
  (7, 'Poker', 'casino', '2020-01-07'),
  (8, 'Slots', 'casino', '2020-01-08'),
  (9, 'Bingo', 'casino', '2020-01-09')
;


CREATE TABLE raw.bet (
  id INT PRIMARY KEY,
  user_id INT,
  bet_outcome_id INT,
  game_id INT,
  wager DECIMAL(10,4),
  is_cash_wager BOOLEAN,
  winnings DECIMAL(10,4),
  created_at TIMESTAMP,
  settled_at TIMESTAMP
);


CREATE TABLE raw.fx_rates (
  date DATE,
  currency_code VARCHAR(3),
  rate DECIMAL(10,4)
);

INSERT INTO raw.fx_rates (date, currency_code, rate)
SELECT
    g.date::date,
    v.currency_code,
    CASE
        WHEN v.currency_code = 'GBP' THEN '1.26'
        ELSE 1.08
    END AS rate
FROM
    GENERATE_SERIES('2020-01-01'::date, '2020-05-31'::date, '1 day') AS g(date)
CROSS JOIN
    (VALUES ('GBP'), ('EUR')) AS v(currency_code)
ORDER BY
    g.date, v.currency_code
;