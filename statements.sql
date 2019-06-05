/*
   Statements used in 'Learning SQL Programming'
*/

-- 00_03
SELECT * FROM people;
SELECT first_name FROM people;

-- 01_01
SELECT 'Hello, World!';
SELECT first_name FROM people;
SELECT last_name FROM people;
SELECT first_name, last_name FROM people;
SELECT last_name, first_name FROM people;
SELECT * FROM people;
SELECT first_name, state, company FROM people;
SELECT company, first_name, quiz_points FROM people;

-- 01_02
SELECT * FROM people WHERE state='CA';
SELECT * FROM people WHERE state='FL';
SELECT * FROM people WHERE state='WA';
SELECT * FROM people WHERE state='NY';
SELECT * FROM people WHERE shirt_or_hat='NY';
SELECT * FROM people WHERE shirt_or_hat='hat';
SELECT first_name, last_name FROM people WHERE shirt_or_hat='shirt';
SELECT first_name, last_name, shirt_or_hat FROM people WHERE shirt_or_hat='shirt';
SELECT first_name, last_name, shirt_or_hat WHERE shirt_or_hat='shirt' FROM people; -- Note: This is an invalid statement.

-- 01_03
SELECT first_name, last_name FROM people WHERE state='CA' AND shirt_or_hat='shirt';
SELECT first_name, last_name, team FROM people WHERE state='CA' AND shirt_or_hat='shirt' AND team='blue';
SELECT first_name, last_name, team FROM people WHERE state='CA' AND shirt_or_hat='shirt' AND team IS 'blue';
SELECT first_name, last_name, team FROM people WHERE state='CA' AND shirt_or_hat='shirt' AND team IS NOT 'blue';
SELECT first_name, last_name, team FROM people WHERE state='CA' AND shirt_or_hat='shirt' AND team != 'blue';
SELECT first_name, last_name, team, shirt_or_hat, state FROM people WHERE state='CA' OR state='CO' AND shirt_or_hat='shirt';
SELECT first_name, last_name, team, shirt_or_hat, state FROM people WHERE (state='CA' OR state='CO') AND shirt_or_hat='shirt';

-- 01_04
SELECT first_name, last_name, state FROM people WHERE state LIKE 'C%';
SELECT first_name, last_name, state FROM people WHERE state LIKE 'N%';
SELECT first_name, last_name, state FROM people WHERE state LIKE '%N';
SELECT first_name, last_name, state FROM people WHERE first_name LIKE 'A%';
SELECT first_name, last_name, state FROM people WHERE first_name LIKE 'J%';
SELECT first_name, last_name, state FROM people WHERE first_name LIKE '%J%';
SELECT first_name, last_name, state FROM people WHERE first_name LIKE '%on%';
SELECT first_name, last_name, state FROM people WHERE first_name LIKE '%ch%';
SELECT first_name, last_name, state FROM people WHERE company LIKE '%LLC';
SELECT first_name, last_name, state, company FROM people WHERE company LIKE '%LLC';
SELECT first_name, last_name, state, company FROM people WHERE company LIKE '%LLC' LIMIT 5;
SELECT first_name, last_name, state, company FROM people WHERE company LIKE '%LLC' LIMIT 10;
SELECT first_name, last_name, state, company FROM people WHERE company LIKE '%LLC' LIMIT 10 OFFSET 5;

-- 01_05
SELECT first_name, last_name FROM people;
SELECT first_name, last_name FROM people ORDER BY first_name;
SELECT first_name, last_name FROM people ORDER BY first_name ASC;
SELECT first_name, last_name FROM people ORDER BY first_name DESC;
SELECT state, last_name, first_name FROM people ORDER BY state ASC, last_name ASC;
SELECT state, last_name, first_name FROM people ORDER BY state ASC, last_name DESC;

-- 01_06
SELECT first_name FROM people;
SELECT first_name, LENGTH(first_name) FROM people;
SELECT DISTINCT(first_name) FROM people;
SELECT DISTINCT(first_name) FROM people ORDER BY first_name;
SELECT DISTINCT(shirt_or_hat) FROM people;
SELECT COUNT(*) FROM people WHERE state='CA';

-- 02_01
SELECT first_name, state FROM people;
SELECT first_name, state FROM people JOIN states;
SELECT people.first_name, people.state, states.division FROM people JOIN states ON people.state=states.state_abbrev;
SELECT * FROM people JOIN states ON people.state=states.state_abbrev;
SELECT * FROM people JOIN states ON people.state=states.state_abbrev WHERE people.first_name LIKE 'j%' AND states.region='South';

-- 02_02
SELECT people.first_name, people.last_name, people.state, states.state_name FROM people JOIN states ON people.state=states.state_abbrev;
SELECT people.first_name, people.last_name, people.state, states.state_name FROM states JOIN people ON people.state=states.state_abbrev;
SELECT people.first_name, people.last_name, people.state, states.state_name FROM states LEFT JOIN people ON people.state=states.state_abbrev;
SELECT DISTINCT(people.state), states.state_abbrev FROM states LEFT JOIN people ON people.state=states.state_abbrev ORDER BY people.state;

-- 02_03
SELECT first_name, COUNT(first_name) FROM people;
SELECT first_name, COUNT(first_name) FROM people GROUP BY first_name;
SELECT first_name, COUNT(first_name) FROM people GROUP BY last_name;
SELECT last_name, COUNT(first_name) FROM people GROUP BY last_name;
SELECT state, COUNT(state) FROM people GROUP BY state;
SELECT state, quiz_points, COUNT(quiz_points) FROM people GROUP BY quiz_points;
SELECT state, quiz_points, COUNT(quiz_points) FROM people GROUP BY state, quiz_points;

-- 03_02
SELECT 4+2;
SELECT 1/3;
SELECT 1/3.0;
SELECT 3>2;
SELECT 2>3;
SELECT 5!=3;
SELECT first_name, quiz_points FROM people WHERE quiz_points > 70;
SELECT first_name, quiz_points FROM people WHERE quiz_points >= 70;
SELECT MAX(quiz_points), MIN(quiz_points) FROM people;
SELECT SUM(quiz_points) FROM people;
SELECT team, COUNT(*) FROM people GROUP BY team;
SELECT team, COUNT(*) FROM people;
SELECT team, COUNT(*), SUM(quiz_points), (SUM(quiz_points)/COUNT(*)) AS average FROM people GROUP BY team;

-- 03_03

-- 03_04
SELECT first_name, last_name FROM people;
SELECT LOWER(first_name), UPPER(last_name) FROM people;
SELECT LOWER(first_name), SUBSTR(last_name, 1, 5) FROM people;
SELECT LOWER(first_name), SUBSTR(last_name, 2, 4) FROM people;
SELECT LOWER(first_name), SUBSTR(last_name, 2) FROM people;
SELECT LOWER(first_name), SUBSTR(last_name, -2) FROM people;
SELECT LOWER(first_name), SUBSTR(last_name, -4) FROM people;
SELECT LOWER(first_name), REPLACE(last_name, 'a', '_') FROM people;
SELECT quiz_points FROM people ORDER BY quiz_points;
SELECT quiz_points FROM people ORDER BY CAST(quiz_points AS char);
SELECT MAX(CAST(quiz_points AS CHAR)) FROM people;
SELECT MAX(CAST(quiz_points AS INT)) FROM people;

-- 03_05
SELECT first_name, last_name FROM people;
SELECT first_name, UPPER(last_name) FROM people;
SELECT first_name, UPPER(last_name) AS surname FROM people;

-- 04_01
INSERT INTO people (first_name) VALUES ('Bob');
SELECT * FROM people;
INSERT INTO people (first_name, last_name, state, city, shirt_or_hat) VALUES ('Mary', 'Hamilton', 'OR', 'Portland', 'hat');
SELECT * FROM people;
INSERT INTO people (first_name, last_name) VALUES ('George', 'White'), ('Jenn', 'Smith'), ('Carol', 'Anderson');
SELECT * FROM people;

-- 04_02
SELECT * FROM people;
UPDATE people SET first_name='Martha' WHERE first_name='George' AND last_name='White';
SELECT * FROM people;
SELECT * FROM people WHERE company='Fisher LLC';
UPDATE people SET company='Megacorp Inc' WHERE company='Fisher LLC';
SELECT * FROM people WHERE company='Fisher LLC';
SELECT * FROM people WHERE company='Megacorp Inc';

-- 04_03
SELECT * FROM people;
DELETE FROM people WHERE first_name='Martha' AND last_name='White';
SELECT * FROM people;
DELETE FROM people WHERE id_number IS NULL;
SELECT * FROM people;
