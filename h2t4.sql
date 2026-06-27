USE college_db;

UPDATE departments
SET budget = 850000
WHERE department_name = 'Computer Science';

UPDATE departments
SET budget = 700000
WHERE department_name = 'Electronics';

UPDATE departments
SET budget = 550000
WHERE department_name = 'Mechanical';

UPDATE departments
SET budget = 450000
WHERE department_name = 'Civil';

UPDATE professors
SET salary = 65000
WHERE professor_id = 1;

UPDATE professors
SET salary = 62000
WHERE professor_id = 2;

UPDATE professors
SET salary = 60000
WHERE professor_id = 3;

UPDATE professors
SET salary = 58000
WHERE professor_id = 4;

UPDATE enrollments
SET grade = 'A'
WHERE enrollment_id = 1;

UPDATE enrollments
SET grade = 'B'
WHERE enrollment_id = 2;

UPDATE enrollments
SET grade = 'A'
WHERE enrollment_id = 3;

UPDATE enrollments
SET grade = 'C'
WHERE enrollment_id = 4;

UPDATE enrollments
SET grade = 'B'
WHERE enrollment_id = 5;



SELECT
    c.course_name,
    COUNT(e.enrollment_id) AS enrollment_count
FROM courses c
LEFT JOIN enrollments e
    ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name;



SELECT
    d.department_name,
    ROUND(AVG(p.salary), 2) AS average_salary
FROM departments d
JOIN professors p
    ON d.department_id = p.department_id
GROUP BY d.department_id, d.department_name;



SELECT
    department_name,
    budget
FROM departments
WHERE budget > 600000;



SELECT
    e.grade,
    COUNT(*) AS grade_count
FROM enrollments e
JOIN courses c
    ON e.course_id = c.course_id
WHERE c.course_code = 'CS101'
GROUP BY e.grade
ORDER BY e.grade;



SELECT
    d.department_name,
    COUNT(DISTINCT s.student_id) AS total_students
FROM departments d
JOIN students s
    ON d.department_id = s.department_id
GROUP BY d.department_id, d.department_name
HAVING COUNT(DISTINCT s.student_id) > 2;