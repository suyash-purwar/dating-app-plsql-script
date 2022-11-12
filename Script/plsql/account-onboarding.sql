DECLARE
    fname VARCHAR(255);
    user_id INT := :ID_of_the_user;
    birthday DATE := :birthday;
    gender VARCHAR(255) := :gender;
    sexual_orientation VARCHAR(255) := :orientation;
    profile_preference VARCHAR(255) := :preference;
    age INT;
    location_latitude FLOAT;
    location_longitude FLOAT;
    distance_range INT := :drange;
    bio VARCHAR(255) := :bio;
    pronouns VARCHAR(255) := :pronouns;
BEGIN
    SELECT months_between(TRUNC(sysdate), to_date('2002-10-11','YYYY-MM-DD'))/12 INTO age FROM dual;
    location_latitude := 23.344223;
    location_longitude := -0.233434;
    INSERT INTO UserInfo (
        id,
        birthday,
        gender,
        sexual_orientation,
        show_profile_type,
        age,
        location_latitude,
        location_longitude,
        distance_range,
        bio,
        pronouns) VALUES (
        user_id,
        birthday, 
        gender,
        sexual_orientation,
        profile_preference,
        age,
        location_latitude,
        location_longitude,
        distance_range,
        bio,
        pronouns
    );
    SELECT first_name INTO fname FROM Users WHERE id=user_id;
    dbms_output.put_line(fname || ', your details and preferences are saved.');
END;
