-- Drop database if it already exists to start fresh
DROP DATABASE IF EXISTS StudentDB;

-- Create the database
CREATE DATABASE StudentDB;

-- Use the newly created database
USE StudentDB;

-- Drop tables if they already exist (in the correct order to avoid FK dependency issues)
DROP TABLE IF EXISTS Enrollments;
DROP TABLE IF EXISTS Courses;
DROP TABLE IF EXISTS Students;

-- Create Students table
CREATE TABLE Students (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,  -- Primary Key with auto-increment
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE,
    Email VARCHAR(100) UNIQUE,
    EnrollmentDate DATE DEFAULT (CURRENT_DATE)
);

-- Create Courses table
CREATE TABLE Courses (
    CourseID INT AUTO_INCREMENT PRIMARY KEY,  -- Primary Key with auto-increment
    CourseName VARCHAR(100) NOT NULL,
    Credits INT CHECK (Credits > 0),
    Instructor VARCHAR(100)
);

-- Create Enrollments table (associative entity linking Students and Courses)
CREATE TABLE Enrollments (
    EnrollmentID INT AUTO_INCREMENT PRIMARY KEY,  -- Primary Key with auto-increment
    StudentID INT,  -- Foreign Key referencing Students
    CourseID INT,   -- Foreign Key referencing Courses
    EnrollmentDate DATE DEFAULT (CURRENT_DATE),
    Grade CHAR(1) CHECK (Grade IN ('A', 'B', 'C', 'D', 'F')),

    -- Establishing foreign key relationships
    CONSTRAINT FK_Enrollments_Students FOREIGN KEY (StudentID) REFERENCES Students(StudentID) ON DELETE CASCADE,
    CONSTRAINT FK_Enrollments_Courses FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) ON DELETE CASCADE
);

-- Insert sample data into Students table
INSERT INTO Students (FirstName, LastName, DateOfBirth, Email)
VALUES 
('John', 'Doe', '2000-05-20', 'john.doe@example.com'),
('Jane', 'Smith', '2001-07-15', 'jane.smith@example.com');

-- Insert sample data into Courses table
INSERT INTO Courses (CourseName, Credits, Instructor)
VALUES 
('Mathematics', 3, 'Dr. Adams'),
('Physics', 4, 'Dr. Brown');

-- Insert sample data into Enrollments table
INSERT INTO Enrollments (StudentID, CourseID, Grade)
VALUES 
(1, 1, 'A'),
(2, 2, 'B');

-- Verify data by selecting records
SELECT * FROM Students;
SELECT * FROM Courses;
SELECT * FROM Enrollments;
