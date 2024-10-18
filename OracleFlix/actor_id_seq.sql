-- Drop sequence if it exists
BEGIN
    EXECUTE IMMEDIATE 'DROP SEQUENCE actor_id_seq';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -2289 THEN
            RAISE;
        END IF;
END;
/

-- Create sequence for ACTOR_ID
CREATE SEQUENCE actor_id_seq
    START WITH 1001
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;