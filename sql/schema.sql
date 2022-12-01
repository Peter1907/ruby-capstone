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
