#!bin/bash
import mysql.connector



connection = mysql.connector.connect(
    host = "localhost",
    user = "root",
    passwd = "Azegba1234567890@",

)

cursor = connection.cursor()
USE alx_book_store;
cursor.execute("""
CREATE TABLE IF NOT EXISTS customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL
)
""")

sql = "INSERT INTO TABLE customer(customer_id,customer_name, email, address ) VALUES (%s,%s, %s, )"
val = (1, "Cole Baidoo", "cbaidoo@sandtech.com", "123 Happiness Ave.")

cursor.execute(sql, val)

connection.commit()

connection.close()
cursor.close()

