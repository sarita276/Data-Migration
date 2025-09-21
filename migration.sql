-- Insert  authors
INSERT INTO Newlegacy.Authors (Name, Email)
SELECT DISTINCT AuthorName, AuthorEmail
FROM LegacyDB.Legacy_Library;

-- Insert publishers
INSERT INTO Newlegacy.Publishers (Name, Address)
SELECT DISTINCT PublisherName, PublisherAddress
FROM LegacyDB.Legacy_Library;

-- Insert categories
INSERT INTO Newlegacy.Categories (CategoryName)
SELECT DISTINCT Category
FROM LegacyDB.Legacy_Library;

-- Insert books with foreign key mappings

INSERT INTO Newlegacy.Books (BookID, Title, AuthorID, PublisherID, CategoryID)
SELECT l.BookID,
       l.Title,
       a.AuthorID,
       p.PublisherID,
       c.CategoryID
FROM LegacyDB.Legacy_Library l
JOIN Newlegacy.Authors a 
     ON l.AuthorName = a.Name AND l.AuthorEmail = a.Email
JOIN Newlegacy.Publishers p 
     ON l.PublisherName = p.Name AND l.PublisherAddress = p.Address
JOIN Newlegacy.Categories c 
     ON l.Category = c.CategoryName;
