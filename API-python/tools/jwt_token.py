from datetime import datetime, timedelta

import jwt
from jwt import encode

SECRET_KEY = "ma_cle_secrete_pour_le_debogage" #TODO mettre dans config

def generate_short_token(user_id):
    short_token_payload = {
        'user_id': user_id,
        'exp': datetime.utcnow() + timedelta(days=1),
        'custom_data': {'test': 'test'}
    }
    short_token = jwt.encode(short_token_payload, SECRET_KEY, algorithm='HS256')
    return short_token
