#!bin/bash
import mysql.connector

connection = mysql.connector.connect(
    host = "localhost",
    user = "root",
    passwd = "Azegba1234567890@",
    database = "alx_book_store"
)

cursor = connection.cursor()

cursor.execute("SHOW TABLES")

result = cursor.fetchall()
for row in result:
    print(row)

connection.close()
cursor.close()

