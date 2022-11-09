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
    birthday DATE,
    gender VARCHAR(255) CHECK(gender in ('MALE', 'FEMALE', 'OTHER')),
    sexual_orientation VARCHAR(255),
    show_profile_type VARCHAR(255) CHECK(show_profile_type in ('MALE', 'FEMALE', 'EVERYONE')),
    age INT,
    location_latitude FLOAT,
    location_longitude FLOAT,
    distance_range INT,
    bio VARCHAR(255),
    pronouns VARCHAR(255),
    FOREIGN KEY(id) REFERENCES Users(id)
);