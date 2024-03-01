USE University_DB;

SELECT *
FROM Department

SELECT *
FROM Career

SELECT *
FROM Professor

SELECT *
FROM Careerlevel

SELECT *
FROM CoureDependency

SELECT *
FROM ProfessorCourse

SELECT *
FROM Course

--**1. Data Filtering:**
--- What are the careers that belong to a specific department (ID = 1)?
SELECT *
FROM Career c
JOIN Department dept
	ON c.DepartmentID = dept.DepartmentID AND dept.DepartmentID = 1

--- What are the names and years of the required courses?
SELECT CourseName,
	Year
FROM Course
WHERE Optative = 1

--**2. Sorting Data:**
--- How can we sort professor names in descending order?
SELECT FirstName + ' ' + LastName AS FullName
FROM Professor
ORDER BY FullName DESC

--- How can we sort course names and career names in ascending and descending order, respectively?
SELECT CourseName,
	CareerName
FROM Course co
JOIN Career ca
	ON co.CareerID = ca.CareerID
ORDER BY CourseName,
	CareerName DESC

--**3. Aggregating Data:**
--- How many courses are there?
SELECT COUNT(CourseName) 'Number Of Courses'
FROM Course

--- What is the total number of years of study for all careers?
SELECT SUM(DurationYears)
FROM Career

--**4. Grouping Data:**
--- How many careers are there in each department?
SELECT COUNT(CareerName) '# Careers',
	dept.DepartmentName
FROM Career ca
JOIN Department dept
	ON ca.DepartmentID = dept.DepartmentID
GROUP BY dept.DepartmentName

--- What is the average year of teaching for each course?
SELECT AVG(Year) 'Average Year',
	CourseName
FROM Course
GROUP BY CourseName

--**5. Joining Data:**
--- How can we extract the names of professors and the names of the courses they teach?
SELECT FirstName + ' ' + LastName AS FullName,
	CourseName
FROM Professor pro
JOIN ProfessorCourse pro_c
	ON pro.ProfessorID = pro_c.ProfessorID
JOIN Course c
	ON pro_c.CourseID = c.CourseID

--- How can we extract the names of courses and the careers they belong to for the undergraduate level?
SELECT CourseName,
	CareerName
FROM Course co
JOIN Career ca
	ON co.CareerID = ca.CareerID
JOIN Careerlevel cl
	ON ca.CareerlevelID = cl.CareerlevelID
WHERE cl.CareerlevelName = 'Undergraduate'

--**6. Using SQL Functions:**
--- How can we extract the first 5 characters of course names?
SELECT LEFT(CourseName, 5) ShortCourseName
FROM Course

--- How can we extract the year of teaching for each course? xx
SELECT CourseName,
	Year
FROM Course;

--**7. Using Subqueries:**
--- What are the names of the courses taught by a specific professor (ID = 1)?
SELECT CourseName
FROM Course c
JOIN ProfessorCourse pro_c
	ON c.CourseID = pro_c.CourseID
JOIN Professor pro
	ON pro_c.ProfessorID = pro.ProfessorID
WHERE pro.ProfessorID = 1

SELECT CourseName
FROM Course c
JOIN ProfessorCourse pro_c
	ON c.CourseID = pro_c.CourseID
WHERE ProfessorID = (
		SELECT ProfessorID
		FROM Professor
		WHERE ProfessorID = 1
		)

--- What are the names of the careers that have a duration longer than the average career duration?
SELECT CareerName
FROM Career
WHERE DurationYears > (
		SELECT AVG(DurationYears)
		FROM Career
		)

--**8. Using Joins:**
--- How can we extract the names of courses and the names of professors who teach them?
SELECT CourseName,
	FirstName + ' ' + LastName AS FullName
FROM Course
JOIN ProfessorCourse
	ON Course.CourseID = ProfessorCourse.CourseID
JOIN Professor
	ON ProfessorCourse.ProfessorID = Professor.ProfessorID

--- How can we extract the names of departments and the names of careers that belong to them?
SELECT DepartmentName,
	CareerName
FROM Department
JOIN Career
	ON Department.DepartmentID = Career.DepartmentID

--**9. Updating Data:**
--- How can we change the name of a specific course (ID = 1)?
UPDATE Course
SET CourseName = 'Database Systems (DB_SYS)'
WHERE CourseID = 1

--- How can we change the email of a specific professor (ID = 1)?
UPDATE Professor
SET Email = 'johndoe123@gmail.com'
WHERE ProfessorID = 1

--**10. Deleting Data:**
--- How can we delete a specific course (ID = 1)?
DELETE
FROM ProfessorCourse
WHERE CourseID = 1;

--- How can we delete a specific professor (ID = 1)?
DELETE
FROM Professor
WHERE ProfessorID = 1;