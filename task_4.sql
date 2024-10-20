import mysql.connector

def print_books_table_description(db_name):
    try:
        # Connect to the MySQL server
        connection = mysql.connector.connect(
            host='localhost',        
            user='root',    
            password='Azegba1234567890@',
            database=db_name
        )

        cursor = connection.cursor()

        # Query to get the description of the books table
        sql = """
        SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH, IS_NULLABLE, COLUMN_KEY, COLUMN_DEFAULT
        FROM "INFORMATION_SCHEMA.COLUMNS", "COLUMN_NAME", "COLUMN_TYPE", "TABLE_SCHEMA = 'alx_book_store'", "TABLE_NAME = 'Books'"
        """

        # Execute the query
        cursor.execute(sql, (db_name,))

        # Fetch and display the results
        columns = cursor.fetchall()
        for column in columns:
            print(column)

    except mysql.connector.Error as err:
        print(f"Error: {err}")
    finally:
        if connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed.")

# Example usage
print_books_table_description('alx_book_store')

