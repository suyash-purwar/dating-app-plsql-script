-- AUTO_INCREMENT is not supported in Oracle 11g.
-- Triggers will be used to automatically allocate the unique id to every User
CREATE TABLE Users (
	id INT,
	first_name VARCHAR(255) NOT NULL,
	middle_name VARCHAR(255),
	last_name VARCHAR(255) NOT NULL,
	phone VARCHAR(255) NOT NULL unique,
    email_id VARCHAR(255),
	access_token VARCHAR(255) NOT NULL,
	refresh_token VARCHAR(255) NOT NULL,
	otp INT,
	otp_exp_time DATE
);

CREATE TABLE UserInfo (
    id INT PRIMARY KEY,
    birthday DATE NOT NULL,
    gender VARCHAR(255) NOT NULL CHECK(gender in ('MALE', 'FEMALE', 'OTHER')),
    sexual_orientation VARCHAR(255) NOT NULL,
    show_profile_type VARCHAR(255) NOT NULL CHECK(show_profile_type in ('MALE', 'FEMALE', 'EVERYONE')),
    age INT NOT NULL CHECK(age >= 18),
    location_latitude FLOAT NOT NULL,
    location_longitude FLOAT NOT NULL,
    distance_range INT DEFAULT 10,
    bio VARCHAR(255),
    pronouns VARCHAR(255),
    FOREIGN KEY(id) REFERENCES Users(id)
);

CREATE TABLE Swipes (
    id INT,
    swiped_by INT NOT NULL,
    swiped_to INT NOT NULL,
    swipe_type VARCHAR(255) NOT NULL CHECK(swipe_type in ('LIKE', 'SUPERLIKE')),
    is_accepted INT DEFAULT 0,
    is_blocked int DEFAULT 0,
    swiped_on DATE NOT NULL,
    blocked_on DATE,
    PRIMARY KEY(id),
    FOREIGN KEY(swiped_by) REFERENCES Users(id),
    FOREIGN KEY(swiped_to) REFERENCES Users(id)
);

CREATE TABLE Reports (
    id INT,
    reporter_id INT NOT NULL,
    reported INT NOT NULL,
    remarks VARCHAR(255) NOT NULL,
    report_date DATE NOT NULL,
    is_resolved INT DEFAULT 0,
    resolved_by VARCHAR(255),
    resolve_date DATE,
    resolve_remark VARCHAR(255),
    PRIMARY KEY(id),
    FOREIGN KEY(reporter_id) REFERENCES Users(id),
    FOREIGN KEY(reported) REFERENCES Users(id)
);