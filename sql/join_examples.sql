
-- 1. Basic INNER JOIN - Retrieve all students and their enrolled courses
SELECT Students.StudentID, Students.FirstName, Students.LastName, Courses.CourseName
FROM Students
INNER JOIN Enrollments ON Students.StudentID = Enrollments.StudentID
INNER JOIN Courses ON Enrollments.CourseID = Courses.CourseID;

-- 2. INNER JOIN with Filtering - Get students enrolled in 'Mathematics'
SELECT Students.FirstName, Students.LastName, Courses.CourseName
FROM Students
INNER JOIN Enrollments ON Students.StudentID = Enrollments.StudentID
INNER JOIN Courses ON Enrollments.CourseID = Courses.CourseID
WHERE Courses.CourseName = 'Mathematics';

-- 3. LEFT JOIN - Show all students, even if they aren’t enrolled in any courses
SELECT Students.StudentID, Students.FirstName, Students.LastName, Courses.CourseName
FROM Students
LEFT JOIN Enrollments ON Students.StudentID = Enrollments.StudentID
LEFT JOIN Courses ON Enrollments.CourseID = Courses.CourseID;

-- 4. RIGHT JOIN - Show all courses, even if no students are enrolled
SELECT Courses.CourseID, Courses.CourseName, Students.FirstName, Students.LastName
FROM Courses
RIGHT JOIN Enrollments ON Courses.CourseID = Enrollments.CourseID
RIGHT JOIN Students ON Enrollments.StudentID = Students.StudentID;

-- 5. FULL OUTER JOIN (Simulated) - Show all students and courses, even if no matches exist
SELECT Students.StudentID, Students.FirstName, Students.LastName, Courses.CourseName
FROM Students
LEFT JOIN Enrollments ON Students.StudentID = Enrollments.StudentID
LEFT JOIN Courses ON Enrollments.CourseID = Courses.CourseID
UNION
SELECT Students.StudentID, Students.FirstName, Students.LastName, Courses.CourseName
FROM Courses
LEFT JOIN Enrollments ON Courses.CourseID = Enrollments.CourseID
LEFT JOIN Students ON Enrollments.StudentID = Students.StudentID;

-- 6. SELF JOIN - Find students who have the same Enrollment Date
SELECT A.FirstName AS Student1, A.LastName AS LastName1, 
       B.FirstName AS Student2, B.LastName AS LastName2, 
       A.EnrollmentDate
FROM Students A
INNER JOIN Students B ON A.EnrollmentDate = B.EnrollmentDate
AND A.StudentID < B.StudentID;

-- 7. Using COUNT() with GROUP BY - Number of students in each course
SELECT Courses.CourseName, COUNT(Enrollments.StudentID) AS TotalStudents
FROM Enrollments
INNER JOIN Courses ON Enrollments.CourseID = Courses.CourseID
GROUP BY Courses.CourseName;

-- 8. Using AVG() - Find the average number of credits per student
SELECT Students.StudentID, Students.FirstName, Students.LastName, AVG(Courses.Credits) AS AverageCredits
FROM Students
INNER JOIN Enrollments ON Students.StudentID = Enrollments.StudentID
INNER JOIN Courses ON Enrollments.CourseID = Courses.CourseID
GROUP BY Students.StudentID;

-- 9. Using HAVING - Find courses with more than 5 students enrolled
SELECT Courses.CourseName, COUNT(Enrollments.StudentID) AS TotalStudents
FROM Enrollments
INNER JOIN Courses ON Enrollments.CourseID = Courses.CourseID
GROUP BY Courses.CourseName
HAVING COUNT(Enrollments.StudentID) > 5;

-- 10. Using JOINs with Subqueries - Find students with the highest number of courses enrolled
SELECT Students.FirstName, Students.LastName, COUNT(Enrollments.CourseID) AS CourseCount
FROM Students
INNER JOIN Enrollments ON Students.StudentID = Enrollments.StudentID
GROUP BY Students.StudentID
HAVING CourseCount = (
    SELECT MAX(CourseCount)
    FROM (
        SELECT COUNT(Enrollments.CourseID) AS CourseCount
        FROM Enrollments
        GROUP BY Enrollments.StudentID
    ) AS CourseCounts
);
