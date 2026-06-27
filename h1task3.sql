USE college_db;

ALTER TABLE students
ADD COLUMN phone_number VARCHAR(15);

ALTER TABLE courses
ADD COLUMN max_seats INT DEFAULT 60;

ALTER TABLE enrollments
ADD COLUMN grade CHAR(1);

ALTER TABLE enrollments
ADD CONSTRAINT chk_grade
CHECK (grade IN ('A','B','C','D','F') OR grade IS NULL);

ALTER TABLE departments
ADD COLUMN hod_name VARCHAR(100);

ALTER TABLE departments
CHANGE COLUMN hod_name head_of_dept VARCHAR(100);

ALTER TABLE students
DROP COLUMN phone_number;

DESCRIBE departments;
DESCRIBE students;
DESCRIBE courses;
DESCRIBE enrollments;
DESCRIBE professors;