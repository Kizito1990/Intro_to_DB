#!bin/bash
import mysql.connector



connection = mysql.connector.connect(
    host = "localhost",
    user = "root",
    passwd = "Azegba1234567890@",
    database = "alx_book_store"
)
cursor = connection.cursor()
sql = "INSERT INTO TABLE customer(customer_id,customer_name, email, address ) VALUES (%s,%s,%s)"
val = ( "Cole Baidoo", "cbaidoo@sandtech.com", "123 Happiness Ave.")

cursor.execute(sql, val)

connection.commit()

connection.close()
cursor.close()


