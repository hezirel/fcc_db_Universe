CREATE DATABASE universe;
\c universe

CREATE TABLE galaxy (
galaxy_id SERIAL PRIMARY KEY,
name VARCHAR(30) UNIQUE NOT NULL,
age int NOT NULL,
dist_from_earth int,
gravity numeric,
has_life bool,
sphere bool
);

CREATE TABLE star (
star_id SERIAL PRIMARY KEY,
name VARCHAR(30) UNIQUE NOT NULL,
age int NOT NULL,
galaxy VARCHAR(30) NOT NULL,
description TEXT,
CONSTRAINT fk_galaxy
    FOREIGN KEY(galaxy)
        REFERENCES galaxy(name)
);

CREATE TABLE planet (
planet_id SERIAL PRIMARY KEY,
name VARCHAR(30) UNIQUE NOT NULL,
age int NOT NULL,
star VARCHAR(30) NOT NULL,
description TEXT,
CONSTRAINT fk_star
    FOREIGN KEY(star)
        REFERENCES star(name)
);

CREATE TABLE moon (
moon_id SERIAL PRIMARY KEY,
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
('Virgo Stellar', 800, 300, false),
('Andromeda', 1000, 200, false),
('Triangulum', 1200, 400, false),
('Sagittarius', 1500, 500, false),
('Ursa Major', 2000, 600, false),
('Leo', 2500, 700, false),
('Hydra', 3000, 800, false),
('Cetus', 3500, 900, false),
('Pisces', 4000, 1000, false),
('Aquila', 4500, 1100, false),
('Cassiopeia', 5000, 1200, false),
('Phoenix', 16000, 3400, false),

INSERT INTO star(name, age, galaxy) VALUES
('Sun', 300, 'Milky Way'),
('Epsilon Virginis', 109,  'Virgo Stellar'),
('Sirius', 8, 'Canis Majoris');
('Alpha Centauri', 4, 'Andromeda'),
('Alpha Centauri B', 4, 'Andromeda'),
('Aldebaran', 12, 'Phoenix'),
('Rigel', 12, 'Ursa Major');

INSERT INTO planet(name, age, star) VALUES
('Earth', 300, 'Sun'),
('Mars', 300, 'Sun'),
('Venus', 300, 'Sun'),
('Mercury', 300, 'Sun'),
('Jupiter', 300, 'Sun'),
('Saturn', 300, 'Sun'),
('Uranus', 300, 'Sun'),
('Neptune', 300, 'Sun'),
('Pluto', 300, 'Sun'),
('Proxima Centauri b', 4, 'Alpha Centauri'),
('Proxima Centauri a', 4, 'Alpha Centauri'),
('Luyten b', 9, 'Aldebaran');

INSERT INTO moon(name, age, planet) VALUES
('Moon', 3, 'Earth'),
('Phobos', 3, 'Mars'),
('Deimos', 3, 'Mars'),
('Io', 3, 'Jupiter'),
('Europa', 3, 'Jupiter'),
('Ganymede', 3, 'Jupiter'),
('Callisto', 3, 'Jupiter'),
('Titan', 3, 'Saturn'),
('Enceladus', 3, 'Saturn'),
('Mimas', 3, 'Saturn'),
('Tethys', 3, 'Saturn'),
('Dione', 3, 'Saturn'),
('Rhea', 3, 'Saturn'),
('Iapetus', 3, 'Saturn'),
('Miranda', 3, 'Uranus'),
('Ariel', 3, 'Uranus'),
('Umbriel', 3, 'Uranus'),
('Titania', 3, 'Uranus'),
('Oberon', 3, 'Uranus'),
('Triton', 3, 'Neptune'),
('Nereid', 3, 'Neptune'),
('Charon', 3, 'Pluto'),
('Nix', 3, 'Pluto'),
('Hydra', 3, 'Pluto'),
('Kerberos', 3, 'Pluto'),
('Styx', 3, 'Pluto');
