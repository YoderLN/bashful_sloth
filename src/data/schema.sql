DROP TABLE IF EXISTS Pokemon;
DROP TABLE IF EXISTS Moves;
DROP TABLE IF EXISTS Types;
DROP TABLE IF EXISTS AttackEffectiveness;

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

CREATE TABLE IF NOT EXISTS AttackEffectiveness(
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    Type TEXT REFERENCES Types(Type) UNIQUE NOT NULL,
    Normal FLOAT,
    Fire FLOAT,
    Water FLOAT,
    Electric FLOAT,
    Grass FLOAT,
    Ice FLOAT,
    Fighting FLOAT,
    Poison FLOAT,
    Ground FLOAT,
    Flying FLOAT,
    Psychic FLOAT,
    Bug FLOAT,
    Rock FLOAT,
    Ghost FLOAT,
    Dragon FLOAT
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

INSERT INTO AttackEffectiveness (Type, Normal, Fire, Water, Electric, Grass, ice, Fighting, 
Poison, Ground, Flying, Psychic, Bug, Rock, Ghost, Dragon) VALUES 
('Normal', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, .5, 0, 1),
('Fire', 1, .5, .5, 1, 2, 2, 1, 1, 1, 1, 1, 2, .5, 1, .5),
('Water', 1, 2, .5, 1, .5, 1, 1, 1, 2, 1, 1, 1, 2, 1, .5)




;