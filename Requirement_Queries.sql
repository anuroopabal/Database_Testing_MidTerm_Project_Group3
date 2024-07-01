--Power writers
SELECT a.name AS author, b.genre, COUNT(b.book_id) AS books_published
FROM authors a
JOIN books b ON a.author_id = b.author_id
WHERE b.publication_date > CURRENT_DATE - INTERVAL '5 year' 
GROUP BY a.author_id, a.name, b.genre
HAVING COUNT(b.book_id) > 6;
--Loyal Customers
SELECT c.name AS loyal_customer, SUM(s.quantity) AS books_purchased, SUM(s.quantity * b.price) AS amount_spent
FROM customers c 
JOIN sales s ON c.customer_id = s.customer_id 
JOIN books b ON s.book_id = b.book_id 
WHERE s.sale_date >= CURRENT_DATE - INTERVAL '1 year' 
GROUP BY c.customer_id, c.name
HAVING SUM(s.quantity * b.price) > 20;
--Well Reviewed Books
SELECT b.book_id, b.title, b.genre, b.book_format, r.rating
FROM books b
JOIN reviews r ON b.book_id = r.book_id
GROUP BY b.book_id, b.title, b.genre, b.book_format, r.rating
HAVING r.rating > (SELECT AVG(rating) FROM reviews);
--The Most Popular Genre by Sales
SELECT b.genre, SUM(s.quantity) AS total_sales 
FROM books b 
JOIN sales s ON b.book_id = s.book_id 
GROUP BY b.genre 
ORDER BY total_sales DESC 
LIMIT 1; 
--The 10 Most Recent Posted Reviews by Customers
SELECT c.name AS customer_name, b.title AS book_title, r.rating, r.comment AS review, r.review_date
FROM reviews r 
JOIN customers c ON r.customer_id = c.customer_id 
JOIN books b ON r.book_id = b.book_id 
ORDER BY r.review_date DESC 
LIMIT 10; 