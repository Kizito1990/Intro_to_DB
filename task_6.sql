
import mysql.connector

def insert_customers(db_name):
    try:
        # Connect to the MySQL server
        connection = mysql.connector.connect(
            host='localhost',        # Change if your MySQL server is hosted elsewhere
            user= 'root',    # Replace with your MySQL username
            password='Azegba1234567890@',# Replace with your MySQL password
            database=db_name
        )

        cursor = connection.cursor()

        # Define the SQL INSERT statement
        sql = """
        INSERT INTO customer (customer_id, customer_name, email, address)
        VALUES (%s, %s, %s, %s)
        """

        # Data to be inserted
        val = [
            (2, 'Blessing Malik', 'bmalik@sandtech.com', '124 Happiness  Ave.'),
            (3, 'Obed Ehoneah', 'eobed@sandtech.com', '125 Happiness  Ave.'),
            (4, 'Nehemial Kamolu', 'nkamolu@sandtech.com', '126 Happiness  Ave.')
        ]

        # Execute the insert query for each row
        cursor.executemany(sql, val)

        # Commit the transaction
        connection.commit()

        print(f"{cursor.rowcount} rows inserted successfully into the customer table.")

    except mysql.connector.Error as err:
        
        print(f"Error: {err}")
    finally:
        if connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed.")

# Example usage
insert_customers('alx_book_store')

