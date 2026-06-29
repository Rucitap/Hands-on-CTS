import mysql.connector
import time

conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="tiger",
    database="college_db"
)

cursor = conn.cursor()

print("----- Version 1 : N+1 Problem -----")

start = time.time()

query_count = 1

cursor.execute("SELECT * FROM enrollments")
enrollments = cursor.fetchall()

results1 = []

for e in enrollments:
    student_id = e[1]

    cursor.execute(
        "SELECT first_name, last_name FROM students WHERE student_id = %s",
        (student_id,)
    )

    query_count += 1

    student = cursor.fetchone()

    results1.append(
        (e[0], student[0] + " " + student[1])
    )

end = time.time()

print("Queries executed:", query_count)
print("Time taken:", end - start, "seconds")
print(results1)

print("\n----- Version 2 : Using JOIN -----")

start = time.time()

cursor.execute("""
SELECT
    e.enrollment_id,
    CONCAT(s.first_name,' ',s.last_name) AS student_name
FROM enrollments e
JOIN students s
ON e.student_id = s.student_id
""")

results2 = cursor.fetchall()

end = time.time()

print("Queries executed: 1")
print("Time taken:", end - start, "seconds")
print(results2)

print("\n----- Comparison -----")
print("N+1 Queries :", query_count)
print("JOIN Queries:", 1)
print("Extra Queries:", query_count - 1)

cursor.close()
conn.close()
