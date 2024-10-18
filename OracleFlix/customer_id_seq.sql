-- Drop sequence if it exists
BEGIN
    EXECUTE IMMEDIATE 'DROP SEQUENCE customer_id_seq';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -2289 THEN
            RAISE;
        END IF;
END;
/

-- Create sequence for CUSTOMER_ID
CREATE SEQUENCE customer_id_seq
    START WITH 101
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;