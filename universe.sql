-- Create the database
CREATE DATABASE universe;
\c universe;

-- Create the galaxy table
CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    type VARCHAR(255),
    size NUMERIC,
    has_black_hole BOOLEAN
);

-- Insert data into the galaxy table
INSERT INTO galaxy (name, type, size, has_black_hole) VALUES
    ('Milky Way', 'Spiral', 100000, true),
    ('Andromeda', 'Spiral', 120000, false),
    ('Triangulum', 'Irregular', 15000, false),
    ('Sombrero', 'Spiral', 20000, false),
    ('Whirlpool', 'Spiral', 30000, false),
    ('Centaurus A', 'Elliptical', 22000, true);

-- Create the star table with a foreign key referencing galaxy
CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    type VARCHAR(255),
    temperature INT,
    is_visible BOOLEAN,
    galaxy_id INT REFERENCES galaxy(galaxy_id)
);

-- Insert data into the star table
INSERT INTO star (name, type, temperature, is_visible, galaxy_id) VALUES
    ('Sun', 'G-type', 5778, true, 1),
    ('Sirius', 'A-type', 9940, true, 1),
    ('Alpha Centauri A', 'G-type', 5790, true, 6),
    ('Betelgeuse', 'M-type', 3500, true, 2),
    ('Vega', 'A-type', 9602, true, 1),
    ('Antares', 'M-type', 3600, true, 5);

-- Create the planet table with a foreign key referencing star
CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    type VARCHAR(255),
    distance_from_star INT,
    has_water BOOLEAN,
    star_id INT REFERENCES star(star_id)
);

-- Insert data into the planet table
INSERT INTO planet (name, type, distance_from_star, has_water, star_id) VALUES
    ('Earth', 'Terrestrial', 93, true, 1),
    ('Mars', 'Terrestrial', 142, false, 1),
    ('Jupiter', 'Gas Giant', 484, true, 2),
    ('Saturn', 'Gas Giant', 886, true, 2),
    ('Neptune', 'Ice Giant', 4495, true, 5),
    ('Gliese 581g', 'Terrestrial', 20, true, 3),
    ('Proxima Centauri b', 'Terrestrial', 0.04, true, 6),
    ('HD 209458 b', 'Hot Jupiter', 0.0475, false, 4),
    ('55 Cancri e', 'Super-Earth', 0.0158, false, 1),
    ('Kepler-22b', 'Super-Earth', 0.85, true, 1),
    ('WASP-121b', 'Hot Jupiter', 0.025, false, 2),
    ('TRAPPIST-1d', 'Terrestrial', 0.028, true, 3),
    ('GJ 1214 b', 'Mini-Neptune', 0.014, true, 3),
    ('Kepler-442b', 'Super-Earth', 0.295, true, 5),
    ('OGLE-2005-BLG-390Lb', 'Super-Earth', 1.68, false, 4);

-- Create the moon table with a foreign key referencing planet
CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    type VARCHAR(255),
    distance_from_planet INT,
    is_inhabited BOOLEAN,
    planet_id INT REFERENCES planet(planet_id)
);

-- Insert data into the moon table
INSERT INTO moon (name, type, distance_from_planet, is_inhabited, planet_id) VALUES
    ('Luna', 'Rocky', 384, false, 1),
    ('Phobos', 'Rocky', 9, false, 2),
    ('Europa', 'Icy', 671, false, 3),
    ('Titan', 'Thick Atmosphere', 1221, false, 4),
    ('Triton', 'Cold', 354, false, 5),
    ('Charon', 'Icy', 19591, false, 6),
    ('Ganymede', 'Icy', 1070, false, 3),
    ('Enceladus', 'Icy', 238, false, 4),
    ('Deimos', 'Rocky', 23, false, 2),
    ('Io', 'Volcanic', 422, false, 3),
    ('Callisto', 'Icy', 1883, false, 4),
    ('Oberon', 'Icy', 584, false, 5),
    ('Rhea', 'Rocky', 527, false, 4),
    ('Dione', 'Icy', 377, false, 4),
    ('Miranda', 'Rocky', 129, false, 5),
    ('Ariel', 'Icy', 191, false, 5),
    ('Umbriel', 'Icy', 266, false, 5),
    ('Iapetus', 'Rocky', 3561, false, 4),
    ('Hyperion', 'Irregular', 1481, false, 4),
    ('Titania', 'Icy', 435, false, 5),
    ('Larissa', 'Rocky', 73, false, 3);

-- Verify the structure and data in the tables
SELECT * FROM galaxy;
SELECT * FROM star;
SELECT * FROM planet;
SELECT * FROM moon;
