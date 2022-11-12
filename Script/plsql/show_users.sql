DECLARE
    user_id INT := :Your_ID;
    user_age UserInfo.age%TYPE;
    preference UserInfo.show_profile_type%TYPE;

    CURSOR cur_user IS
        SELECT
            Users.id,
            first_name,
            middle_name,
            last_name,
            age,
            bio,
            pronouns,
            location_latitude,
            location_longitude
        FROM UserInfo
        JOIN Users ON Users.id = UserInfo.id
        WHERE age > user_age-5 AND user_age+5 > age
        AND gender = preference;

        v_user cur_user%ROWTYPE;
BEGIN
    SELECT age INTO user_age FROM UserInfo WHERE id=user_id;
    SELECT show_profile_type INTO preference FROM UserInfo WHERE id=user_id;

    OPEN cur_user;
    LOOP
        FETCH cur_user INTO v_user;
        EXIT WHEN cur_user%NOTFOUND;
        dbms_output.put_line('------------------------------------------');
        dbms_output.put_line('ID: ' || v_user.id);
        dbms_output.put_line('Full Name: ' || v_user.first_name || ' ' || v_user.middle_name || ' ' || v_user.last_name);
        dbms_output.put_line('Pronouns: ' || v_user.pronouns);
        dbms_output.put_line('Age: ' || v_user.age);
        dbms_output.put_line('Bio: ' || v_user.bio);
        dbms_output.put_line('------------------------------------------');
    END LOOP;
    CLOSE cur_user;
END;
/