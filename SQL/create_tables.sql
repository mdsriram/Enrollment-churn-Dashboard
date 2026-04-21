
Table 1: members
CREATE TABLE members (
    member_id INT PRIMARY KEY,
    age INT,
    gender VARCHAR(50),
    county VARCHAR(100),
    eligibility_category VARCHAR(100),
    plan_name VARCHAR(100),
    language VARCHAR(50),
    disability_flag BIT
);

Table 2: enrollment_history
create table enrollment_history(
enrollment_id int primary key,
member_id int, 
enrollment_date date,
disenrollment_date date,
enrollment_status varchar(255),
eligibility_category varchar(255),
renewal_due_date date,
application_channel varchar(255),
reenrollment_flag bit,
    FOREIGN KEY (member_id) REFERENCES members(member_id)
);
