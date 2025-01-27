
-- 1. Basic SELECT with Filtering (Equality Condition)
-- Retrieve all students who have the first name "John."
SELECT StudentID, FirstName, LastName, Email
FROM Students
WHERE FirstName = 'John';

-- 2. Using LIKE for Pattern Matching
-- Find all students whose last name starts with a "Be"
SELECT StudentID, FirstName, LastName, Email
FROM Students
WHERE LastName LIKE 'Be%';

-- 3. Sorting Results (ORDER BY Clause)
-- List all students, sorted alphabetically by last name and then first name.
SELECT StudentID, FirstName, LastName, Email
FROM Students
ORDER BY LastName ASC, FirstName ASC;

-- 4. Aggregation with GROUP BY
-- Count the number of students enrolled in each year.
SELECT YEAR(EnrollmentDate) AS EnrollmentYear, COUNT(StudentID) AS TotalStudents
FROM Students
GROUP BY YEAR(EnrollmentDate)
ORDER BY EnrollmentYear DESC;

-- 5. Combining Conditions with AND/OR
-- Find students who enrolled in 2023 and have an email ending with "example.com."
SELECT StudentID, FirstName, LastName, Email, EnrollmentDate
FROM Students
WHERE YEAR(EnrollmentDate) = 2023 
  AND Email LIKE '%example.com'
ORDER BY EnrollmentDate DESC;
