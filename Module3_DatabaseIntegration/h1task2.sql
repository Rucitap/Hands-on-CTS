-- 1NF (First Normal Form)
-- All tables contain atomic values only.
-- Each column stores a single value and there are no repeating groups.
-- Example violation: storing multiple phone numbers in one column such as
-- '9876543210, 9123456780' would break 1NF because the field is not atomic.

-- 2NF (Second Normal Form)
-- All non-key attributes are fully dependent on their primary key.
-- In departments, students, courses, and professors tables,
-- each table has a single-column primary key, so partial dependency cannot exist.
-- In enrollments, the candidate key is (student_id, course_id).
-- enrollment_date depends on the entire student-course combination,
-- not just student_id or course_id individually, so 2NF is satisfied.

-- 3NF (Third Normal Form)
-- No non-key attribute depends on another non-key attribute.
-- Department information is stored only in the departments table.
-- Students, courses, and professors store only department_id as a foreign key.
-- Storing department_name directly in students would create a transitive dependency:
-- student_id -> department_id -> department_name, which violates 3NF.
-- Therefore, the schema satisfies 3NF.

-- 3NF ANALYSIS FOR ENROLLMENTS TABLE
-- enrollments contains enrollment_id, student_id, course_id, and enrollment_date.
-- student_id and course_id are foreign keys referencing other tables.
-- enrollment_date depends directly on the enrollment record.
-- There are no attributes that depend on other non-key attributes.
-- No transitive dependencies exist in this table.
-- Therefore, the enrollments table complies with 3NF.
