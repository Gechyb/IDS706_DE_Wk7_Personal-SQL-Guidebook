/*
  Name: Student Record Database for practicing SQL queries
*/

/* Create the database in terminal: */
-- sqlite3 student_records.db

/* Drop tables if they already exist */
DROP TABLE IF EXISTS grades;
DROP TABLE IF EXISTS enrollments;
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS instructors;
DROP TABLE IF EXISTS departments;

/* Departments table */
CREATE TABLE departments (
    dept_id INTEGER PRIMARY KEY AUTOINCREMENT,
    dept_name TEXT
);

INSERT INTO departments (dept_name) VALUES
('Mathematics'),
('Computer Science'),
('Physics'),
('Chemistry'),
('Biology'),
('Engineering'),
('Data Science'),
('Statistics'),
('Economics');

/* Instructors table */
CREATE TABLE instructors (
    instructor_id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT,
    last_name TEXT,
    dept_id INTEGER,
    FOREIGN KEY(dept_id) REFERENCES departments(dept_id)
);

INSERT INTO instructors (first_name, last_name, dept_id) VALUES
('John', 'Smith', 2),
('Alice', 'Johnson', 1),
('Robert', 'Patel', 4),
('Emily', 'Adams', 2),
('Michael', 'Nguyen', 3);

/* Students table with extra fields */
CREATE TABLE students (
    student_id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    age INTEGER,
    major TEXT,
    email TEXT,
    enrollment_date DATE
);

INSERT INTO students (first_name, last_name, age, major, email, enrollment_date) VALUES
('Ada', 'Lovelace', 27, 'Mathematics', 'ada.lovelace@example.com', '2023-01-10'),
('Alan', 'Turing', 29, 'Computer Science', 'alan.turing@example.com', '2022-09-15'),
('Katherine', 'Johnson', 34, 'Physics', 'katherine.johnson@example.com', '2023-02-05'),
('Grace', 'Hopper', 32, 'Computer Science', 'grace.hopper@example.com', '2022-09-20'),
('John', 'von Neumann', 30, 'Mathematics', 'john.neumann@example.com', '2023-01-12'),
('Marie', 'Curie', 35, 'Chemistry', 'marie.curie@example.com', '2022-08-25'),
('Isaac', 'Newton', 28, 'Physics', 'isaac.newton@example.com', '2023-03-01'),
('Rosalind', 'Franklin', 31, 'Biology', 'rosalind.franklin@example.com', '2022-09-10'),
('Barbara', 'McClintock', 33, 'Genetics', 'barbara.mcclintock@example.com', '2023-02-18'),
('Carl', 'Gauss', 29, 'Mathematics', 'carl.gauss@example.com', '2022-09-05'),
('Charles', 'Babbage', 36, 'Engineering', 'charles.babbage@example.com', '2023-01-22'),
('Dorothy', 'Vaughan', 33, 'Mathematics', 'dorothy.vaughan@example.com', '2022-09-12'),
('Erwin', 'Schrodinger', 37, 'Physics', 'erwin.schrodinger@example.com', '2023-03-05'),
('Niels', 'Bohr', 38, 'Physics', 'niels.bohr@example.com', '2022-08-30'),
('Rosalyn', 'Yalow', 40, 'Biophysics', 'rosalyn.yalow@example.com', '2023-02-12'),
('Adaeze', 'Okafor', 25, 'Data Science', 'adaeze.okafor@example.com', '2023-01-18'),
('Tunde', 'Adebayo', 26, 'Computer Engineering', 'tunde.adebayo@example.com', '2022-09-25'),
('Chioma', 'Eze', 24, 'Statistics', 'chioma.eze@example.com', '2023-03-10'),
('David', 'Goldstein', 27, 'Chemistry', 'david.goldstein@example.com', '2022-08-28'),
('Ngozi', 'Okonjo', 29, 'Economics', 'ngozi.okonjo@example.com', '2023-01-05');

/* Courses table with department and semester */
CREATE TABLE courses (
    course_id INTEGER PRIMARY KEY AUTOINCREMENT,
    course_name TEXT NOT NULL,
    instructor_id INTEGER,
    credits INTEGER,
    department_id INTEGER,
    semester TEXT,
    FOREIGN KEY(instructor_id) REFERENCES instructors(instructor_id),
    FOREIGN KEY(department_id) REFERENCES departments(dept_id)
);

INSERT INTO courses (course_name, instructor_id, credits, department_id, semester) VALUES
('Data Structures', 1, 3, 2, 'Fall 2023'),
('Linear Algebra', 2, 4, 1, 'Fall 2023'),
('Organic Chemistry', 3, 4, 4, 'Spring 2023'),
('Machine Learning', 4, 3, 2, 'Spring 2023'),
('Quantum Mechanics', 5, 4, 3, 'Fall 2023');

/* Enrollments linking students and courses */
CREATE TABLE enrollments (
    enrollment_id INTEGER PRIMARY KEY AUTOINCREMENT,
    student_id INTEGER,
    course_id INTEGER,
    FOREIGN KEY(student_id) REFERENCES students(student_id),
    FOREIGN KEY(course_id) REFERENCES courses(course_id)
);

INSERT INTO enrollments (student_id, course_id) VALUES
(1, 1), (1, 4),
(2, 1), (2, 5),
(3, 2), (3, 5),
(4, 1), (4, 4),
(5, 2), (5, 5),
(6, 3), (6, 5),
(7, 2), (7, 4),
(8, 3), (8, 4),
(9, 1), (9, 3),
(10, 2), (10, 4),
(11, 1), (11, 5),
(12, 2), (12, 4),
(13, 3), (13, 5),
(14, 1), (14, 2),
(15, 3), (15, 4),
(16, 2), (16, 5),
(17, 1), (17, 3),
(18, 2), (18, 4),
(19, 3), (19, 5),
(20, 4), (20, 1);

/* Grades table with semester info */
CREATE TABLE grades (
    grade_id INTEGER PRIMARY KEY AUTOINCREMENT,
    enrollment_id INTEGER,
    grade TEXT,
    FOREIGN KEY(enrollment_id) REFERENCES enrollments(enrollment_id)
);

INSERT INTO grades (enrollment_id, grade) VALUES
(1, 'A'), (2, 'B+'), (3, 'A'), (4, 'A-'),
(5, 'B'), (6, 'A'), (7, 'B+'), (8, 'A'),
(9, 'A-'), (10, 'B'), (11, 'B+'), (12, 'A'),
(13, 'A-'), (14, 'B+'), (15, 'A'), (16, 'B'),
(17, 'A'), (18, 'A-'), (19, 'B+'), (20, 'A');

-- Update a row and verify using SELECT
UPDATE students
SET major = 'Mathematics'
WHERE first_name = 'Alan' AND last_name = 'Turing';

SELECT * FROM students WHERE last_name = 'Turing';
