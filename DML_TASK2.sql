CREATE TABLE bank_accounts (
  account_id INT PRIMARY KEY,
  account_holder VARCHAR(50),
  balance NUMERIC(12, 2)
);
DROP TABLE BANK_ACCOUNTS;

INSERT INTO bank_accounts (account_id, account_holder,
balance) VALUES
(1, 'Ravi', 10000.00),
(2, 'Sneha', 15000.00),
(3, 'Amit', 5000.00),
(4, 'Zoya', 8000.00),
(5, 'Arjun', 12000.00);

select *  from bank_accounts;



--->>> ### 1. View High-Balance Accounts

-- Write a query to display all 
-- accounts with a balance above ₹10,000.
SELECT * FROM BANK_ACCOUNTS WHERE BALANCE >10000.00




-->>>> ### 2. Insert a New Account

-- Insert a new account:

-- - account_id: 6
-- - account_holder: 'Tara'
-- - balance: ₹9000
INSERT INTO BANK_ACCOUNTS VALUES(6,'TARA',9000.00);


SELECT * FROM BANK_ACCOUNTS;



-->>>>### 3. Update Ravi's Balance

-- Increase Ravi’s balance by ₹2,000 using an
-- `UPDATE` statement.

UPDATE BANK_ACCOUNTS SET
BALANCE = BALANCE + 2000 WHERE ACCOUNT_HOLDER = 'RAVI';






-->>> ### 4. Transfer Funds With ROLLBACK

-- Start a transaction:

-- - Deduct ₹3000 from Sneha
-- - Add ₹3000 to Amit
-- - Then perform a `ROLLBACK`

-- > Check the table to verify that no balances changed.

BEGIN;
-- Make changes
UPDATE BANK_ACCOUNTS SET BALANCE =BALANCE- 3000
WHERE ACCOUNT_HOLDER = 'SNEHA';
UPDATE BANK_ACCOUNTS SET BALANCE = BALANCE + 3000 
WHERE ACCOUNT_HOLDER = 'AMIT';
-- Roll back tHE TRANSACTION
ROLLBACK;


SELECT * FROM BANK_ACCOUNTS;



-- >>>>### 5. Use SAVEPOINT

-- Start a transaction:

-- - Deduct ₹1000 from Arjun
-- - Create a `SAVEPOINT sp1`
-- - Deduct ₹2000 from Zoya
-- - Rollback to `sp1`
-- - Commit the transaction

-- > Check final balances of Arjun and Zoya.
BEGIN;

UPDATE BANK_ACCOUNTS SET 
BALANCE = BALANCE - 1000 WHERE ACCOUNT_HOLDER='ARJUN';
SAVEPOINT SP1;
 UPDATE BANK_ACCOUNTS SET BALANCE = BALANCE - 2000 WHERE 
 ACCOUNT_HOLDER = 'ZOYA';
 ROLLBACK TO SAVEPOINT SP1;
 COMMIT;
 SELECT * FROM BANK_ACCOUNTS;





-->>> ### 6. Delete All Accounts and Undo It

-- Start a transaction:

-- - `DELETE` all rows from the table
-- - Then do a `ROLLBACK`

-- > Prove with SELECT * that 
-- your data is safe and sound.

BEGIN;
DELETE FROM BANK_ACCOUNTS;
ROLLBACK;
SELECT * FROM BANK_ACCOUNTS;





-- >>>### 7. Find Top 2 Richest Accounts

-- Use `ORDER BY` and `LIMIT` to get the 2 users with
-- the highest balances.

SELECT * FROM BANK_ACCOUNTS
ORDER BY BALANCE DESC LIMIT 2;


-->> ### 8. Show Average Balance

-- Write a query to calculate the
-- average balance of all users.

SELECT  AVG(BALANCE) FROM BANK_ACCOUNTS;





-->>>> ### 9. Duplicate Record Chaos

-- Insert a duplicate record for account_id 1:
-- INSERT INTO bank_accounts VALUES (1, 'Ravi', 7500.00);
-- > Then select all records for account_id = 1 to
-- see both entries.


INSERT INTO bank_accounts VALUES (1, 'Ravi', 7500.00);
SELECT * FROM bank_accounts
WHERE account_id = 1;






-->>> ### 10. Transfer ₹20,000 From Ravi to 
-- Sneha with Check

-- Try transferring ₹20,000 from Ravi to Sneha.

-- If Ravi doesn’t have that much, rollback. Otherwise, commit.

-- > Use manual logic to inspect balance before proceedin

BEGIN;

-- Deduct 
UPDATE bank_accounts
SET balance = balance - 20000
WHERE account_holder = 'Ravi';

--ADD
UPDATE bank_accounts
SET balance = balance + 20000
WHERE account_holder = 'Sneha';

COMMIT;
SELECT * FROM bank_accounts
WHERE account_holder IN ('Ravi', 'Sneha');





----->>>> ### 10. Merge

-- ### Problem Statement :

-- > Now, write a MERGE statement to do the following:
-- > 
-- - If the account already exists in `bank_accounts`, **update** the balance.
-- - If the account doesn’t exist, **insert** it as a new row.


CREATE TABLE incoming_transactions (
  account_id INT,
  account_holder VARCHAR(50),
  balance NUMERIC(12, 2)
);

INSERT INTO incoming_transactions 
(account_id, account_holder, balance) VALUES
(2, 'Sneha', 18000.00),    
(6, 'Tara', 9000.00),      
(3, 'Amit', 7000.00);  


INSERT INTO bank_accounts
(account_id , account_holder, balance)
SELECT account_id, account_holder, balance
FROM incoming_transactions
ON CONFLICT (account_id)
DO UPDATE
SET balance = EXCLUDED.balance,
    account_holder = EXCLUDED.account_holder;
