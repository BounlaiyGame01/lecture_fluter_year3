import pymysql
from pymysql.cursors import DictCursor

def getConnect():
    # Database connection parameters
    try:
        database = pymysql.connect(
            host = 'localhost',
            user = 'root',
            password = '12345678',
            database = 'pythonlecture3',
            cursorclass=DictCursor
        )
        return database
    except pymysql.MySQLError as e:
        print(f"Error connecting to the database: {e}")
        return None