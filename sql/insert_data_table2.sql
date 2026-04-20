--auto generating values 

INSERT INTO enrollment_history (
    enrollment_id,
    member_id,
    enrollment_date,
    disenrollment_date,
    enrollment_status,
    eligibility_category,
    renewal_due_date,
    application_channel,
    reenrollment_flag
)
SELECT
    1000 + ROW_NUMBER() OVER (ORDER BY member_id) AS enrollment_id,
    member_id,

    DATEADD(DAY, -(ABS(CHECKSUM(NEWID())) % 365), GETDATE()) AS enrollment_date,

    CASE 
        WHEN ABS(CHECKSUM(NEWID())) % 4 = 0 
        THEN DATEADD(DAY, -(ABS(CHECKSUM(NEWID())) % 200), GETDATE())
        ELSE NULL
    END AS disenrollment_date,

    CASE 
        WHEN ABS(CHECKSUM(NEWID())) % 4 = 0 THEN 'Inactive'
        ELSE 'Active'
    END AS enrollment_status,

    eligibility_category,

    DATEADD(DAY, (ABS(CHECKSUM(NEWID())) % 365), GETDATE()) AS renewal_due_date,

    CASE ABS(CHECKSUM(NEWID())) % 4
        WHEN 0 THEN 'Online'
        WHEN 1 THEN 'Call Center'
        WHEN 2 THEN 'In-Person'
        ELSE 'Mobile App'
    END,

    ABS(CHECKSUM(NEWID())) % 2
FROM members;

    select count(*) from enrollment_history

    
    select * from enrollment_history
