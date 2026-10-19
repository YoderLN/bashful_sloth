import json

def query_by_name(cursor, name):
    cursor.execute(
        "SELECT * FROM POKEMON WHERE name = ? COLLATE NOCASE",
        (name,)
    )

    columns = [col[0] for col in cursor.description]
    rows = cursor.fetchall()
    results = [dict(zip(columns, row)) for row in rows]

    return json.dumps(results, indent=4, default=str)

def query_by_number(cursor, number):
    cursor.execute("SELECT * FROM POKEMON WHERE ID = ?", 
                   (number,)
    )
    columns = [col[0] for col in cursor.description]
    rows = cursor.fetchall()
    results = [dict(zip(columns, row)) for row in rows]
    
    return json.dumps(results, indent=4, default=str)