#!bin/bash
from logging import exception, error

import mysql.connector



def my_connection():
    try:
        connect = mysql.connector.connect(
            host="localhost",
            user="root",
            password="Azegba1234567890@",

        )
        cursor = connect.cursor()

        cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
        if connect.is_connected():
            print("Database connected")
    except mysql.connector.Error as e:
        print("Database connection failed", e)

    else:
        print("Database 'alx_book_store' created successfully!")
        connect.close()

my_connection()


