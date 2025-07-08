select * from employ;
--------------------------------------------------------------------------------------------------------
-- >>>>### 1. **Format Contact Numbers**

-- You have a column `contact_no` with values like `'919876543210'` (India mobile numbers).

-- Write a query to return them as:

-- ➡️ `'(+91) 98765-43210'`
select contact_number from employ;
select * from employ;


SELECT
  contact_number,
  '(+'|| SUBSTRING(contact_number FROM 1 FOR 2)||')'||' ' ||SUBSTRING(contact_number FROM 3 FOR 5)|| '-' || SUBSTRING(contact_number FROM 8 FOR 5) 
 
FROM
  employ;





delete from employ;


INSERT INTO EMPLOY (employee_id,FIRST_NAME, LAST_NAME, CONTACT_NUMBER, USER_EMAIL, PRODUCT_NAME, PRODUCT_DESCRIPTION) VALUES
(1234,'Amit', 'Sharma', '9876543210', 'amit.sharma@example.com', 'laptop', 'Dell Inspiron 15, Intel i5, 8GB RAM, 512GB SSD'),
(2345,'Sneha', 'Patel', '9123456780', 'sneha.patel@example.com', 'cpu', 'HP Pavilion x360, Intel i7, 16GB RAM, 1TB SSD'),
(3456,'Rahul', 'Verma', '9988776655', 'rahul.verma@example.com', 'mouse', 'Lenovo ThinkPad, AMD Ryzen 5, 8GB RAM, 256GB SSD'),
(4567,'Pooja', 'Mehta', '9090909090', 'pooja.mehta@example.com', 'monitor', 'Apple MacBook Air, M2 chip, 8GB RAM, 256GB SSD');


----------------------------------------------------------------------------------------------------------------------------------------------------
-- >>>>>  ### 2. **Create Employee IDs**

-- From the `employees` table (`first_name`, `last_name`, `employee_id`),

-- generate an ID like this:

-- ➡️ `FirstInitial + LastName + Last 2 digits of employee_id`

-- Example: `AThomas23` if name = Alice Thomas, id = 100023


SELECT FIRST_NAME, 
LAST_NAME,
EMPLOYEE_ID,
LEFT(FIRST_NAME, 1)|| LAST_NAME|| RIGHT(EMPLOYEE_ID::TEXT, 2)
FROM EMPLOY;


----------------------------------------------------------------------------------------------------------------
-- >>>>### 3. **Remove Symbols From Strings**

-- In a `products(description)` column, remove all occurrences of `*`, `@`, and `#` from the string.


SELECT USER_EMAIL,
  REPLACE(
    REPLACE(
	     REPLACE(USER_EMAIL, '*', ''),
     '@', ''),
   '#', '')
FROM EMPLOY;




--------------------------------------------------------------------------------------------------------------
--->>>> ### 4.**Show Only Valid Emails**

-- You have a `users(email)` column.

-- Write a query to return only those emails **ending in** `'@gmail.com'` or `'@yahoo.com'`.
SELECT USER_EMAIL FROM EMPLOY
WHERE 
USER_EMAIL LIKE '%@example.com'
OR USER_EMAIL LIKE '%@YAHOO.COM';




--------------------------------------------------------------------------------------------------------------
-->>>>> ### 5. **Capitalize the First Letter of a Word**

-- From `product_name`, return the string with only the **first letter capitalized**, rest lowercase.

-- Example: `'lAPTOP'` → `'Laptop'`


select product_name , UPPER(SUBSTRING(PRODUCT_NAME FOR 1))
         ||SUBSTRING(PRODUCT_NAME FROM 2) FROM EMPLOY;