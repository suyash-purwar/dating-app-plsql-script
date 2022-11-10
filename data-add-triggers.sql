-- Responsible for automatically allocating id numbers to the user
CREATE SEQUENCE user_id_seq;

CREATE TRIGGER assign_user_id
BEFORE INSERT ON Users
FOR EACH ROW
BEGIN
SELECT user_id_seq.nextval
INTO :new.id
FROM dual;
END;

-- Responsible for automatically allocating id number to the Swipe
CREATE SEQUENCE swipe_id_seq;

CREATE TRIGGER assign_swipe_id
BEFORE INSERT ON Swipes
FOR EACH ROW
BEGIN
SELECT swipe_id_seq.nextval
INTO :new.id
FROM dual
END;