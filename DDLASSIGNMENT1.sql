-->>>1. **CREATING A TABLE**
--Write a CREATE TABLE statement to create
-- a table named projects with columns: project_id 
-- (serial primary key), project_name (varchar(50)), 
-- and start_date 
-- (date with a default value of the current date).
 CREATE TABLE PROJECTS(PROJECT_ID SERIAL PRIMARY KEY,
 PROJECT_NAME VARCHAR(50),
 START_DATE DATE DEFAULT CURRENT_DATE);

 SELECT*FROM PROJECTS;




 -->>> 2. **Altering a Table:**
 --    - Write an `ALTER TABLE` statement to add 
	-- a new column `end_date`
	-- (date) to the `projects` table.



ALTER TABLE PROJECTS ADD COLUMN END_DATE DATE;
SELECT * FROM PROJECTS;





-->>> 3. **Dropping a Column:**
--     - Write an `ALTER TABLE` statement to drop 
-- 	the `end_date`
-- 	column from the `projects` table.

ALTER TABLE PROJECTS DROP COLUMN END_DATE;
SELECT * FROM PROJECTS;





-->>> 4. **Renaming a Table:**
--     - Write an `ALTER TABLE` statement to rename
-- 	the `projects` table to `initiatives`.

ALTER TABLE PROJECTS RENAME TO INITIATIVES;




-->>> 5. **Truncating a Table:**
--     - Write a `TRUNCATE TABLE` statement to remove
-- 	all rows from the `initiatives` table.
TRUNCATE TABLE INITIATIVES;





-->>> 6. **Adding a Comment:**
--     - Write a `COMMENT` statement to add a
-- 	comment "Contains project details" 
-- 	to the `initiatives` table.

 COMMENT ON TABLE INITIATIVES IS 'CONTAINS PROJECT DETAILS';
 COMMENT ON COLUMN INITIATIVES.PROJECT_NAME 
 IS 'CONATINS PROJECT NAME';


-->>> 7. **Creating a Table from a Subquery:**
--     - Write a `CREATE TABLE`
-- 	statement to create a table 
-- 	`active_projects` that includes `project_id` and 
-- 	`project_name` from the `projects` table where
-- 	`start_date` is within the last year.

-- CREATE TABLE new_table_name
-- AS
-- SELECT column1, column2, ...
-- FROM existing_table
-- WHERE condition;




-- CREATE TABLE ACTIVE_PROJECT AS SELECT PROJECT_ID,
-- PROJECT_NAME FROM INITIATIVES
-- WHERE START_DATE >= DATE('NOW', '-1 year');




CREATE TABLE ACTIVE_PROJECT AS SELECT PROJECT_ID,
PROJECT_NAME FROM INITIATIVES
WHERE START_DATE >=CURRENT_DATE - INTERVAL '1 year';
 