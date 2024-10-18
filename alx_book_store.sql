#!bin/bash
import mysql.connector

connection = mysql.connector.connect(
    host = "localhost",
    user = "root",
    password = "Azegba1234567890@",
    database = "alx_book_store"
)

cursor = connection.cursor()

cursor.execute("""
CREATE TABLE IF NOT EXISTS Books (
  book_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(215) NOT NULL,
  author_id INT,
  price DOUBLE NOT NULL,
  publication_date DATE,
  FOREIGN KEY (author_id) REFERENCES Author(author_id)

)
""")

cursor.execute("""
CREATE TABLE IF NOT EXISTS Authors (
  author_id INT AUTO_INCREMENT PRIMARY KEY,
  author_name VARCHAR(215) NOT NULL

)
""")


cursor.execute("""
CREATE TABLE IF NOT EXISTS Customers(
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) UNIQUE NOT NULL,
    address TEXT
)
""")

cursor.execute("""
CREATE TABLE IF NOT EXISTS Orders(
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
)
""")

cursor.execute("""
CREATE TABLE IF NOT EXISTS Order_details(
    order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity DOUBLE,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
)
""")

