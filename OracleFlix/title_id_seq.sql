-- Drop sequence if it exists
BEGIN
    EXECUTE IMMEDIATE 'DROP SEQUENCE title_id_seq';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -2289 THEN
            RAISE;
        END IF;
END;
/

-- Create sequence for TITLE_ID
CREATE SEQUENCE title_id_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;