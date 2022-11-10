-- Responsible for automatically allocating id numbers to the user
CREATE TRIGGER assign_user_id
BEFORE INSERT ON Users
FOR EACH ROW
BEGIN
SELECT user_id_seq.nextval
INTO :new.id
FROM dual;
END;
