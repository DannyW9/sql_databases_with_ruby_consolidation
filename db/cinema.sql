DROP TABLE tickets;
DROP TABLE screenings;
DROP TABLE films;
DROP TABLE customers;

CREATE TABLE films (
  id SERIAL PRIMARY KEY,
  title VARCHAR, --UNIQUE, --made unique for screenings to reference (should only have one entry per film anyway)
  price INT
);

CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  name VARCHAR,
  funds INT
);

CREATE TABLE screenings (
  id SERIAL PRIMARY KEY,
  showing_time VARCHAR,
  film_title VARCHAR, --REFERENCES films(title) ON DELETE CASCADE
  max_allocation INT
);

CREATE TABLE tickets (
  id SERIAL PRIMARY KEY,
  customer_id INT REFERENCES customers(id) ON DELETE CASCADE,
  film_id INT REFERENCES films(id) ON DELETE CASCADE,
  screening_id INT REFERENCES screenings(id) ON DELETE CASCADE
);
