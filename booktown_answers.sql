/* Find all subjects sorted by subject */

SELECT *
FROM subjects
ORDER BY subjects;

/* Find all subjects sorted by LOCATION */

SELECT *
FROM subjects
ORDER BY location;

/* Find the book "Little Women" */

SELECT title
FROM books
WHERE title 
= 'Little Women';

/* Find all books containing the work "Python" */

SELECT title
FROM books
WHERE title LIKE '%Python%';

/* Find all subjects with the location
 "Main Street" sort them by subject */

SELECT *
FROM subjects
WHERE location = 'Main St'
ORDER BY subject;

/* Find all books about Computers and list ONLY the book titles */

SELECT
  title
FROM books
  INNER JOIN subjects
  ON books.subject_id = subjects.id
WHERE subjects.id IN (4);

/* Find all books and display a result table
with ONLY the following columns 
	* Book title
	* Author's first name
	* Author's last name
	* Book subject
*/

SELECT
  books.title,
  authors.first_name AS author_first_name,
  authors.last_name AS author_last_name,
  subjects.subject AS book_subject
FROM ((books
  INNER JOIN authors
  ON books.author_id = authors.id)
  INNER JOIN subjects
  ON subjects.id = books.subject_id);

/* Find all books that are listed in the stock table
	* Sort them by retail price (most expensive first)
	* Display ONLY: title and price
*/

SELECT
  books.title,
  stock.retail AS price
FROM ((stock
  INNER JOIN editions
  ON stock.isbn = editions.isbn)
  INNER JOIN books
  ON books.id = editions.book_id)
ORDER BY retail DESC;

/* Find the book "Dune" and display ONLY the following columns
	* Book title
	* ISBN number
	* Publisher name
	* Retail price
  */

SELECT
  books.title,
  stock.isbn AS ISBN_number,
  publishers.name AS publisher_name,
  stock.retail AS retail_price
FROM
  (((books
  INNER JOIN editions
  ON books.id = editions.book_id)
  INNER JOIN publishers
  ON publishers.id = editions.publisher_id)
  INNER JOIN stock
  ON stock.isbn = editions.isbn)
WHERE books.title IN
('Dune');

/* Find
all shipments sorted by ship date display a result table
with ONLY the following
columns:
* Customer first name
	* Customer last name
	* ship date
	* book title
*/

SELECT
  customers.first_name AS customer_first_name,
  customers.last_name AS customer_last_name,
  shipments.ship_date AS ship_date,
  books.title AS book_title
FROM (((customers
  INNER JOIN shipments
  ON customers.id = shipments.customer_id)
  INNER JOIN editions
  ON editions.isbn = shipments.isbn)
  INNER JOIN books
  ON books.id = editions.book_id);

/* Get the COUNT of all books */

SELECT COUNT (*)
FROM
  books;

/* Get the COUNT of all Locations */

SELECT COUNT (location)
FROM
  subjects;

/* Get the COUNT of each unique location 
in the subjects table. Display the count and the location name.
(hint: requires GROUP BY).
*/

SELECT
  location,
  COUNT (location)
FROM
  subjects
GROUP BY
(location)
ORDER BY subjects.count
DESC;

/* List all books. Display the book_id, title, 
and a count of how many editions each book has.
(hint:requires GROUP BY and JOIN) */

SELECT
  books.title,
  book_id,
  COUNT (*) AS editions
FROM
  editions
  INNER JOIN books
  ON books.id = editions.book_id
GROUP BY 
  books.title, editions.book_id;
