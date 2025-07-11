CREATE TABLE sales (
    sale_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(50),
    region VARCHAR(50),
    sale_amount INT,
    sale_date DATE
);

INSERT INTO sales (employee_name, region, sale_amount, sale_date) VALUES
('Alice', 'North', 1200, '2024-01-10'),
('Bob', 'North', 1800, '2024-01-12'),
('Charlie', 'North', 1700, '2024-01-15'),
('Diana', 'South', 1600, '2024-01-11'),
('Eve', 'South', 2000, '2024-01-13'),
('Frank', 'South', 1500, '2024-01-17'),
('Grace', 'East', 2200, '2024-01-09'),
('Heidi', 'East', 1900, '2024-01-14'),
('Ivan', 'East', 2100, '2024-01-20');

-------------------------------------------------------------------------------------------------------------
-- >>>>### **Q1.** Add a column to assign a row number to each sale across the whole table,
--ordered by sale amount descending.

-- ✅ *Use `ROW_NUMBER()`*

SELECT *,
       ROW_NUMBER() OVER (PARTITION BY region ORDER BY sale_amount DESC) AS sales_num
FROM sales;




-------------------------------------------------------------------------------------------------------------
-- >>>>### **Q2.** Rank employees within their region based on sale amount. Handle ties properly.

-- ✅ *Use `RANK()` + `PARTITION BY region`*

SELECT employee_name,
       RANK() OVER (PARTITION BY region ORDER BY sale_amount DESC) AS rank from sales





-------------------------------------------------------------------------------------------------------------
-- >>>>###Q3.Use `DENSE_RANK()` to do the same as Q2. Compare outputs with Q2 — what's different?

-- ✅ *Explain gaps in ranks*


SELECT employee_name,
DENSE_RANK() OVER (PARTITION BY region ORDER BY sale_amount DESC) AS dense_rank from sales




-------------------------------------------------------------------------------------------------------------
-- >>>>### **Q4.** Show each employee’s **previous sale amount in their region** (by sale date).
-- Also show the **difference**.

-- ✅ *Use `LAG()` and subtract*
SELECT employee_name,
LAG(sale_amount) OVER (PARTITION BY region ORDER BY sale_date) AS prev_sale   from sales;



-------------------------------------------------------------------------------------------------------------
-- >>>>### **Q5.** Calculate the running total of sale amount within each region,
-- ordered by sale date.

-- ✅ *Use `SUM() OVER` + `PARTITION BY` + `ORDER BY`*
select employee_name, region,sale_amount,sale_date,
SUM(sale_amount) OVER (PARTITION BY region ORDER BY sale_date
ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total
from sales;

-------------------------------------------------------------------------------------------------------------
-- >>>>### **Q6.** Show the highest sale amount in each region next to every employee.

-- ✅ *Use `MAX() OVER (PARTITION BY region)`*
select employee_name, region,sale_amount,sale_date,
MAX(SALE_AMOUNT)OVER(PARTITION BY REGION ORDER BY SALE_DATE) AS MAX_SALE
FROM SALES;



-------------------------------------------------------------------------------------------------------------
-- >>>>Q7. For each employee, find the first and last sale amount in their region based on date.
-- ✅ Use FIRST_VALUE() and LAST_VALUE() with frame:

-- ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
select employee_name, region,sale_amount,sale_date,
 FIRST_VALUE(salE_AMOUNT) OVER (PARTITION BY REGION ORDER BY saLE_DATE) AS min_salE_AMOUNT,
       LAST_VALUE(salE_AMOUNT) OVER (PARTITION BY REGION ORDER BY salE_DATE
                                ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS max_salE_AMOUNT

FROM SALES;								


-------------------------------------------------------------------------------------------------------------
-- >>>>### **Q8.** Divide all sales into 3 buckets based on sale amount,
-- and label them as sale tiers (1 = top).

-- ✅ *Use `NTILE(3) OVER (ORDER BY sale_amount DESC)`*

select employee_name, region,sale_amount,sale_date,
 NTILE(3) OVER (ORDER BY SALE_AMOUNT DESC) AS SALE_TIERS
 FROM SALES;