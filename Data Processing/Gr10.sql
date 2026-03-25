select * from `workspace`.`marks`.`grade_10` limit 300;

---Query 1: Top 10 in Mathematics
SELECT Name, Mathematics
FROM `workspace`.`marks`.`grade_10`
ORDER BY Mathematics DESC
LIMIT 10;

--- Query 2: Top 10 in English
SELECT Name, English
FROM `workspace`.`marks`.`grade_10`
ORDER BY English DESC
LIMIT 10;

--- Query 3 Top 10 in Accounting
SELECT Name, Accounting
FROM `workspace`.`marks`.`grade_10`
ORDER BY Accounting DESC
LIMIT 10;

--- Query 4: Total Average
SELECT Name, Average
FROM `workspace`.`marks`.`grade_10`
ORDER BY Average DESC
LIMIT 15;

--- Query 5: English above 80%
SELECT Name, English
FROM `workspace`.`marks`.`grade_10`
WHERE English >=98;

--- Query 6: Case Statement on Average
SELECT Name, Average,
CASE WHEN Average BETWEEN 80 AND 90 THEN 'Outstanding'
WHEN Average BETWEEN 70 AND 79.9 THEN 'Good'
WHEN Average BETWEEN 60 AND 69.9 THEN 'Satisfactory'
WHEN Average BETWEEN 50 AND 59.9 THEN 'Fair'
ELSE 'FAIL'
END AS Performance
FROM `workspace`.`marks`.`grade_10`;

---Query 7; Class Average
SELECT AVG(Average) AS Class_Average
FROM `workspace`.`marks`.`grade_10`;

--- Query 8 Top 10 in CAT
SELECT Name, CAT
FROM `workspace`.`marks`.`grade_10`
ORDER BY CAT DESC
LIMIT 10;
