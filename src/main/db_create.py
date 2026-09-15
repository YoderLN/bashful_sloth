from pathlib import Path
import sqlite3



def db_create():

    base_dir = Path(__file__).resolve().parents[2]
    data_dir = base_dir / "src" / "data"
    database_path = data_dir / "pokedex.db"
    
    schema_path = data_dir / "schema.sql"
    conn = sqlite3.connect(database_path)
    cursor = conn.cursor()

    with sqlite3.connect(database_path) as conn:
        with open(schema_path, "r") as file:
            schema = file.read()

    conn.executescript(schema)
   