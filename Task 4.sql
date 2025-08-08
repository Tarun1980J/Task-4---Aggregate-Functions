SELECT * FROM CATEGORIES;
SELECT * FROM AUTHORS;
SELECT * FROM BOOKS;
SELECT * FROM BOOKAUTHORS;
SELECT * FROM MEMBERS;
SELECT * FROM LOANS;

---- max and min ----
SELECT MAX(JoinDate) AS LatestMember FROM Members;

SELECT MIN(YearPublished) AS OldestBookYear FROM Books;

---- count ----
SELECT COUNT(*) AS TotalBooks FROM Books;
SELECT COUNT(DISTINCT CategoryID) AS UniqueCategories FROM Books;

-- Total number of books
SELECT COUNT(*) AS TotalBooks FROM Books;

-- Number of members who have provided their email
SELECT COUNT(Email) AS MembersWithEmail FROM Members;

---- Group By ----
-- Count of books in each category
SELECT CategoryID, COUNT(*) AS BookCount
FROM Books
GROUP BY CategoryID;

SELECT CategoryID, COUNT(*) AS TotalBooks
FROM Books
GROUP BY CategoryID;

-- Total fines paid by each member
SELECT MemberID, SUM(FineAmount) AS TotalFine
FROM Loans
GROUP BY MemberID;

SELECT * FROM (
  SELECT BookID, min(yearpublished) AS first_book
  FROM books
  GROUP BY bookid
  ORDER BY first_book DESC
)
WHERE ROWNUM <= 3;

---- having ----
SELECT CategoryID, COUNT(*) AS TotalBooks
FROM Books
GROUP BY CategoryID
HAVING COUNT(*) > 1;

SELECT CategoryID, 
       COUNT(*) AS BookCount
FROM Books
GROUP BY CategoryID
HAVING SUM(Price) > 800;


SELECT CategoryID, COUNT(*) AS TotalBooks
FROM Books
GROUP BY CategoryID
HAVING COUNT(*) > 5;

--- i don't have any columns related to check functions like (AVG, SUM). so, i'm using them on year -- which is not standard thing

select sum(yearpublished) from books;

select avg(yearpublished) from books;

