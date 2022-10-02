CREATE DATABASE universe;
\c universe

CREATE TABLE galaxy (
id SERIAL,
name VARCHAR(30) UNIQUE NOT NULL PRIMARY KEY,
age int NOT NULL,
dist_from_earth int,
gravity numeric,
has_life bool,
sphere bool
);

CREATE TABLE star (
id SERIAL PRIMARY KEY,
name VARCHAR(30) UNIQUE NOT NULL,
age int NOT NULL,
galaxy VARCHAR(30) NOT NULL,
description TEXT,
CONSTRAINT fk_galaxy
    FOREIGN KEY(galaxy)
        REFERENCES galaxy(name)
);

CREATE TABLE planet (
id SERIAL PRIMARY KEY,
name VARCHAR(30) UNIQUE NOT NULL,
age int NOT NULL,
star VARCHAR(30) NOT NULL,
description TEXT,
CONSTRAINT fk_star
    FOREIGN KEY(star)
        REFERENCES star(name)
);

CREATE TABLE moon (
id SERIAL PRIMARY KEY,
name VARCHAR(30) UNIQUE NOT NULL,
age int NOT NULL,
planet VARCHAR(30) NOT NULL,
description TEXT,
CONSTRAINT fk_planet
    FOREIGN KEY(planet)
        REFERENCES planet(name)
);

INSERT INTO galaxy(name, age, dist_from_earth, has_life) VALUES
('Milky Way', 320, 0, true),
('Canis Majoris', 500, 102, false),
('Virgo Stellar', 800, 300, false);

INSERT INTO star(name, age, galaxy) VALUES
('Sun', 300, 'Milky Way'),
('Epsilon Virginis', 109,  'Virgo Stellar'),
('Sirius', 8, 'Canis Majoris');
