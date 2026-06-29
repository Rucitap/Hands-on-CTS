USE college_db;

INSERT INTO departments (department_name, office_location, head_of_dept)
VALUES
('Computer Science', 'Block A', 'Dr. Kumar'),
('Electronics', 'Block B', 'Dr. Rao'),
('Mechanical', 'Block C', 'Dr. Sharma');

SELECT COUNT(*) AS department_count FROM departments;

INSERT INTO professors (first_name, last_name, email, department_id)
VALUES
('Arun', 'Kumar', 'arun.kumar@college.edu', 1),
('Priya', 'Rao', 'priya.rao@college.edu', 2),
('Vikram', 'Sharma', 'vikram.sharma@college.edu', 3);

SELECT COUNT(*) AS professor_count FROM professors;

INSERT INTO courses (course_name, course_code, credits, department_id, max_seats)
VALUES
('Database Management Systems', 'CS101', 4, 1, 60),
('Digital Electronics', 'EC201', 4, 2, 60),
('Thermodynamics', 'ME301', 4, 3, 60);

SELECT COUNT(*) AS course_count FROM courses;

INSERT INTO students (first_name, last_name, email, date_of_birth, department_id)
VALUES
('Rahul', 'Verma', 'rahul@college.edu', '2003-05-10', 1),
('Sneha', 'Patel', 'sneha@college.edu', '2004-01-15', 2),
('Karan', 'Singh', 'karan@college.edu', '2003-09-22', 1),
('Anita', 'Reddy', 'anita@college.edu', '2004-03-18', 3),
('Rohit', 'Mehta', 'rohit@college.edu', '2003-11-05', 1);

SELECT COUNT(*) AS student_count FROM students;

INSERT INTO enrollments (student_id, course_id, enrollment_date, grade)
VALUES
(1, 1, '2025-01-10', 'A'),
(2, 2, '2025-01-10', 'B'),
(3, 1, '2025-01-10', 'B'),
(4, 3, '2025-01-10', NULL),
(5, 1, '2025-01-10', 'C');

SELECT COUNT(*) AS enrollment_count FROM enrollments;

INSERT INTO students (first_name, last_name, email, date_of_birth, department_id)
VALUES
('Riya', 'Nair', 'riya.nair@college.edu', '2004-07-12', 1),
('Aditya', 'Menon', 'aditya.menon@college.edu', '2003-12-08', 2);

SELECT COUNT(*) AS student_count_after_insert FROM students;

UPDATE enrollments
SET grade = 'B'
WHERE student_id = 5
  AND course_id = 1;

SELECT * 
FROM enrollments
WHERE student_id = 5
  AND course_id = 1;

DELETE FROM enrollments
WHERE grade IS NULL;

SELECT COUNT(*) AS enrollment_count_after_delete
FROM enrollments;
