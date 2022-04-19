CREATE TABLE authors(
  id INT PRIMARY KEY NOT NULL GENERATED ALWAYS AS IDENTITY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

CREATE TABLE games(
  multiplayer BOOLEAN,
  last_played_at DATE
) INHERITS (Items);