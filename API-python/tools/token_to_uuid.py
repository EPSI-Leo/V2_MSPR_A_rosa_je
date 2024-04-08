from config.database import close_database_connection, get_database_connection
from flask import Blueprint, jsonify, request
from tools.middleware import token_required


def token_to_uuid(token):
    try:
        token = token.split(' ')[1]
        cursor, connection = get_database_connection()
        cursor.execute("SELECT id FROM users WHERE token_session = %s", (token,))
        user_uuid = cursor.fetchone()

        if not user_uuid:

            return jsonify({'error': 'Invalid token!'}), 401

        user_uuid = user_uuid[0]

        close_database_connection(cursor, connection)


        return user_uuid
    except Exception as e:

        return jsonify({'error': 'Database error: {}'.format(str(e))}), 500
