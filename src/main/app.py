from db_create import db_create
from flask import Flask
from db_queries import query_by_name, query_by_number

app = Flask(__name__)

@app.route("/")
def home():
    return "Welcome to the Dex, stay tuned for more in depth options." \
    " /pokemon/name gets results based on pokemon name"

@app.route("/pokemon_by_name/<name>")
def show_pokemonInfoByName(name):
    cursor = db_create()
    try:
        return query_by_name(cursor, name)
    finally:
        cursor.close()

@app.route("/pokemon_by_number/<number>")
def show_pokemonInfoByNumber(number):
    cursor = db_create()
    try:
        return query_by_number(cursor, number)
    finally:
        cursor.close()


if __name__ == "__main__":
    app.run(debug=True)