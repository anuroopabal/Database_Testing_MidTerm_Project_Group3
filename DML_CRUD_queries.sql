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