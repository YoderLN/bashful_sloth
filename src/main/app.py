from db_create import db_create
from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    return "Welcome to the Dex, stay tuned for more in depth options"

if __name__ == "__main__":
    db_create()
    app.run(debug=True)