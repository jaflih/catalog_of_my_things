CREATE DATABASE catalog;

CREATE TABLE Items(
  id INT PRIMARY KEY NOT NULL GENERATED ALWAYS AS IDENTITY,
  publish_date DATE,
  archived BOOLEAN,
  genre_id INT REFERENCES genres(id),
  author_id INT REFERENCES authors(id),
  label_id INT REFERENCES labels(id)
);

CREATE TABLE music_albums (
  on_spotify BOOLEAN
)INHERITS(items);

CREATE TABLE genres (
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(100),
  PRIMARY KEY(id)
);

CREATE TABLE books ( id INT PRIMARY KEY  GENERATED ALWAYS AS IDENTITY,
  publisher text,
  cover_state text,
  publish_date date,
  archived boolean
);

CREATE TABLE labels (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  title TEXT,
  color TEXT 
);

CREATE TABLE authors(
  id INT PRIMARY KEY NOT NULL GENERATED ALWAYS AS IDENTITY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

CREATE TABLE games(
  multiplayer BOOLEAN,
  last_played_at DATE
) INHERITS (Items);
