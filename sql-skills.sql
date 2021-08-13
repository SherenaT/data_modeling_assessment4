-- Artist Table¶
-- Add 3 new artists to the artist table using INSERT. (It’s already created.)
INSERT INTO artist( name)
VALUES ('Taylor Swift'), ('Lifehouse'), ('Britney Spears')

-- Select 5 artists in alphabetical order.
SELECT * FROM artist
ORDER BY name ASC
LIMIT 5


-- Employee Table
-- List all employee first and last names only that live in Calgary.
SELECT first_name, last_name FROM employee
WHERE city = 'Calgary';

-- Find everyone that reports to Nancy Edwards (Use the ReportsTo column). You will need to query the employee table to find the Id for Nancy Edwards
SELECT * FROM employee
WHERE reports_to = 2;

-- Count how many people live in Lethbridge.
SELECT COUNT (city) FROM employee
WHERE city = 'Lethbridge';

-- Invoice Table
-- Count how many orders were made from the USA.
SELECT COUNT (billing_country) FROM invoice
WHERE billing_country = 'USA'

-- Find the largest order total amount.
SELECT * FROM invoice
WHERE total = (SELECT MAX(total) FROM invoice)

-- Find the smallest order total amount.
SELECT * FROM invoice
WHERE total = (SELECT MIN(total) FROM invoice)

-- Find all orders bigger than $5.
SELECT * FROM invoice
WHERE total > 5

-- Count how many orders were smaller than $5.
SELECT COUNT (*) FROM invoice
WHERE total < 5

-- Get the total sum of the orders.
SELECT COUNT (*) FROM invoice
WHERE total < 5

-- JOIN Queries (Various tables)
-- Get all invoices where the unit_price on the invoice_line is greater than $0.99.
SELECT i.invoice_id, i.customer_id, i.invoice_date, il.unit_price, il.quantity, i.total
FROM invoice i
JOIN invoice_line il
ON il.invoice_id = i.invoice_id
WHERE il.unit_price > 0.99

-- Get the invoice_date, customer first_name and last_name, and total from all invoices.
SELECT i.invoice_id, c.first_name, c.last_name, i.total
FROM invoice i
JOIN customer c
ON c.customer_id = i.customer_id

-- Get the customer first_name and last_name and the support rep’s first_name and last_name from all customers. Note that support reps are on the employee table.
SELECT c.first_name AS "Customers First Name", c.last_name AS "Customers Last Name", e.first_name AS "CS Rep First Name", e.last_name AS"CS Rep Last Name" 
FROM customer c
JOIN employee e
ON e.employee_id = c.support_rep_id

-- Get the album title and the artist name from all albums.
SELECT art.name, al.title FROM artist art
JOIN album al
ON al.artist_id = art.artist_id