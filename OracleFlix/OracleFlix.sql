-- Drop tables if they exist
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE STAR_BILLING CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE RENTAL_HISTORY CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE MEDIA CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE ACTORS CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE MOVIES CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE CUSTOMERS CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;
/

-- Create tables
CREATE TABLE CUSTOMERS (
    customer_id NUMBER(10) NOT NULL,
    last_name VARCHAR2(25 CHAR) NOT NULL,
    first_name VARCHAR2(25 CHAR) NOT NULL,
    home_phone VARCHAR2(12 CHAR) NOT NULL,
    address VARCHAR2(100 CHAR) NOT NULL,
    city VARCHAR2(30 CHAR) NOT NULL,
    state VARCHAR2(2 CHAR) NOT NULL,
    email VARCHAR2(25 CHAR),
    cell_phone VARCHAR2(12 CHAR),
    CONSTRAINT customers_pk PRIMARY KEY (customer_id)
);

CREATE TABLE MOVIES (
    title_id NUMBER(10) NOT NULL,
    title VARCHAR2(60 CHAR) NOT NULL,
    description VARCHAR2(400 CHAR) NOT NULL,
    rating VARCHAR2(4 CHAR) NOT NULL,
    category VARCHAR2(20 CHAR) NOT NULL,
    release_date DATE NOT NULL,
    CONSTRAINT movies_pk PRIMARY KEY (title_id),
    CONSTRAINT movies_rating_chk CHECK (rating IN ('G', 'PG', 'R', 'PG13')),
    CONSTRAINT movies_category_chk CHECK (category IN ('DRAMA', 'COMEDY', 'ACTION', 'CHILD', 'SCIFI', 'DOCUMENTRY'))
);

CREATE TABLE MEDIA (
    media_id NUMBER(10) NOT NULL,
    format VARCHAR2(3 CHAR) NOT NULL,
    title_id NUMBER(10) NOT NULL,
    CONSTRAINT media_pk PRIMARY KEY (media_id),
    CONSTRAINT media_title_id_fk FOREIGN KEY (title_id) REFERENCES MOVIES (title_id)
);

CREATE TABLE RENTAL_HISTORY (
    media_id NUMBER(10) NOT NULL,
    rental_date DATE NOT NULL,
    customer_id NUMBER(10),
    return_date DATE,
    CONSTRAINT rental_history_pk PRIMARY KEY (media_id, rental_date),
    CONSTRAINT rental_history_media_id_fk FOREIGN KEY (media_id) REFERENCES MEDIA (media_id),
    CONSTRAINT rental_history_customer_id_fk FOREIGN KEY (customer_id) REFERENCES CUSTOMERS (customer_id)
);

CREATE TABLE ACTORS (
    actor_id NUMBER(10) NOT NULL,
    stage_name VARCHAR2(40 CHAR) NOT NULL,
    first_name VARCHAR2(25 CHAR) NOT NULL,
    last_name VARCHAR2(25 CHAR) NOT NULL,
    birth_date DATE NOT NULL,
    CONSTRAINT actors_pk PRIMARY KEY (actor_id)
);

CREATE TABLE STAR_BILLING (
    actor_id NUMBER(10) NOT NULL,
    title_id NUMBER(10) NOT NULL,
    comments VARCHAR2(40 CHAR),
    CONSTRAINT star_billing_pk PRIMARY KEY (actor_id, title_id),
    CONSTRAINT star_billing_actor_id_fk FOREIGN KEY (actor_id) REFERENCES ACTORS (actor_id),
    CONSTRAINT star_billing_title_id_fk FOREIGN KEY (title_id) REFERENCES MOVIES (title_id)
);