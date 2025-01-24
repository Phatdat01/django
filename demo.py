import pymysql

# Connect to MariaDB
try:
    connection = pymysql.connect(
        host='localhost',  # e.g., 'localhost'
        user='root',
        password='12345',
        database='app'
    )

    # Create a cursor object
    cursor = connection.cursor()

    # Execute a query
    cursor.execute("SELECT * from handwatch;")
    rows = cursor.fetchall()
    for row in rows:
        print(row)
    # Fetch and print the result

except pymysql.MySQLError as e:
    print(f"Error: {e}")
finally:
    connection.close()
    print("Connection closed.")
