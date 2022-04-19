CREATE DATABASE catalog;
CREATE TABLE music_albums (
  id INT,
  /* name VARCHAR(100),*/
  on_spotify BOOLEAN,
  FOREIGN KEY(id) REFERENCES item(id)
);