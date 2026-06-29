USE college_db;

EXPLAIN FORMAT=JSON
SELECT
    s.first_name,
    s.last_name,
    c.course_name
FROM enrollments e
JOIN students s
    ON s.student_id = e.student_id
JOIN courses c
    ON c.course_id = e.course_id
WHERE s.enrollment_year = 2022;


-- =====================================================
-- Task 1: Baseline Performance Analysis (No Indexes)
-- =====================================================

-- Query Analyzed:
-- SELECT s.first_name, s.last_name, c.course_name
-- FROM enrollments e
-- JOIN students s ON s.student_id = e.student_id
-- JOIN courses c ON c.course_id = e.course_id
-- WHERE s.enrollment_year = 2022;

-- EXPLAIN FORMAT=JSON Results:
-- Query Cost: 1.65
-- Table 'students' (s):
--    Access Type            : ALL (Full Table Scan)
--    Rows Examined per Scan : 7
--    Filter Condition       : s.enrollment_year = 2022
--
-- Table 'enrollments' (e):
--    Access Type            : ref
--    Key Used               : unique_enrollment
--    Rows Examined per Scan : 1
--
-- Table 'courses' (c):
--    Access Type            : eq_ref
--    Key Used               : PRIMARY
--    Rows Examined per Scan : 1

-- Analysis:
-- The query plan shows a Full Table Scan (access_type = ALL)
-- on the students table because there is no index on
-- the enrollment_year column.
--
-- MySQL scans all 7 rows of the students table to find
-- records where enrollment_year = 2022.
--
-- The enrollments table uses the unique_enrollment index,
-- and the courses table uses its PRIMARY KEY, making these
-- joins efficient.
--
-- For small tables, a Full Table Scan is acceptable.
-- However, as the number of student records increases,
-- query performance may degrade significantly.
-- Creating an index on students(enrollment_year)
-- can improve the performance of this query.
