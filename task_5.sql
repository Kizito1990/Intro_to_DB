#!/bin/bash
import mysql.connector


def insert_customer(database_name):
    # Database connection parameters
    connection = mysql.connector.connect(
        host='localhost',  # Replace with your MySQL host
        user='root',  # Replace with your MySQL username
        password='Azegba1234567890@',  # Replace with your MySQL password
        database=database_name
    )

    try:
        # Create a cursor object
        cursor = connection.cursor()

        # SQL query to insert a single row
        insert_query = """
        INSERT INTO customer (customer_id, customer_name, email, address)
        VALUES (%s, %s, %s, %s)
        """
        # Data to be inserted
        customer_data = (1, 'Cole Baidoo', 'cbaidoo@sandtech.com', '123 Happiness Ave.')

        # Execute the query
        cursor.execute(insert_query, customer_data)

        # Commit the transaction
        connection.commit()

        print("Customer inserted successfully.")

    except mysql.connector.Error as error:
        print(f"Error inserting customer: {error}")

    finally:
        # Close the cursor and connection
        cursor.close()
        connection.close()


insert_customer('alx_book_store')


