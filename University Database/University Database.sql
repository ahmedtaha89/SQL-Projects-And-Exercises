CREATE DATABASE University_DB;

USE University_DB;

CREATE TABLE Department (
	DepartmentID INT PRIMARY KEY identity(1, 1),
	DepartmentName VARCHAR(100) NOT NULL
	);

CREATE TABLE Careerlevel (
	CareerlevelID INT PRIMARY KEY identity(1, 1),
	CareerlevelName VARCHAR(100) NOT NULL
	);

CREATE TABLE Career (
	CareerID INT PRIMARY KEY identity(1, 1),
	CareerName VARCHAR(100) NOT NULL,
	DepartmentID INT,
	DurationYears INT NOT NULL,
	RequiredOptativeCourses INT NOT NULL,
	CareerLevelID INT,
	FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
	FOREIGN KEY (CareerLevelID) REFERENCES CareerLevel(CareerLevelID)
	);

CREATE TABLE Course (
	CourseID INT PRIMARY KEY identity(1, 1),
	CourseName VARCHAR(100) NOT NULL,
	CareerID INT,
	Year INT NOT NULL CHECK (Year >= 1),
	Semester INT NOT NULL CHECK (
		Semester IN (
			1,
			2
			)
		),
	Optative BIT NOT NULL DEFAULT(0),
	CourseCode VARCHAR(20) NOT NULL,
	FOREIGN KEY (CareerID) REFERENCES Career(CareerID)
	);

CREATE TABLE Professor (
	ProfessorID INT PRIMARY KEY identity(1, 1),
	FirstName VARCHAR(100) NOT NULL,
	LastName VARCHAR(100) NOT NULL,
	Email VARCHAR(100) NOT NULL UNIQUE,
	PhoneNumber VARCHAR(100)
	);

CREATE TABLE ProfessorCourse (
	ProfessorID INT,
	CourseID INT,
	PRIMARY KEY (
		ProfessorID,
		CourseID
		),
	FOREIGN KEY (ProfessorID) REFERENCES Professor(ProfessorID),
	FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
	);

CREATE TABLE CoureDependency (
	CourseID INT,
	RequiredCourseID INT,
	PRIMARY KEY (
		CourseID,
		RequiredCourseID
		),
	FOREIGN KEY (CourseID) REFERENCES Course(CourseID),
	FOREIGN KEY (RequiredCourseID) REFERENCES Course(CourseID),
	);