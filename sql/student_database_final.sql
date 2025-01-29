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
    Grade CHAR(1) CHECK (Grade IN ('A', 'B', 'C', 'D', 'F'))


);


