import base64
from config.database import close_database_connection, get_database_connection
from flask import Blueprint, jsonify, request
from tools.middleware import token_required
from tools.token_to_uuid import token_to_uuid

api_plants = Blueprint('api_plants', __name__)

# Endpoint to add data to the database
@api_plants.route('/add_plant', methods=['POST'])
@token_required
def add_plant():
    try:
        token = request.headers.get('Authorization')
        id_user = token_to_uuid(token)

        data = request.get_json()
        query = ("INSERT INTO plants (id_user, name, beginAt, endAt, description, picture, latitude, longitude) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)")
        values = (id_user, data['name'], data['beginAt'], data['endAt'], data['description'], data['picture'], data['latitude'], data['longitude'])

        cursor, connection = get_database_connection()
        cursor.execute(query, values)
        connection.commit()

        close_database_connection(cursor, connection)

        return jsonify({"message": "Plant added successfully"}), 200

    except Exception as err:
        return jsonify({"error": str(err)}), 500


# Endpoint to delete a feedback from the database
@api_plants.route('/delete_plant', methods=['DELETE'])
@token_required
def delete_plant():
    try:
        data = request.get_json()

        if 'plant_id' not in data:
            return jsonify({"error": "Plant ID missing"}), 400

        plant_id = data['plant_id']

        query = 'DELETE FROM plants WHERE id=%s;'

        cursor, connection = get_database_connection()
        cursor.execute(query, (plant_id,))
        connection.commit()

        close_database_connection(cursor, connection)

        return jsonify({"message": "Plant deleted successfully"}), 200

    except Exception as err:
        return jsonify({"error": str(err)}), 500

@api_plants.route('/get_plant', methods=['GET'])
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

@api_plants.route('/get_plants', methods=['GET'])
@token_required
def get_plants():
    try:
        token = request.headers.get('Authorization')
        id_user = token_to_uuid(token)

        query = 'SELECT * FROM plants;'

        cursor, connection = get_database_connection()
        cursor.execute(query)
        results = cursor.fetchall()

        close_database_connection(cursor, connection)

        plants = []
        for result in results:
            picture_base64 = base64.b64encode(result[6]).decode('utf-8')

            plant = {
                "id": result[0],
                "name": result[2],
                "beginAt": result[3],
                "endAt": result[4],
                "description": result[5],
                "picture": picture_base64,
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
