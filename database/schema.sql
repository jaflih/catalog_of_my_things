CREATE TABLE Items(
      id INT PRIMARY KEY NOT NULL GENERATED ALWAYS AS IDENTITY,
      publish_date DATE,
      archived BOOLEAN,
      genre_id INT REFERENCES genres(id),
      author_id INT REFERENCES authors(id),
      label_id INT REFERENCES labels(id)
)

CREATE TABLE authors(
  id INT PRIMARY KEY NOT NULL GENERATED ALWAYS AS IDENTITY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

CREATE TABLE games(
  multiplayer BOOLEAN,
  last_played_at DATE
) INHERITS (Items);