DECLARE
    your_id INT := :Your_ID;
    user_id INT := :User_ID;
    your_name VARCHAR(255);
    user_name VARCHAR(255);
    like_type VARCHAR(255) := :Like_Type;
    is_accepted INT := 0;
    is_blocked INT := 0;
    swiped_on DATE := sysdate;
BEGIN
    INSERT INTO Swipes (
        swiped_by,
        swiped_to,
        swipe_type,
        is_accepted,
        is_blocked,
        swiped_on,
        blocked_on
    ) VALUES (
        your_id,
        user_id,
        like_type,
        is_accepted,
        is_blocked,
        swiped_on,
        NULL
    );
    SELECT first_name INTO user_name FROM Users WHERE id=user_id;
    SELECT first_name INTO your_name FROM Users WHERE id=your_id;
    dbms_output.put_line(your_name || ', you have ' || like_type || 'D ' || user_name || ' successfully!');
END;
/