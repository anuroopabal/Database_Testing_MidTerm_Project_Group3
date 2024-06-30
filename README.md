# Database Testing MidTerm Project - Online Bookstore Database Design
## Duties
Group03:
* Member 1: Anuroopa Balachandran - 
    * Design the database schema with Books and Reviews tables.
    * Create database and tables using SQL code.
    * Create the Typescript interface for table modification.
* Member 2: Sangeetha Radhakrishnan - 
    * Design the database schema with Authors and Publishers tables.
    * Create tables using SQL code.
    * Develop SQL code for database creation and insertion.
* Member 3: Swathi Kona - 
    * Design the database schema with customers and sales tables.
    * Create tables using SQL code.
    * Write the SQL queries for the given requirements.

## Database Schema
Online Bookstore Database Design, including the below mentioned tables and its attributes.

### Tables and Attributes
#### 1. Customers 

| Attribute        | Type          | Description                             | 
|------------------|---------------|-----------------------------------------| 
| customer_id      | VARCHAR(50)   | Primary Key; Customer unique ID         | 
| name             | VARCHAR(100)  | Name of the customer                    | 
| email            | VARCHAR(100)  | Email address of the customer           | 
| address          | VARCHAR(200)  | Address of the customer                 | 
| phone            | NUMERIC(10,0) | Email address of the customer           | 
| registration_date| DATE          | Date of registration                    | 

#### 2. Authors

| Attribute | Type | Description |
|------------------|----------------------|----------------------------------|
| author_id | SERIAL PRIMARY KEY | Primary Key; author unique ID |
| name | VARCHAR(100) | Name of the author | 

#### 3. Publishers

| Attribute | Type | Description |
|------------------|----------------------|----------------------------------|
| publisher_id | SERIAL PRIMARY KEY | Primary Key; publisher unique ID |
| name | VARCHAR(100) | Name of the publisher |


#### 4. Books
| Attribute        | Type          | Description                                               |
|------------------|---------------|-----------------------------------------------------------|
| book_id          | VARCHAR(50)   | Primary Key; Book unique ID                               |
| title            | VARCHAR(100)  | Title of the book                                         |
| genre            | VARCHAR(50)   | Genre of the book                                         |
| author_id        | INT           | Foreign Key; REFERENCES authors(author_id)                |
| publisher_id     | INT           | Foreign Key; REFERENCES publishers(publisher_id)          |
| publication_date | DATE          | Date of publication                                       |
| book_format      | VARCHAR(20)   | It can only take values 'Physical', 'E-book', 'Audiobook' |
| quantity         | INT           | Quantity of the book                                         |
| price            | DECIMAL(10, 2)| Price of the book                                         |

#### 5. Reviews 

| Attribute        | Type          | Description                                    | 
|------------------|---------------|------------------------------------------------| 
| review_id        | VARCHAR(50)   | Primary Key; Review unique ID                  | 
| customer_id      | INT           | Foreign Key; REFERENCES customers(customer_id) | 
| book_id          | INT           | Foreign Key; REFERENCES books(book_id)         | 
| review_date      | DATE          | Date of the review                             | 
| rating           | DECIMAL(10, 2)| Rating given by the customer                   | 
| comment          | TEXT          | Review comment by customer                     | 


#### 6. Sales
| Attribute        | Type          | Description                                    |
|------------------|---------------|------------------------------------------------|
| sale_id          | VARCHAR(50)   | Primary Key; Order unique ID                   |
| customer_id      | INT           | Foreign Key; REFERENCES customers(customer_id) |
| book_id          | INT           | Foreign Key; REFERENCES books(book_id)         |
| sale_date        | DATE          | Date of the sale                               |
| quantity         | INT           | Quantity of books sold                         |

## SQL Code to Create the Database
## Database Creation
```sql
CREATE DATABASE "OnlineBookStoreDB"
```
*Use the created Database and create below tables.*
```sql

--customers table:
CREATE SEQUENCE customer_id_seq START 1;  
CREATE TABLE customers ( 
    customer_id VARCHAR(50) PRIMARY KEY DEFAULT ('CUST' || LPAD(nextval('customer_id_seq')::TEXT, 5, '')) NOT NULL, 
    name VARCHAR(100) NOT NULL, 
    email VARCHAR(100) UNIQUE NOT NULL, 
    address VARCHAR(200) NOT NULL, 
    phone NUMERIC(10,0) UNIQUE NOT NULL, 
    registration_date DATE DEFAULT CURRENT_DATE 
); 

--authors table: 
CREATE TABLE authors (
    author_id SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(100) UNIQUE NOT NULL
);

--publishers table:
CREATE TABLE publishers (
    publisher_id SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(100) UNIQUE NOT NULL
); 

--books table:
CREATE SEQUENCE book_id_seq START 1;
CREATE TABLE books (
    book_id VARCHAR(50) PRIMARY KEY DEFAULT ('BOOK' || LPAD(nextval('book_id_seq')::TEXT,5,'')) NOT NULL,
    title VARCHAR(100) NOT NULL,
    genre VARCHAR(50) NOT NULL,
    author_id INT REFERENCES authors(author_id) NOT NULL,
    publisher_id INT REFERENCES publishers(publisher_id) NOT NULL,
    publication_date DATE NOT NULL,
    book_format VARCHAR(20) CHECK (book_format IN ('Physical', 'E-book', 'Audiobook')) NOT NULL,
    quantity INT,
    price DECIMAL(10, 2) NOT NULL
);

--reviews table:
CREATE SEQUENCE review_id_seq START 1;  
CREATE TABLE reviews ( 
    review_id VARCHAR(50) PRIMARY KEY DEFAULT ('REV' || LPAD(nextval('review_id_seq')::TEXT,5,'0')) NOT NULL, 
    customer_id varchar(50) REFERENCES customers(customer_id) NOT NULL, 
    book_id varchar(50) REFERENCES books(book_id) NOT NULL, 
    review_date DATE DEFAULT CURRENT_DATE NOT NULL, 
    rating DECIMAL(10, 2) NOT NULL, 
    comment TEXT
); 

--sales table:
CREATE SEQUENCE sale_id_seq START 1;
CREATE TABLE sales (
    sale_id VARCHAR(50) PRIMARY KEY DEFAULT ('ORDER' || LPAD(nextval('sale_id_seq')::TEXT,5,'')) NOT NULL,
    customer_id varchar(50) REFERENCES customers(customer_id) NOT NULL,
    book_id varchar(50) REFERENCES books(book_id) NOT NULL,
    sale_date DATE DEFAULT CURRENT_DATE NOT NULL,
    quantity INT NOT NULL
);
```

## DDL/DML - CRUD Operations in books Table
#### DDL:
*SQL code is already provided in above section.*
```sql

CREATE SEQUENCE book_id_seq START 1;
CREATE TABLE books (
    book_id VARCHAR(50) PRIMARY KEY DEFAULT ('BOOK' || LPAD(nextval('book_id_seq')::TEXT,5,'')) NOT NULL,
    title VARCHAR(100) NOT NULL,
    genre VARCHAR(50) NOT NULL,
    author_id INT REFERENCES authors(author_id) NOT NULL,
    publisher_id INT REFERENCES publishers(publisher_id) NOT NULL,
    publication_date DATE NOT NULL,
    book_format VARCHAR(20) CHECK (book_format IN ('Physical', 'E-book', 'Audiobook')) NOT NULL,
    quantity INT,
    price DECIMAL(10, 2) NOT NULL
);
```

#### DML:

```sql

--Insert a Record (Create)
INSERT INTO authors( name) VALUES ( 'Chetan Bhagat'), ( 'Arundhati Rai'), ( 'Kamala Suraya');
INSERT INTO publishers( name) VALUES ( 'Dona Books'), ( 'DC Books');
INSERT INTO books( title, genre, author_id, publisher_id, publication_date, book_format, quantity, price)
VALUES ('Good Days are Coming', 'Drama', 1, 2, '2024-06-15', 'E-book', NULL, 65.05), ('Book of Hopes', 'Fiction', 3, 1, '2023-01-01', 'Physical', 10, 19.99);

--Retrieve a Record (Read)
SELECT * FROM books WHERE book_id = 'BOOK2';

--Update a Record (Update)
UPDATE books SET title = 'Book of Mystery', genre = 'Mystery', quantity = 8, price = 21.99 WHERE book_id = 'BOOK2';

--Delete a Record (Delete)
DELETE FROM books WHERE book_id = 'BOOK2';

``` 


## SQL Queries for Requirements
#### 1. Power writers 

```sql 

SELECT a.name AS author, b.genre, COUNT(b.book_id) AS books_published
FROM authors a
JOIN books b ON a.author_id = b.author_id
WHERE b.publication_date > CURRENT_DATE - INTERVAL '5 year' 
GROUP BY a.author_id, a.name, b.genre
HAVING COUNT(b.book_id) > 6;

``` 

#### 2. Loyal Customers 

```sql 

SELECT c.name AS loyal_customer, SUM(s.quantity) AS books_purchased, SUM(s.quantity * b.price) AS amount_spent
FROM customers c 
JOIN sales s ON c.customer_id = s.customer_id 
JOIN books b ON s.book_id = b.book_id 
WHERE s.sale_date >= CURRENT_DATE - INTERVAL '1 year' 
GROUP BY c.customer_id, c.name
HAVING SUM(s.quantity * b.price) > 20;

``` 
#### 3. Well Reviewed Books 

```sql 

SELECT b.book_id, b.title, b.genre, b.book_format, r.rating
FROM books b
JOIN reviews r ON b.book_id = r.book_id
GROUP BY b.book_id, b.title, b.genre, b.book_format, r.rating
HAVING r.rating > (SELECT AVG(rating) FROM reviews);

``` 

#### 4. Most Popular Genre by Sales 

```sql 

SELECT b.genre, SUM(s.quantity) AS total_sales 
FROM books b 
JOIN sales s ON b.book_id = s.book_id 
GROUP BY b.genre 
ORDER BY total_sales DESC 
LIMIT 1; 

``` 

#### 5. 10 Most Recent Posted Reviews 

```sql 

SELECT c.name AS customer_name, b.title AS book_title, r.rating, r.comment AS review, r.review_date
FROM reviews r 
JOIN customers c ON r.customer_id = c.customer_id 
JOIN books b ON r.book_id = b.book_id 
ORDER BY r.review_date DESC 
LIMIT 10; 

``` 

## Typescript Interface

## References

* [GitHub](https://github.com/anuroopabal/Database_Testing_MidTerm_Project_Group3)
