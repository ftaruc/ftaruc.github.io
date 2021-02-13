---
layout: post
title:  "Relearning SQL"
date:   2021-02-12 15:10:56 +0900
categories: notes
---

There's no argument that SQL is a must-learn language if you want to work with data. Like with any language, you need to keep notes to refresh yourself for future projects.

<!-- more -->

-- 

**A POTPOURRI OF SQL**

- can use `WHERE NOT COL = VAL` for !=
- Check if column is empty `WHERE COL IS (NOT) NULL`

--

1.  Insert (into, values) -- COLUMN FIRST THEN VALUES:

   ```sql
   INSERT INTO Customers (
   CustomerName, 
   Address, 
   City, 
   PostalCode,
   Country)
   VALUES(
   'Hekkan Burger',
   'Gateveien 15',
   'Sandnes',
   '4306',
   'Norway');
   ```

2. Update (include `SET` to change value)

   ```sqlite
    UPDATE Customers
    SET City = 'Oslo', 
    COUNTRY = 'Norway'
    WHERE CustomerID = 32;
   ```

3. Delete (Deletes all records from X -- can be filtered)

   ```sql
    DELETE FROM Customers
    WHERE Country = 'Norway';
   ```

4. Like (can also use =  instead of LIKE I believe but no regex)

   - `%` = includes anything after like `.*` for regex
   - example: so `%a` = ends with a; while`%a%` contains letter a
   - can also do NOT LIKE 

   ```SQL
   SELECT * FROM Customers
   WHERE City LIKE 'a%'
   ```

5. Other wildcards with `LIKE` similar to regex:

- `LIKE '_a%' ` where second letter is an "a"
- `LIKE '[acs]%'`  where the first letter is an "a" or a "c" or an "s".
- `[a-f]` anything betwen a and f
- `[^b-x]`anything not between b and x



6. boolean conditions:
   - `WHERE COUNTY IN ('NORWAY', ' FRANCE')` using `IN`
   - `WHERE PRICE NOT BETWEEN 10 and 20` using `BETWEEN`
     - can use letters as alphabetically be between

7. `CREATE VIEW`, virtual table that is stored as a variable in a database

8. Distinctively, a **view** is saved in the database **and** can be reused by any query, whereas a `WITH` clause (or Common Table Expression) is tied to one specific query.
   - In tandem, they can be used together in the following query:

```sqlite
CREATE VIEW q4iv(playerid, namefirst, namelast, salary, yearid)
AS
  WITH st(m00) AS (
    SELECT MAX(salary)
    FROM salaries
    WHERE yearid = 2000
    GROUP BY yearid),
  sh AS (
    SELECT MAX(salary) as m01
    FROM salaries
    WHERE yearid = 2001
    GROUP BY yearid)

  SELECT s.playerid, p.namefirst, p.namelast, s.salary, s.yearid
  FROM people p, salaries s, st a, sh b
  WHERE s.playerid = p.playerid AND (
  (yearid = 2000 and salary = a.m00)
  OR (yearid = 2001 and salary = b.m01))

```

- when using `WITH` or `VIEW` you can order and name the variables of the table that is selected from `SELECT` inside a parantheses, so you do not have to use `AS` inside the `SELECT` statement.

  - example: 

  ```sqlite
  WITH st(m00) AS (
      SELECT MAX(salary)
      
  #VS: 
  
  WITH sh AS (
      SELECT MAX(salary) as m00
  ```

* `HAVING` or `WHERE` can have boolean conditions that include subqueries:

  ```sql
    HAVING s.yearid > (SELECT yearid
                    FROM salaries
                    ORDER BY yearid asc
                    LIMIT 1)
    #FILTERS GROUPS WITH YEARID > THE SMALLEST, 
    #AKA INCLUDE EVERYTHING BUT THE SMALLEST
  ```

  - OR:

    ```sql
    #EXAMPLE OF CASTING TO A FLOAT
    HAVING SUM(b.AB) > 50 and lslg >  (
    
        SELECT (CAST(SUM(b.H) - SUM(b.H2B) - SUM(b.H3B) - SUM(b.HR) + 2*SUM(b.H2B)
         + 3*SUM(b.H3B) + 4*SUM(b.HR) AS float)/CAST(SUM(b.AB) AS float)) AS lslg
         FROM batting b
         JOIN people p ON b.playerid = p.playerid
         WHERE b.playerid = 'mayswi01'
         GROUP BY b.playerid
      )
    ```

    

---

**For more resources (that are take more digestion to learn):**

1. Recursive CTE or `WITH` statements: [here](https://www.sqlservertutorial.net/sql-server-basics/sql-server-recursive-cte/)
2. Create grouping sets through `CUBE`: [here](https://www.sqlservertutorial.net/sql-server-basics/sql-server-cube/)
3. `COALESCE`: [here](https://www.sqlservertutorial.net/sql-server-basics/sql-server-coalesce/)
4. Create grouping sets with assumed hiearchy through `ROLLUP`: [here](https://www.sqlservertutorial.net/sql-server-basics/sql-server-rollup/)
5. Future notes here

