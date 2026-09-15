from pathlib import Path
import sqlite3



def db_create():

    base_dir = Path(__file__).resolve().parents[2]
    data_dir = base_dir / "src" / "data"
    database_path = data_dir / "pokedex.db"

    conn = sqlite3.connect(database_path)
    cursor = conn.cursor()

    cursor.execute("""
    CREATE TABLE IF NOT EXISTS Types(
        TypeNumber INTEGER PRIMARY KEY,
        Type TEXT UNIQUE
    )
    """)


    cursor.execute("""
    CREATE TABLE IF NOT EXISTS Moves(
        MoveID INT AUTO_INCREMENT PRIMARY KEY,
        MoveName TEXT,
        MoveType TEXT REFERENCES Types(Type),
        Description TEXT)
    """)

    cursor.execute("""
    CREATE TABLE IF NOT EXISTS Pokemon(
        ID INT PRIMARY KEY,
        Name TEXT,
        Type1 TEXT REFERENCES Types(Type) NOT NULL,
        Type2 TEXT REFERENCES Types(Type),
        BaseHP INT,
        BaseAttack INT,
        BaseDefense INT,
        BaseSpecial INT,
        BaseSpeed INT
    )
    """)

    conn.commit()
    conn.close()