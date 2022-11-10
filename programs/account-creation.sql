DECLARE
    first_name VARCHAR(255) := :First_Name;
    middle_name VARCHAR(255) := :Middle_Name;
    last_name VARCHAR(255) := :Last_Name;
    phone_no VARCHAR(255) := :Phone_No;
    email_id VARCHAR(255) := :Email_Id;
    otp INT(6);
    otp_exp_time DATE;
BEGIN
    otp := 239202;
    otp_exp_time := sysdate;
    INSERT INTO Users(
        first_name,
        middle_name,
        last_name, phone,
        email_id,
        access_token,
        refresh_token,
        otp,
        otp_exp_time
    ) VALUES (
        first_name,
        middle_name,
        last_name,
        phone_no,
        email_id,
        'a#4rd5gi!gh9jkh7#',
        'fh#6ytf6$6fgf%gd@G',
        otp,
    otp_exp_time);
    dbms_output.put_line(first_name || ', your account is created!');
END;