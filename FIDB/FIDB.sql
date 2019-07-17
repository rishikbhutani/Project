CREATE DATABASE FIDB
 USE FIDB

CREATE SEQUENCE user1 AS INT  
START WITH 1 
INCREMENT BY 1

CREATE TABLE users
(
	uid INT CONSTRAINT pk_users PRIMARY KEY, 
	u_name VARCHAR(100),
	mail_id VARCHAR(100) CONSTRAINT users_mailid NOT NULL,
	phone_no CHAR(10),
	DOB DATE CONSTRAINT user_dob NOT NULL, 
	gender CHAR CONSTRAINT users_gender CHECK (gender IN ('M','F','O')),
	user_address VARCHAR(100), 
	user_city VARCHAR(100), 
	user_state VARCHAR (100), 
	username VARCHAR(300), 
	user_pass VARCHAR(300)
)
--INSERT INTO users VALUES (NEXT VALUE FOR user1,'rishab', 'rrr@hh.com','9999999999','19970403','M','ff','ff','ff','eee','ddd')

CREATE PROC users_update 
@uid int,
@uname varchar(100),
@mail_id varchar(100),
@phoneno CHAR(10),
@dob date,
@gender CHAR,
@u_add varchar(100),
@u_city varchar(100),
@u_state varchar(100),
@username varchar(300),
@pass varchar(300)
AS 
BEGIN
UPDATE dbo.users
SET 
	u_name = @uname,
	mail_id = @mail_id,
	phone_no = @phoneno,
	DOB = @dob, 
	gender = @gender, 
	user_address = @u_add,
	user_city= @u_city,
	user_state = @u_state,
	username = @username, 
	user_pass = @pass
WHERE 
	uid = @uid
END


CREATE PROC users_insert 
@u_name varchar(100), 
@mail_id varchar(100),
@phone_no CHAR(10),
@dob DATE,
@gender CHAR,
@user_address varchar(100),
@user_city varchar(100),
@user_state varchar(100),
@username varchar(300),
@user_pass varchar(300)
AS 
BEGIN 
INSERT INTO users
VALUES(NEXT VALUE FOR user1, @u_name, @mail_id, @phone_no, @dob, @gender, @user_address, @user_city, @user_state, @username, @user_pass) 
--INSERT INTO users(u_name,mail_id,phone_no,DOB, gender,user_address,user_city,user_state,username,user_pass)
--VALUES(@u_name, @mail_id, @phone_no, @dob, @gender, @user_address, @user_city, @user_state, @username, @user_pass) 

END 


--EXEC user_insert(,'rishab', 'rrr@hh.com','9999999999','19970403','M','ff','ff','ff','eee','ddd')


CREATE PROCEDURE users_delete 
@uid int,
@name varchar(100)
AS 
BEGIN 
	DELETE FROM users 
	WHERE uid = @uid OR u_name=@name
END


CREATE SEQUENCE test1 AS INT  
START WITH 101 
INCREMENT BY 2

CREATE TABLE tests
(
	tid INT CONSTRAINT pk_tests PRIMARY KEY, 
	category VARCHAR(100) 
)


CREATE PROC tests_update 
@tid int,
@category varchar(100)
AS 
BEGIN
UPDATE dbo.tests
SET 
	category=@category
WHERE 
	tid = @tid
END

CREATE PROC tests_insert 
@category varchar(100)

AS 
BEGIN 
INSERT INTO tests
VALUES(NEXT VALUE FOR test1, @category) 

END 


CREATE PROCEDURE users_delete 
@tid int,
@category varchar(100)
AS 
BEGIN 
	DELETE FROM tests 
	WHERE tid = @tid 
END

CREATE SEQUENCE consult1 AS INT  
START WITH 1001 
INCREMENT BY 10

CREATE TABLE consultants
(
	cid INT CONSTRAINT pk_consultants PRIMARY KEY,
	c_name VARCHAR(100),
	email_id VARCHAR (100),			--email constraint @ format 
	phone CHAR(10),
	c_address VARCHAR(100),
	c_city VARCHAR(100),
	c_state VARCHAR(100),
	c_resume VARCHAR(1000) CONSTRAINT c_resume NOT NULL,
	pic VARCHAR(1000),
	practice_certi VARCHAR (1000) CONSTRAINT c_certificate NOT NULL,
	c_average FLOAT, 
	c_rating float, 
	patient_count INT, 
	active_patient INT

)

CREATE SEQUENCE attempt AS INT  
START WITH  1
INCREMENT BY 10

CREATE TABLE test_analysis
(
	attempt_id INT CONSTRAINT pk_attempt_id PRIMARY KEY ,
	uid INT REFERENCES dbo.users(uid) ON DELETE CASCADE,
	tid INT REFERENCES dbo.tests(tid),
	attempt_date DATETIME2,
	category VARCHAR(100),
	score int, 
	--level_of_depression VARCHAR(100) CONSTRAINT tests_category CHECK (category IN ('These ups and downs are considered normal', 'Mild mood disturbances', 'Border line clinical depression', 'Moderate depression', 'Severe depression', 'Extreme Depression')) ,
	cid INT
)





SELECT * FROM dbo.users
SELECT * FROM dbo.consultants
SELECT * FROM dbo.tests
SELECT * FROM dbo.test_analysis


