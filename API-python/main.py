from flask import Flask
from api.api_auth import api_auth
from api.api_plants import api_plants
from api.api_advices import api_advices


app = Flask(__name__)

# Enregistrer les blueprints d'API ici
app.register_blueprint(api_auth, url_prefix='/auth')
app.register_blueprint(api_plants, url_prefix='/plants')
app.register_blueprint(api_advices, url_prefix='/advices')

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
