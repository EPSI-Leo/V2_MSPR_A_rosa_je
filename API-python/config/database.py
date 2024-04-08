from config.config import Config


def get_database_connection():
    config = Config()
    db = config.db

    return db.cursor(), db

def close_database_connection(cursor, connection):
    cursor.close()
    connection.close()
