import mysql.connector


class Config():

    def __init__(self):
        self.db = mysql.connector.connect(
            host="localhost",
            user="root",
            password="",
            database="arosaje2"
        )