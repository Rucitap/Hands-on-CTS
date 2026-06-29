USE college_db;

SELECT
    s.student_id,
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    COUNT(e.course_id) AS total_courses
FROM students s
JOIN enrollments e
    ON s.student_id = e.student_id
GROUP BY s.student_id, s.first_name, s.last_name
HAVING COUNT(e.course_id) >
(
    SELECT AVG(course_count)
    FROM
    (
        SELECT
            COUNT(course_id) AS course_count
        FROM enrollments
        GROUP BY student_id
    ) avg_table
);


SELECT
    c.course_id,
    c.course_name,
    c.course_code
FROM courses c
WHERE NOT EXISTS
(
    SELECT *
    FROM enrollments e
    WHERE e.course_id = c.course_id
      AND e.grade <> 'A'
);


SELECT
    p.professor_id,
    p.first_name,
    p.last_name,
    p.salary,
    p.department_id
FROM professors p
WHERE p.salary =
(
    SELECT MAX(p2.salary)
    FROM professors p2
    WHERE p2.department_id = p.department_id
);

SELECT *
FROM
(
    SELECT
        d.department_id,
        d.department_name,
        ROUND(AVG(p.salary),2) AS avg_salary
    FROM departments d
    JOIN professors p
        ON d.department_id = p.department_id
    GROUP BY d.department_id, d.department_name
) dept_avg
WHERE avg_salary > 85000;
