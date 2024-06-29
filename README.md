# Database Testing MidTerm Project - Online Bookstore Database Design
## Duties
Group03:
* Member 1: Anuroopa Balachandran - 
    * Design the database schema with Books and Reviews tables.
    * Create database and tables using SQL code.
    * Create the Typescript interface for table modification.
* Member 2: Sangeetha Radhakrishnan - 
* Member 3: Swathi Kona - 
    * Design the database schema with customers and sales tables.
    * Create tables using SQL code.
    * Write the SQL queries for the given requirements.

## Database Schema
Online Bookstore Database Design, including the below mentioned tables and its attributes.

### Tables
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
| price            | DECIMAL(10, 2)| Price of the book                                         |


#### 6. Sales
| Attribute        | Type          | Description                                    |
|------------------|---------------|------------------------------------------------|
| sale_id          | VARCHAR(50)   | Primary Key; Order unique ID                   |
| customer_id      | INT           | Foreign Key; REFERENCES customers(customer_id) |
| book_id          | INT           | Foreign Key; REFERENCES books(book_id)         |
| sale_date        | DATE          | Date of the sale                               |
| quantity         | INT           | Quantity of books sold                         |


## Database Creation
```sql
CREATE DATABASE "OnlineBookStoreDB"
```

#### books table:
```sql
CREATE SEQUENCE book_id_seq START 1;
CREATE TABLE books (
    book_id VARCHAR(50) PRIMARY KEY DEFAULT ('BOOK' || LPAD(nextval('book_id_seq')::TEXT,1,'')) NOT NULL,
    title VARCHAR(100) NOT NULL,
    genre VARCHAR(50) NOT NULL,
    author_id INT REFERENCES authors(author_id) NOT NULL,
    publisher_id INT REFERENCES publishers(publisher_id) NOT NULL,
    publication_date DATE NOT NULL,
    book_format VARCHAR(20) CHECK (book_format IN ('Physical', 'E-book', 'Audiobook')) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);
```

#### sales table:
```sql
CREATE SEQUENCE sale_id_seq START 1;
CREATE TABLE sales (
    sale_id VARCHAR(50) PRIMARY KEY DEFAULT ('ORDER' || LPAD(nextval('sale_id_seq')::TEXT,1,'')) NOT NULL,
    customer_id varchar(50) REFERENCES customers(customer_id) NOT NULL,
    book_id varchar(50) REFERENCES books(book_id) NOT NULL,
    sale_date DATE DEFAULT CURRENT_DATE NOT NULL,
    quantity INT NOT NULL
);
```

## DDL/DML - CRUD

## Queries for Requirements

## Typescript Interface

## References
