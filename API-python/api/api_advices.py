from config.database import close_database_connection, get_database_connection
from flask import Blueprint, jsonify, request
from tools.middleware import token_required
from tools.token_to_uuid import token_to_uuid

api_advice = Blueprint('api_advice', __name__)

@api_advice.route('/add_advice', methods=['POST'])
@token_required
def add_advice():
    try:
        token = request.headers.get('Authorization')
        id_user = token_to_uuid(token)

        data = request.get_json()
        query = ("INSERT INTO advices (id_user, id_plant, name, advice) VALUES (%s, %s, %s, %s)")
        values = (id_user, data['id_plant'], data['name'], data['advice'])

        cursor, connection = get_database_connection()
        cursor.execute(query, values)
        connection.commit()

        close_database_connection(cursor, connection)

        return jsonify({"message": "Advice added successfully"}), 200

    except Exception as err:
        return jsonify({"error": str(err)}), 500

@api_advice.route('/delete_advice', methods=['DELETE'])
@token_required
def delete_advice():
    try:
        data = request.get_json()

        if 'advice_id' not in data:
            return jsonify({"error": "Advice ID missing"}), 400

        advice_id = data['advice_id']

        query = 'DELETE FROM advices WHERE id=%s;'

        cursor, connection = get_database_connection()
        cursor.execute(query, (advice_id,))
        connection.commit()

        close_database_connection(cursor, connection)

        return jsonify({"message": "Advice deleted successfully"}), 200

    except Exception as err:
        return jsonify({"error": str(err)}), 500
@api_advice.route('/get_advices', methods=['GET'])
@token_required
def get_advices():
    try:
        token = request.headers.get('Authorization')
        id_user = token_to_uuid(token)

        query = 'SELECT * FROM advices;'

        cursor, connection = get_database_connection()
        cursor.execute(query, (id_user,))
        results = cursor.fetchall()

        close_database_connection(cursor, connection)

        advices = []
        for result in results:
            advice = {
                "id": result[0],
                "id_plant": result[2],
                "name": result[3],
                "advice": result[4]
            }
            advices.append(advice)

        if advices:
            return jsonify({"totalItems": len(advices), "items": advices}), 200
        else:
            return jsonify({"message": "No advices found for this user"}), 404

    except Exception as err:
        return jsonify({"error": str(err)}), 500


@api_advice.route('/get_plant', methods=['GET'])
@token_required
def get_plant():
    try:
        token = request.headers.get('Authorization')
        id_user = token_to_uuid(token)

        query = 'SELECT * FROM plants WHERE id_user=%s;'

        cursor, connection = get_database_connection()
        cursor.execute(query, (id_user,))
        results = cursor.fetchall()

        close_database_connection(cursor, connection)

        plants = []
        for result in results:
            plant = {
                "id": result[0],
                "name": result[2],
                "beginAt": result[3],
                "endAt": result[4],
                "description": result[5],
                "picture": result[6],
                "latitude": result[7],
                "longitude": result[8]
            }
            plants.append(plant)

        if plants:
            return jsonify({"totalItems": len(plants), "items": plants}), 200
        else:
            return jsonify({"message": "No plants found for this user"}), 404

    except Exception as err:
        return jsonify({"error": str(err)}), 500
