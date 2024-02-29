USE University_DB;

INSERT INTO Department (DepartmentName) VALUES
('Computer Science'),
('Electrical Engineering'),
('Mechanical Engineering'),
('Physics'),
('Mathematics'),
('Chemistry'),
('Biology'),
('Civil Engineering'),
('Economics'),
('History'),
('Psychology'),
('English'),
('Political Science'),
('Sociology'),
('Chemical Engineering'),
('Philosophy'),
('Geology'),
('Anthropology'),
('Art History'),
('Statistics'),
('Music'),
('Environmental Science'),
('Drama'),
('Marketing'),
('Finance'),
('Information Technology'),
('Nursing'),
('Education'),
('Astronomy'),
('Health Sciences');


-- Inserting data into Careerlevel table for academic levels
INSERT INTO Careerlevel (CareerlevelName) VALUES
('Undergraduate'),
('Masters'),
('PhD'),
('Postdoctoral'),
('Associate Professor'),
('Full Professor')



-- Inserting more data into Career table
INSERT INTO Career (CareerName, DepartmentID, DurationYears, RequiredOptativeCourses, CareerLevelID) VALUES
('Computer Science Bachelor', 1, 4, 5, 1),
('Electrical Engineering Bachelor', 2, 4, 6, 1),
('Physics Bachelor', 3, 4, 4, 2),
('Mathematics Master', 4, 2, 3, 2),
('Chemistry PhD', 5, 5, 7, 3),
('Economics Bachelor', 6, 4, 4, 1),
('Mechanical Engineering Master', 7, 2, 3, 2),
('Biology Bachelor', 8, 4, 5, 1),
('Political Science PhD', 9, 5, 6, 3),
('Statistics Master', 10, 2, 2, 2);



INSERT INTO Career (CareerName, DepartmentID, DurationYears, RequiredOptativeCourses, CareerLevelID) VALUES
('Electrical Engineering Master', 2, 2, 3, 2),
('Robotics Bachelor', 2, 4, 5, 1),
('Power Systems PhD', 2, 5, 6, 3),
('Electronic Devices Bachelor', 2, 4, 4, 1),
('Control Systems Master', 2, 2, 3, 2),
('Telecommunications PhD', 2, 5, 7, 3);

-- Inserting more data into Career table within Chemistry department
INSERT INTO Career (CareerName, DepartmentID, DurationYears, RequiredOptativeCourses, CareerLevelID) VALUES
('Chemistry Bachelor', 5, 4, 5, 1),
('Analytical Chemistry Master', 5, 2, 3, 2),
('Organic Chemistry PhD', 5, 5, 7, 3),
('Biochemistry Bachelor', 5, 4, 5, 1),
('Inorganic Chemistry Master', 5, 2, 3, 2),
('Physical Chemistry PhD', 5, 5, 7, 3);


-- Inserting more data into Career table for the Physics department
INSERT INTO Career (CareerName, DepartmentID, DurationYears, RequiredOptativeCourses, CareerLevelID) VALUES
('Physics Bachelor of Science', 3, 4, 5, 1),
('Physics Master in Quantum Mechanics', 3, 2, 3, 2),
('Physics PhD in Astrophysics', 3, 5, 7, 3);

-- Inserting data into Career table for the History department
INSERT INTO Career (CareerName, DepartmentID, DurationYears, RequiredOptativeCourses, CareerLevelID) VALUES
('History Bachelor', 10, 4, 5, 1),
('History Master in Ancient History', 10, 2, 3, 2),
('History PhD in Cultural Studies', 10, 5, 7, 3);


-- Inserting more data into Course table
INSERT INTO Course (CourseName, CareerID, Year, Semester, Optative, CourseCode) VALUES
('Database Systems', 1, 2, 1, 0, 'CS201'),
('Digital Signal Processing', 2, 2, 1, 0, 'EE201'),
('Quantum Mechanics', 3, 2, 1, 0, 'PHYS201'),
('Numerical Analysis', 4, 2, 1, 0, 'MATH301'),
('Inorganic Chemistry', 5, 3, 1, 0, 'CHEM301'),
('Macroeconomics', 6, 3, 1, 0, 'ECON201'),
('Thermodynamics', 7, 3, 1, 0, 'MECH301'),
('Cell Biology', 8, 4, 1, 0, 'BIO201'),
('Public Policy', 9, 4, 1, 0, 'POL201'),
('Machine Learning', 1, 4, 1, 0, 'CS301'),
('Introduction to Programming', 1, 1, 1, 0, 'CS101'),
('Circuit Analysis', 2, 1, 1, 0, 'EE101'),
('Classical Mechanics', 3, 1, 1, 0, 'PHYS101'),
('Advanced Calculus', 4, 1, 1, 0, 'MATH201'),
('Organic Chemistry', 5, 2, 1, 0, 'CHEM201'),
('Microeconomics', 6, 2, 1, 0, 'ECON101'),
('Fluid Mechanics', 7, 2, 1, 0, 'MECH201'),
('Genetics', 8, 3, 1, 0, 'BIO101'),
('International Relations', 9, 3, 1, 0, 'POL101'),
('Statistical Methods', 10, 3, 1, 0, 'STAT201'),
('Introduction to Programming', 1, 1, 1, 0, 'CS101'),
('Data Structures', 1, 2, 1, 0, 'CS201'),
('Algorithms', 1, 3, 2, 0, 'CS301'),
('Linear Algebra', 2, 1, 1, 0, 'MATH101'),
('Calculus I', 2, 1, 2, 0, 'MATH102'),
('Quantum Mechanics', 3, 3, 2, 0, 'PHYS303');


-- Inserting 10 rows into Professor table
INSERT INTO Professor (FirstName, LastName, Email, PhoneNumber) VALUES
('John', 'Doe', 'john.doe@gmail.com', '123-456-7890'),
('Jane', 'Smith', 'jane.smith@gmail.com', '987-654-3210'),
('Robert', 'Johnson', 'robert.johnson@gmail.com', '555-123-4567'),
('Emily', 'Williams', 'emily.williams@gmail.com', '789-012-3456'),
('Michael', 'Brown', 'michael.brown@gmail.com', '345-678-9012'),
('Olivia', 'Miller', 'olivia.miller@gmail.com', '678-901-2345'),
('Daniel', 'Davis', 'daniel.davis@gmail.com', '234-567-8901'),
('Sophia', 'Jones', 'sophia.jones@gmail.com', '890-123-4567'),
('William', 'White', 'william.white@gmail.com', '456-789-0123'),
('Emma', 'Anderson', 'emma.anderson@gmail.com', '012-345-6789');

-- Inserting into ProfessorCourse table
INSERT INTO ProfessorCourse (ProfessorID, CourseID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);



-- Inserting into CourseDependency table
INSERT INTO CoureDependency (CourseID, RequiredCourseID) VALUES
(1, 2),
(2, 3),
(4, 5),
(5, 6),
(7, 8),
(8, 9),
(10, 11),
(12, 13),
(14, 15),
(16, 17)
