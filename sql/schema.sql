CREATE TABLE author (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    first_name VARCHAR,
    last_name VARCHAR
);


CREATE TABLE source (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    name VARCHAR,
);

CREATE TABLE book(
  id SERIAL PRIMARY KEY,
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL,
  publisher VARCHAR(30) NOT NULL,
  cover_state VARCHAR(10) NOT NULL,
  label_id INT,
  author_id INT,
  genre_id INT,
  FOREIGN KEY (label_id) REFERENCES label(id),
  FOREIGN KEY (author_id) REFERENCES author(id),
  FOREIGN KEY(genre_id) REFERENCES genre(id)
);

CREATE TABLE label(
  id SERIAL PRIMARY KEY,
  name VARCHAR(30)
);

CREATE TABLE game(
  id SERIAL PRIMARY KEY,
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL,
  publisher VARCHAR(30) NOT NULL,
  cover_state VARCHAR(10) NOT NULL,
  label_id INT,
  author_id INT,
  genre_id INT,
  FOREIGN KEY (label_id) REFERENCES label(id),
  FOREIGN KEY (author_id) REFERENCES author(id),
  FOREIGN KEY(genre_id) REFERENCES genre(id)
);

CREATE TABLE author(
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(30),
  last_name VARCHAR(30)
);

CREATE TABLE music_albums (
    id INT GENERATED ALWAYS AS IDENTITY,
    publish_date DATE,
    archived BOOLEAN,
    on_spotify BOOLEAN,
    genre_id INT,
    ADD CONSTRAINT fk_genre_id FOREIGN KEY (genre_id) REFERENCES genres (id);
    PRIMARY KEY(id)
);

CREATE TABLE genres (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(250),
    PRIMARY KEY(id)
);
