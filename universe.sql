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
galaxy_id SERIAL REFERENCES galaxy(galaxy_id),
description TEXT
);

CREATE TABLE planet (
planet_id SERIAL PRIMARY KEY,
name VARCHAR(30) UNIQUE NOT NULL,
age int NOT NULL,
star_id SERIAL REFERENCES star(star_id),
description TEXT
);

CREATE TABLE moon (
moon_id SERIAL PRIMARY KEY,
name VARCHAR(30) UNIQUE NOT NULL,
age int NOT NULL,
planet_id SERIAL REFERENCES planet(planet_id),
description TEXT
);

CREATE TABLE secret (
secret_id SERIAL PRIMARY KEY,
name VARCHAR(30) UNIQUE NOT NULL,
age int NOT NULL,
moon_id SERIAL REFERENCES moon(moon_id),
description TEXT
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
('Phoenix', 16000, 3400, false);

INSERT INTO star(name, age, galaxy_id) VALUES
('Sun', 300, (SELECT galaxy_id FROM galaxy WHERE name = 'Milky Way')),
('Epsilon Virginis', 109, (SELECT galaxy_id FROM galaxy WHERE name = 'Virgo Stellar')),
('Sirius', 8, (SELECT galaxy_id FROM galaxy WHERE name = 'Canis Majoris')),
('Alpha Centauri', 4, (SELECT galaxy_id FROM galaxy WHERE name = 'Andromeda')),
('Alpha Centauri B', 4, (SELECT galaxy_id FROM galaxy WHERE name = 'Andromeda')),
('Aldebaran', 12, (SELECT galaxy_id FROM galaxy WHERE name = 'Phoenix')),
('Rigel', 12, (SELECT galaxy_id FROM galaxy WHERE name = 'Ursa Major'));

INSERT INTO planet(name, age, star_id) VALUES
('Earth', 300, (SELECT star_id FROM star WHERE name = 'Sun')),
('Mars', 300, (SELECT star_id FROM star WHERE name = 'Sun')),
('Venus', 300, (SELECT star_id FROM star WHERE name = 'Sun')),
('Mercury', 300, (SELECT star_id FROM star WHERE name = 'Sun')),
('Jupiter', 300, (SELECT star_id FROM star WHERE name = 'Sun')),
('Saturn', 300, (SELECT star_id FROM star WHERE name = 'Sun')),
('Uranus', 300, (SELECT star_id FROM star WHERE name = 'Sun')),
('Neptune', 300, (SELECT star_id FROM star WHERE name = 'Sun')),
('Pluto', 300, (SELECT star_id FROM star WHERE name = 'Sun')),
('Proxima Centauri b', 4, (SELECT star_id FROM star WHERE name = 'Alpha Centauri')),
('Proxima Centauri a', 4, (SELECT star_id FROM star WHERE name = 'Alpha Centauri')),
('Luyten b', 9, (SELECT star_id FROM star WHERE name = 'Alpha Centauri'));

INSERT INTO moon(name, age, planet_id) VALUES
('Moon', 3, (SELECT planet_id FROM planet WHERE name = 'Earth')),
('Phobos', 3, (SELECT planet_id FROM planet WHERE name = 'Mars')),
('Deimos', 3, (SELECT planet_id FROM planet WHERE name = 'Mars')),
('Io', 3, (SELECT planet_id FROM planet WHERE name = 'Jupiter')),
('Europa', 3, (SELECT planet_id FROM planet WHERE name = 'Jupiter')),
('Ganymede', 3, (SELECT planet_id FROM planet WHERE name = 'Jupiter')),
('Callisto', 3, (SELECT planet_id FROM planet WHERE name = 'Jupiter')),
('Titan', 3, (SELECT planet_id FROM planet WHERE name = 'Saturn')),
('Enceladus', 3, (SELECT planet_id FROM planet WHERE name = 'Saturn')),
('Mimas', 3, (SELECT planet_id FROM planet WHERE name = 'Saturn')),
('Tethys', 3, (SELECT planet_id FROM planet WHERE name = 'Saturn')),
('Dione', 3, (SELECT planet_id FROM planet WHERE name = 'Saturn')),
('Rhea', 3, (SELECT planet_id FROM planet WHERE name = 'Saturn')),
('Iapetus', 3, (SELECT planet_id FROM planet WHERE name = 'Saturn')),
('Miranda', 3, (SELECT planet_id FROM planet WHERE name = 'Uranus')),
('Ariel', 3, (SELECT planet_id FROM planet WHERE name = 'Uranus')),
('Umbriel', 3, (SELECT planet_id FROM planet WHERE name = 'Uranus')),
('Titania', 3, (SELECT planet_id FROM planet WHERE name = 'Uranus')),
('Oberon', 3, (SELECT planet_id FROM planet WHERE name = 'Uranus')),
('Triton', 3, (SELECT planet_id FROM planet WHERE name = 'Neptune')),
('Nereid', 3, (SELECT planet_id FROM planet WHERE name = 'Neptune')),
('Charon', 3, (SELECT planet_id FROM planet WHERE name = 'Pluto')),
('Nix', 3, (SELECT planet_id FROM planet WHERE name = 'Pluto')),
('Hydra', 3, (SELECT planet_id FROM planet WHERE name = 'Pluto')),
('Kerberos', 3, (SELECT planet_id FROM planet WHERE name = 'Pluto')),
('Styx', 3, (SELECT planet_id FROM planet WHERE name = 'Pluto')),
('Proxima b', 3, (SELECT planet_id FROM planet WHERE name = 'Proxima Centauri b')),
('Proxima a', 3, (SELECT planet_id FROM planet WHERE name = 'Proxima Centauri a')),
('Luyten b', 3, (SELECT planet_id FROM planet WHERE name = 'Luyten b'));
