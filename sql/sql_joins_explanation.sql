
# Understanding SQL Joins

## 1. INNER JOIN
**Definition:**  
An INNER JOIN returns only the records that have **matching values in both tables**. If there’s no match, the record is **excluded**.

### Example:
Retrieve all students who are enrolled in a course.

```sql
SELECT Students.StudentID, Students.FirstName, Students.LastName, Courses.CourseName
FROM Students
INNER JOIN Enrollments ON Students.StudentID = Enrollments.StudentID
INNER JOIN Courses ON Enrollments.CourseID = Courses.CourseID;
```

---

## 2. OUTER JOIN
**Definition:**  
An OUTER JOIN returns all records from one or both tables, even if there’s **no match**.

### LEFT OUTER JOIN Example:
Retrieve all students, even if they are **not enrolled** in a course.

```sql
SELECT Students.StudentID, Students.FirstName, Students.LastName, Courses.CourseName
FROM Students
LEFT JOIN Enrollments ON Students.StudentID = Enrollments.StudentID
LEFT JOIN Courses ON Enrollments.CourseID = Courses.CourseID;
```

### FULL OUTER JOIN Example (Simulated in MySQL):
```sql
SELECT Students.StudentID, Students.FirstName, Students.LastName, Courses.CourseName
FROM Students
LEFT JOIN Enrollments ON Students.StudentID = Enrollments.StudentID
LEFT JOIN Courses ON Enrollments.CourseID = Courses.CourseID

UNION

SELECT Students.StudentID, Students.FirstName, Students.LastName, Courses.CourseName
FROM Courses
LEFT JOIN Enrollments ON Courses.CourseID = Enrollments.CourseID
LEFT JOIN Students ON Enrollments.StudentID = Students.StudentID;
```

---

## 3. JOIN (Default Behavior)
**Definition:**  
If you use `JOIN` without specifying INNER or OUTER, it defaults to an **INNER JOIN**.

```sql
SELECT Students.StudentID, Students.FirstName, Students.LastName, Courses.CourseName
FROM Students
JOIN Enrollments ON Students.StudentID = Enrollments.StudentID
JOIN Courses ON Enrollments.CourseID = Courses.CourseID;
```

---

## 4. SELF JOIN
**Definition:**  
A SELF JOIN joins a table **to itself**, often used for comparing rows within the same table.

### Example - Find Students Who Enrolled on the Same Date:
```sql
SELECT A.FirstName AS Student1, A.LastName AS LastName1, 
       B.FirstName AS Student2, B.LastName AS LastName2, 
       A.EnrollmentDate
FROM Students A
INNER JOIN Students B 
ON A.EnrollmentDate = B.EnrollmentDate
AND A.StudentID < B.StudentID;
```

---

## Summary Table

| Join Type        | Description |
|-----------------|-------------|
| **INNER JOIN** | Returns **only** matching records from both tables. |
| **LEFT OUTER JOIN** | Returns **all records from the left table**, and matches from the right table. |
| **RIGHT OUTER JOIN** | Returns **all records from the right table**, and matches from the left table. |
| **FULL OUTER JOIN** | Returns **all records from both tables**, even if there’s no match. *(Not directly supported in MySQL.)* |
| **SELF JOIN** | Joins a table to **itself**, used for comparing rows within the same table. |

---

## Notes:
- `INNER JOIN` is the most commonly used join.
- `OUTER JOIN` ensures no data is lost when there are missing matches.
- `SELF JOIN` is useful for finding relationships within the same table.

