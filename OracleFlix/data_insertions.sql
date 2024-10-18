-- Insert into CUSTOMERS
INSERT INTO CUSTOMERS (customer_id, last_name, first_name, home_phone, address, city, state, email, cell_phone)
VALUES (customer_id_seq.NEXTVAL, 'Doe', 'John', '123-456-7890', '123 Elm St', 'Springfield', 'IL', 'john.doe@example.com', '098-765-4321');

INSERT INTO CUSTOMERS (customer_id, last_name, first_name, home_phone, address, city, state, email, cell_phone)
VALUES (customer_id_seq.NEXTVAL, 'Smith', 'Jane', '234-567-8901', '456 Oak St', 'Springfield', 'IL', 'jane.smith@example.com', '987-654-3210');

-- Insert into MOVIES
INSERT INTO MOVIES (title_id, title, description, rating, category, release_date)
VALUES (title_id_seq.NEXTVAL, 'The Great Adventure', 'An epic journey across the world.', 'PG', 'ACTION', TO_DATE('2023-05-15', 'YYYY-MM-DD'));

INSERT INTO MOVIES (title_id, title, description, rating, category, release_date)
VALUES (title_id_seq.NEXTVAL, 'Comedy Night', 'A hilarious night of stand-up comedy.', 'PG13', 'COMEDY', TO_DATE('2022-11-20', 'YYYY-MM-DD'));

-- Insert into MEDIA
INSERT INTO MEDIA (media_id, format, title_id)
VALUES (media_id_seq.NEXTVAL, 'DVD', 1);

INSERT INTO MEDIA (media_id, format, title_id)
VALUES (media_id_seq.NEXTVAL, 'Blu-ray', 2);

-- Insert into ACTORS
INSERT INTO ACTORS (actor_id, stage_name, first_name, last_name, birth_date)
VALUES (actor_id_seq.NEXTVAL, 'Johnny D', 'John', 'Doe', TO_DATE('1980-01-01', 'YYYY-MM-DD'));

INSERT INTO ACTORS (actor_id, stage_name, first_name, last_name, birth_date)
VALUES (actor_id_seq.NEXTVAL, 'Jane S', 'Jane', 'Smith', TO_DATE('1990-02-02', 'YYYY-MM-DD'));