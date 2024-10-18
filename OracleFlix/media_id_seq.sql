-- Drop sequence if it exists
BEGIN
    EXECUTE IMMEDIATE 'DROP SEQUENCE media_id_seq';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -2289 THEN
            RAISE;
        END IF;
END;
/

-- Create sequence for MEDIA_ID
CREATE SEQUENCE media_id_seq
    START WITH 92
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;