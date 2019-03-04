use final;

# 1) simple retrieval
SELECT PersonName
FROM person
WHERE PersonID <= 1;

# 2) compound condition (AND, OR, NOT)
SELECT TextbookTitle
FROM textbook
WHERE TextbookISBN = 203 OR TextbookISBN = 204;

# 3) computed fields
SELECT SUM(FacultySalary) AS AddedSalary
FROM Faculty
WHERE FacultySalary >= 0; 

# 4) built in sql function (min)
SELECT MIN(StudentGPA) AS LowestGPA
FROM Student;

# 5) built in sql function (max)
SELECT MAX(StudentGPA) AS HighestGPA
FROM Student;

# 6) built in sql function (count)
SELECT COUNT(PersonID) AS AmountOfPersons
FROM Person;

# 7) subquery
SELECT SectionID
FROM Section
WHERE RoomNumber = (SELECT RoomNumber FROM classrooms WHERE RoomNumber = 304);

# 8) grouping
SELECT CourseName
FROM course
WHERE TextbookISBN < 205
GROUP BY CourseID;

# 9) sorting
SELECT CourseName
FROM course
WHERE TextbookISBN < 205
ORDER BY CourseID;

# 10) joining multiple tables (queries from more than one table)
SELECT section.SectionID, person.PersonID
FROM section, person
WHERE section.PersonID = person.PersonID;

# 11) union
SELECT StudentName FROM Student
WHERE StudentName LIKE 'A%'
UNION
SELECT FacultyName FROM Faculty
WHERE FacultyName LIKE 'A%';

# 12) special operators (LIKE, IN, BETWEEN, etc)
SELECT FacultyName
FROM Faculty
WHERE FacultyTitle LIKE 'Head%';

# 13) views
CREATE VIEW FacultyHeads AS
SELECT FacultySalary
FROM Faculty
WHERE FacultySalary >= 7500;

# 14) updating tables
UPDATE faculty
SET FacultySalary = 65000
WHERE FacultyName = 'Mary George';

# 15) delete query
DELETE FROM course
WHERE CourseName = 'Calculus II';
