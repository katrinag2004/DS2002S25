
-- 1. Using DISTINCT to Remove Duplicates
-- Retrieve all unique first names from the Students table
SELECT DISTINCT FirstName
FROM Students;

-- 2. Using BETWEEN for Range Filtering
-- Find students who were born between the years 2000 and 2005
SELECT StudentID, FirstName, LastName, DateOfBirth
FROM Students
WHERE DateOfBirth BETWEEN '2000-01-01' AND '2005-12-31';

-- 3. Using IN to Match Multiple Values
-- Find students whose first name is either "John," "Jane," or "Michael"
SELECT StudentID, FirstName, LastName
FROM Students
WHERE FirstName IN ('John', 'Jane', 'Michael');

-- 4. Using COUNT and HAVING
-- Find how many students have an email ending with "example.com" and display only those with more than 5 occurrences
SELECT Email, COUNT(*) AS EmailCount
FROM Students
WHERE Email LIKE '%example.com'
GROUP BY Email


-- 5. Using LIMIT to Restrict Results
-- Retrieve the first 10 students ordered by enrollment date
SELECT StudentID, FirstName, LastName, EnrollmentDate
FROM Students
ORDER BY EnrollmentDate ASC
LIMIT 10;
