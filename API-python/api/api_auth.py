from datetime import datetime

from flask import Blueprint, jsonify, request
from tools.jwt_token import generate_short_token

from config.database import (close_database_connection,
                                          get_database_connection)

api_auth = Blueprint('api_auth', __name__)

# Endpoint for user authentication
@api_auth.route('/login', methods=['POST'])
def login():
    try:
        data = request.get_json()
        username = data.get('username')
        password = data.get('password')

        # Establish a connection to the database
        cursor, connection = get_database_connection()

        # Authenticate the user
        user_id = authenticate_user(username, password)

        if user_id is not None:

            # Generate JWT tokens
            short_token = generate_short_token(user_id)

            if update_tokens_in_database(user_id, short_token, connection):
                # Close the database connection
                close_database_connection(cursor, connection)

                return jsonify({
                    "short_token": short_token
                }), 200
            else:
                close_database_connection(cursor, connection)
                return jsonify({"error": "Failed to update tokens in the database"}), 500

        else:
            # Close the database connection
            close_database_connection(cursor, connection)
            return jsonify({"error": "Authentication failed. Please check your credentials"}), 401

    except Exception as e:
        print("An error occurred while processing the request:", e)
        return jsonify({"error": str(e)}), 500

# Endpoint for user registration
@api_auth.route('/register', methods=['POST'])
def register():
    try:
        data = request.get_json()
        username = data.get('username')
        password = data.get('password')
        role = data.get('role')
        cgu = data.get('cgu')

        # Establish a connection to the database
        cursor, connection = get_database_connection()

        # Check if the user already exists
        query = "SELECT username FROM users WHERE username = %s"
        cursor.execute(query, (username,))
        existing_user = cursor.fetchone()

        if existing_user:
            close_database_connection(cursor, connection)
            print("This user already exists:", username)
            return jsonify({"error": "This user already exists."}), 400

        # Insert the new user into the database
        insert_query = ("INSERT INTO users (username, password, role, CGU) VALUES (%s, %s, %s, %s)")
        cursor.execute(insert_query, (username, password, role, cgu))
        connection.commit()

        close_database_connection(cursor, connection)

        return jsonify({"message": "User registered successfully."}), 201

    except Exception as e:
        print("An error occurred while registering the user:", e)
        return jsonify({"error": "An error occurred while registering the user."}), 500

def authenticate_user(username, password):
    try:
        cursor, connection = get_database_connection()

        query = ("SELECT id FROM users WHERE username = %s AND password = %s")
        cursor.execute(query, (username, password))
        user = cursor.fetchone()

        if user:
            return user[0]
        else:
            return None

    except Exception as e:
        print("Error occurred while authenticating the user:", e)
        return None

def update_tokens_in_database(user_id, short_token, connection):
    try:
        cursor = connection.cursor()

        update_query = ("UPDATE users SET token_session = %s WHERE id = %s")
        cursor.execute(update_query, (short_token, user_id))

        connection.commit()

        close_database_connection(cursor, connection)

        return True
    except Exception as e:
        print("Error occurred while updating tokens in the database:", e)
        return False

