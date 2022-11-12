DECLARE
    your_id INT := :Your_ID;
    user_id INT := :User_ID;
    your_name VARCHAR(255);
    user_name VARCHAR(255);
    remarks VARCHAR(255) := :Remarks;
    report_date DATE := sysdate;
    is_resolved INT := 0;
BEGIN
    INSERT INTO Reports (
        reporter_id,
        reported_to,
        remarks,
        report_date,
        is_resolved,
        resolved_by,
        resolved_on,
        resolve_remark
    ) VALUES (
        your_id,
        user_id,
        remarks,
        report_date,
        is_resolved,
        NULL,
        NULL,
        NULL
    );
    SELECT first_name INTO user_name FROM Users WHERE id=user_id;
    SELECT first_name INTO your_name FROM Users WHERE id=your_id;
    dbms_output.put_line(your_name || ', you have successfully filed a report against ' || user_name || '!');
END;
/