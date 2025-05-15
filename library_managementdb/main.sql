-- Create and use the database
CREATE DATABASE IF NOT EXISTS library_db;
USE library_db;

-- Create authors table
CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    birth_year INT,
    INDEX (name)
);

-- Create publishers table
CREATE TABLE Publishers (
    publisher_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    country VARCHAR(50),
    INDEX (name)
);

-- Create book categories tables
CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- Create books table
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    author_id INT NOT NULL,
    publisher_id INT NOT NULL,
    category_id INT NOT NULL,
    year_published YEAR,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id),
    FOREIGN KEY (publisher_id) REFERENCES Publishers(publisher_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id),
    INDEX (title),
    INDEX (author_id),
    INDEX (category_id)
);

-- Create members table
CREATE TABLE Members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    join_date DATE NOT NULL,
    INDEX (email)
);

-- Create table for loaned books and people who borrowed
CREATE TABLE Loans (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT NOT NULL,
    book_id INT NOT NULL,
    loan_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (member_id) REFERENCES Members(member_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    INDEX (loan_date),
    INDEX (member_id),
    INDEX (book_id)
);
-- All this ensures proper indexing and 3rd normal form is followed

-- Insert few values into all tables so that the database won't be empty
-- Authors table
INSERT INTO Authors (name, birth_year) VALUES
('Chinua Achebe', 1930),
('Wole Soyinka', 1934),
('Ngũgĩ wa Thiong\'o', 1938),
('Chimamanda Ngozi Adichie', 1977),
('Ben Okri', 1959),
('Ayi Kwei Armah', 1939),
('Nadine Gordimer', 1923),
('J.M. Coetzee', 1940),
('Mariama Bâ', 1929),
('Tsitsi Dangarembga', 1959),
('Buchi Emecheta', 1944),
('Alan Paton', 1903),
('Ngugi Wa Mirii', 1951),
('Grace Ogot', 1930),
('Meja Mwangi', 1948);

-- Publishers table
INSERT INTO Publishers (name, country) VALUES
('Penguin Books', 'UK'),
('Heinemann', 'UK'),
('Longhorn Publishers', 'Kenya'),
('Cassava Republic', 'Nigeria'),
('Farafina Books', 'Nigeria'),
('Oxford University Press', 'UK'),
('Macmillan', 'USA'),
('Random House', 'USA'),
('HarperCollins', 'USA'),
('Vintage Books', 'USA'),
('Pearson', 'UK'),
('Pan Macmillan', 'UK'),
('East African Educational Publishers', 'Kenya'),
('Jacana Media', 'South Africa'),
('University of Nairobi Press', 'Kenya');

-- Categories table
INSERT INTO Categories (name) VALUES
('Fiction'),
('Poetry'),
('Biography'),
('Drama'),
('Non-Fiction'),
('Children Literature'),
('Fantasy'),
('African Literature'),
('Science'),
('History'),
('Philosophy'),
('Short Stories'),
('Classic'),
('Religion'),
('Romance');

-- Books table
INSERT INTO Books (title, author_id, publisher_id, category_id, year_published) VALUES
('Things Fall Apart', 1, 2, 8, 1958),
('No Longer at Ease', 1, 2, 8, 1960),
('The Man Died', 2, 2, 4, 1972),
('Decolonising the Mind', 3, 3, 5, 1986),
('Half of a Yellow Sun', 4, 5, 1, 2006),
('The Famished Road', 5, 4, 1, 1991),
('The Beautyful Ones Are Not Yet Born', 6, 2, 1, 1968),
('Burger\'s Daughter', 7, 1, 8, 1979),
('Disgrace', 8, 8, 1, 1999),
('So Long a Letter', 9, 13, 3, 1980),
('Nervous Conditions', 10, 14, 1, 1988),
('Second Class Citizen', 11, 2, 1, 1974),
('Cry, the Beloved Country', 12, 1, 10, 1948),
('I Will Marry When I Want', 13, 13, 4, 1977),
('The Promised Land', 14, 13, 1, 1966);

-- Members table
INSERT INTO Members (full_name, email, join_date) VALUES
('Daniel Ohachor', 'daniel@example.com', '2024-01-10'),
('Grace Uche', 'graceuche@example.com', '2024-01-15'),
('Tunde Adebayo', 'tunde.a@example.com', '2024-02-01'),
('Ngozi Chukwu', 'ngozic@example.com', '2024-02-10'),
('Emeka Obi', 'emekao@example.com', '2024-03-05'),
('Fatima Bello', 'fatimab@example.com', '2024-03-20'),
('Ibrahim Musa', 'ibrahim.m@example.com', '2024-04-01'),
('Yetunde Akinsola', 'yetundea@example.com', '2024-04-10'),
('Samuel Edet', 'samuele@example.com', '2024-04-15'),
('Amaka Nwosu', 'amakan@example.com', '2024-04-20'),
('John Doe', 'john@example.com', '2024-05-01'),
('Jane Smith', 'jane.smith@example.com', '2024-05-02'),
('Peter Obi', 'peterobi@example.com', '2024-05-03'),
('Hadiza Ahmed', 'hadiza@example.com', '2024-05-04'),
('Ayo Balogun', 'ayo.b@example.com', '2024-05-05');

-- Loans table
INSERT INTO Loans (member_id, book_id, loan_date, return_date) VALUES
(1, 1, '2024-04-01', '2024-04-15'),
(2, 2, '2024-04-02', '2024-04-16'),
(3, 3, '2024-04-03', '2024-04-17'),
(4, 4, '2024-04-04', '2024-04-18'),
(5, 5, '2024-04-05', '2024-04-19'),
(6, 6, '2024-04-06', '2024-04-20'),
(7, 7, '2024-04-07', '2024-04-21'),
(8, 8, '2024-04-08', '2024-04-22'),
(9, 9, '2024-04-09', '2024-04-23'),
(10, 10, '2024-04-10', '2024-04-24'),
(11, 11, '2024-04-11', '2024-04-25'),
(12, 12, '2024-04-12', '2024-04-26'),
(13, 13, '2024-04-13', '2024-04-27'),
(14, 14, '2024-04-14', '2024-04-28'),
(15, 15, '2024-04-15', '2024-04-29');