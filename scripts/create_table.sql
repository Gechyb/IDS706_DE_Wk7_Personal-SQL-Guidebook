/*
  Name: Student Database for practicing sql queries
*/

/* Create the database: This is run on the terminal*/
-- sqlite3 student_records.db

/* Drop existing tables: Run this only if table already exists */
-- DROP TABLE IF EXISTS students;
-- DROP TABLE IF EXISTS courses;
-- DROP TABLE IF EXISTS enrollments;
-- DROP TABLE IF EXISTS grades;

/*Create Table
You can run this on the terminal when the sqlite3 interactive session opens or 
You can run this directly from this file by highlighting and choose "Run selected query"
*/
-- Table: students
CREATE TABLE students (
    student_id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    age INTEGER,
    major TEXT
);

-- Table: courses
CREATE TABLE courses (
    course_id INTEGER PRIMARY KEY AUTOINCREMENT,
    course_name TEXT NOT NULL,
    instructor TEXT NOT NULL,
    credits INTEGER
);

-- Table: enrollments
CREATE TABLE enrollments (
    enrollment_id INTEGER PRIMARY KEY AUTOINCREMENT,
    student_id INTEGER,
    course_id INTEGER,
    FOREIGN KEY(student_id) REFERENCES students(student_id),
    FOREIGN KEY(course_id) REFERENCES courses(course_id)
);

-- Table: grades
CREATE TABLE grades (
    grade_id INTEGER PRIMARY KEY AUTOINCREMENT,
    enrollment_id INTEGER,
    grade TEXT,
    FOREIGN KEY(enrollment_id) REFERENCES enrollments(enrollment_id)
);

/*Insert sample data to the created table */
INSERT INTO students (first_name, last_name, age, major) VALUES
('Ada', 'Lovelace', 27, 'Mathematics'),
('Alan', 'Turing', 29, 'Computer Science'),
('Katherine', 'Johnson', 34, 'Physics'),
('Grace', 'Hopper', 32, 'Computer Science'),
('John', 'von Neumann', 30, 'Mathematics'),
('Marie', 'Curie', 35, 'Chemistry'),
('Isaac', 'Newton', 28, 'Physics'),
('Rosalind', 'Franklin', 31, 'Biology'),
('Barbara', 'McClintock', 33, 'Genetics'),
('Carl', 'Gauss', 29, 'Mathematics'),
('Charles', 'Babbage', 36, 'Engineering'),
('Dorothy', 'Vaughan', 33, 'Mathematics'),
('Erwin', 'Schrodinger', 37, 'Physics'),
('Niels', 'Bohr', 38, 'Physics'),
('Rosalyn', 'Yalow', 40, 'Biophysics'),
('Adaeze', 'Okafor', 25, 'Data Science'),
('Tunde', 'Adebayo', 26, 'Computer Engineering'),
('Chioma', 'Eze', 24, 'Statistics'),
('David', 'Goldstein', 27, 'Chemistry'),
('Ngozi', 'Okonjo', 29, 'Economics');

INSERT INTO courses (course_name, instructor, credits) VALUES
('Data Structures', 'Dr. Smith', 3),
('Linear Algebra', 'Prof. Johnson', 4),
('Organic Chemistry', 'Dr. Patel', 4),
('Machine Learning', 'Dr. Adams', 3),
('Quantum Mechanics', 'Dr. Nguyen', 4);

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

INSERT INTO grades (enrollment_id, grade) VALUES
(1, 'A'), (2, 'B+'), (3, 'A'), (4, 'A-'),
(5, 'B'), (6, 'A'), (7, 'B+'), (8, 'A'),
(9, 'A-'), (10, 'B'), (11, 'B+'), (12, 'A'),
(13, 'A-'), (14, 'B+'), (15, 'A'), (16, 'B'),
(17, 'A'), (18, 'A-'), (19, 'B+'), (20, 'A');

