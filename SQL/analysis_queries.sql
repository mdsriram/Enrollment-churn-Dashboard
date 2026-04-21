1. Total members
SELECT COUNT(*) AS total_members
FROM members;

2. Total Enrollments
SELECT COUNT(*) AS total_members
FROM members;

3. Active members
SELECT COUNT(DISTINCT member_id) AS active_members
FROM enrollment_history
WHERE disenrollment_date IS NULL;

4. Disenrollments
SELECT COUNT(DISTINCT member_id) AS active_members
FROM enrollment_history
WHERE disenrollment_date IS NULL;

5.Churn Rate
SELECT 
    COUNT(DISTINCT CASE 
        WHEN disenrollment_date IS NOT NULL THEN member_id 
    END) * 100.0 
    / COUNT(DISTINCT member_id) AS churn_rate
FROM enrollment_history;

6. Monthly Enrollment Trend
SELECT 
    YEAR(enrollment_date) AS year,
    MONTH(enrollment_date) AS month,
    COUNT(*) AS enrollments
FROM enrollment_history
GROUP BY YEAR(enrollment_date), MONTH(enrollment_date)
ORDER BY year, month;

7. Monthly Disenrollment Trend
SELECT 
    YEAR(disenrollment_date) AS year,
    MONTH(disenrollment_date) AS month,
    COUNT(*) AS disenrollments
FROM enrollment_history
WHERE disenrollment_date IS NOT NULL
GROUP BY YEAR(disenrollment_date), MONTH(disenrollment_date)
ORDER BY year, month;

8. Disenrollment by county
SELECT 
    m.county,
    COUNT(DISTINCT e.member_id) AS disenrollments
FROM members m
JOIN enrollment_history e
    ON m.member_id = e.member_id
WHERE e.disenrollment_date IS NOT NULL
GROUP BY m.county
ORDER BY disenrollments DESC;

9. Plan performnace
SELECT 
    m.plan_name,
    COUNT(DISTINCT e.member_id) AS disenrollments
FROM members m
JOIN enrollment_history e
    ON m.member_id = e.member_id
WHERE e.disenrollment_date IS NOT NULL
GROUP BY m.plan_name
ORDER BY disenrollments DESC;

10. Eligibility Category Analysis
SELECT 
    m.eligibility_category,
    COUNT(DISTINCT e.member_id) AS disenrollments
FROM members m
JOIN enrollment_history e
    ON m.member_id = e.member_id
WHERE e.disenrollment_date IS NOT NULL
GROUP BY m.eligibility_category
ORDER BY disenrollments DESC;
