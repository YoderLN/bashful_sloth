DROP TABLE IF EXISTS Pokemon;
DROP TABLE IF EXISTS Moves;
DROP TABLE IF EXISTS Types;

CREATE TABLE IF NOT EXISTS Types(
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    Type TEXT UNIQUE
);

CREATE TABLE IF NOT EXISTS Moves(
    ID INTEGER  PRIMARY KEY AUTOINCREMENT,
    MoveName TEXT UNIQUE NOT NULL,
    MoveType TEXT REFERENCES Types(Type),
    MovePower INT,
    Details TEXT
);

CREATE TABLE IF NOT EXISTS POKEMON(
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    Name TEXT UNIQUE,
    Type1 TEXT REFERENCES Types(Type) NOT NULL,
    Type2 TEXT REFERENCES Types(Type) NOT NULL,
    BaseHP INT,
    BaseAttack INT,
    BaseDefense INT,
    BaseSpecial INT,
    BaseSpeed INT
);

INSERT INTO Types(Type) VALUES('Normal'), 
('Fire'), 
('Water'), 
('Electric'), 
('Grass'), 
('Ice'), 
('Fighting'), 
('Poison'),
('Ground'),
('Flying'),
('Psychic'),
('Bug'),
('Rock'),
('Ghost'),
('Dragon');