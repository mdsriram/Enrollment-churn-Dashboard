/* Table 1 data*/

INSERT INTO members values
(101, 34, 'Female', 'Harris', 'Medicaid', 'United Health', 'English', 0),
(102, 45, 'Male', 'Fort Bend', 'Medicaid', 'Aetna', 'Spanish', 0),
(103, 29, 'Female', 'Harris', 'CHIP', 'Molina', 'English', 0),
(104, 60, 'Male', 'Dallas', 'Medicaid', 'United Health', 'English', 1),
(105, 52, 'Female', 'Travis', 'Medicaid', 'BCBS', 'Spanish', 1),
(106, 40, 'Male', 'Harris', 'Medicaid', 'Aetna', 'English', 0),
(107, 37, 'Female', 'Fort Bend', 'CHIP', 'Molina', 'Spanish', 0),
(108, 70, 'Male', 'Dallas', 'Medicaid', 'United Health', 'English', 1),
(109, 34, 'Female', 'Harris', 'Medicaid', 'United Health', 'English', 0),
(110, 5, 'Male', 'Fort Bend', 'Medicaid', 'Aetna', 'Spanish', 0),
(111, 61, 'Female', 'Harris', 'CHIP', 'Molina', 'English', 0),
(112, 59, 'Male', 'Dallas', 'Medicaid', 'United Health', 'English', 1),
(113, 21, 'Female', 'Travis', 'Medicaid', 'BCBS', 'Spanish', 1),
(114, 12, 'Male', 'Harris', 'Medicaid', 'Aetna', 'English', 0),
(115, 17, 'Female', 'Fort Bend', 'CHIP', 'Molina', 'Spanish', 0),
(116, 15, 'Male', 'Dallas', 'Medicaid', 'United Health', 'English', 1);

select * from members;

WITH numbers AS (
    SELECT TOP 100 ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) + 200 AS member_id
    FROM sys.objects
)
INSERT INTO members (member_id, age, gender, county, eligibility_category, plan_name, language, disability_flag)
SELECT 
    member_id,
    18 + ABS(CHECKSUM(NEWID())) % 60 AS age,
    
    CASE 
        WHEN ABS(CHECKSUM(NEWID())) % 2 = 0 THEN 'Male'
        ELSE 'Female'
    END AS gender,
    
    CASE ABS(CHECKSUM(NEWID())) % 5
        WHEN 0 THEN 'Harris'
        WHEN 1 THEN 'Fort Bend'
        WHEN 2 THEN 'Dallas'
        WHEN 3 THEN 'Travis'
        ELSE 'Bexar'
    END AS county,
    
    CASE 
        WHEN ABS(CHECKSUM(NEWID())) % 2 = 0 THEN 'Medicaid'
        ELSE 'CHIP'
    END AS eligibility_category,
    
    CASE ABS(CHECKSUM(NEWID())) % 4
        WHEN 0 THEN 'United Health'
        WHEN 1 THEN 'Aetna'
        WHEN 2 THEN 'Molina'
        ELSE 'BCBS'
    END AS plan_name,
    
    CASE ABS(CHECKSUM(NEWID())) % 3
        WHEN 0 THEN 'English'
        WHEN 1 THEN 'Spanish'
        ELSE 'Other'
    END AS language,
    
    ABS(CHECKSUM(NEWID())) % 2 AS disability_flag
FROM numbers;

    select count(*) from members
