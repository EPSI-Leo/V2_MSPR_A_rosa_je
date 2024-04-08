from functools import wraps

from config.database import close_database_connection, get_database_connection
from flask import jsonify, request

# Middleware to check the token
def token_required(func):
    @wraps(func)
    def decorated(*args, **kwargs):
        token = None

        if 'Authorization' in request.headers:
            token = request.headers['Authorization'].split(' ')[1]

        if not token:
            return jsonify({'error': 'Token missing!'}), 401

        try:
            cursor, connection = get_database_connection()
            cursor.execute("SELECT id FROM users WHERE token_session = %s", (token,))
            user_uuid = cursor.fetchone()

            if not user_uuid:
                return jsonify({'error': 'Invalid token!'}), 401

            close_database_connection(cursor, connection)
        except Exception as e:
            return jsonify({'error': 'Database error: {}'.format(str(e))}), 500

        return func(*args, **kwargs)

    return decorated

