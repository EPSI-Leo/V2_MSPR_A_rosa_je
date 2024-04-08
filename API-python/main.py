from flask import Flask
from api.api_auth import api_auth


app = Flask(__name__)

# Enregistrer les blueprints d'API ici
app.register_blueprint(api_auth, url_prefix='/auth')

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
