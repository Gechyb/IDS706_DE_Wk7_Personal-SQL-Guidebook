# Personal SQL Guide Book

**Author:** Ogechukwu Ezenwa  
**Date:** October 20, 2025  
**Course:** IDS 706 – Data Engineering Systems  
**Assignment:** Build Your Personal SQL Guidebook
---

## Overview


## Project Structure 
```bash
.
├── .devcontainer
│   ├── devcontainer.json
│   └── docker-compose.yml
├── README.md
├── data
│   └── student_records.db
└── scripts
    └── basic_queries.sql
    └── create_table.sql
    
```

## Usage

1. Clone this repository:
    ```bash
    git clone <repository-url>
    ```
2. This project uses a devcontainer to provide a consistent development 
environment. When prompted, select “Reopen in Container.”  
    - All required extensions and packages for database access are pre-installed and configured automatically. 
    - By reopening the project in a compatible editor like VS Code and selecting “Reopen in Container,” you’ll have immediate access to all necessary tools—such as database drivers, CLI utilities, and VS Code extensions ensuring a smooth and reliable setup for development and analysis.
3. Browse the `scripts` directory for categorized SQL scripts.
4. The database can be found in `data` directory.
4. Copy and adapt queries as needed for your database.

## Requirements

- A SQL-compatible database (e.g. SQLite)
- Access to a database client or management tool (e.g SQLite Viewer)
- If sqlite3 isn't working on the terminal or isn't installed when using `devcontainer`, use the code below.

    ```bash
    sudo apt-get update && sudo apt-get install -y sqlite3
    ```

## Create database and Populate Tables

The `student_records.db` database is created with multiple related tables so it mimics a nice, realistic dataset to experiment with.

*This is run on the terminal to create the database*

```bash
sqlite3 student_records.db
```

*If you already created the table and want to update it, use the `DROP TABLE IF EXISTS` command to avoid errors.*

```sql
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS enrollments;
DROP TABLE IF EXISTS grades;
DROP TABLE IF EXISTS 
```

*To create tables in the database run the `CREATE TABLE` command* and to `INSERT INTO` populate the tables with row information.

```sql
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
```
 
*`UPDATE` rows in tables and include `WHERE` clause to specify the condition*

```sql

UPDATE students
SET major = 'Mathematics'
WHERE first_name = 'Alan' AND last_name = 'Turing';

SELECT * FROM students WHERE last_name = 'Turing';

```
## Dataset Information
The student record data is found in the `data` folder. This is a sample data (not an actual data) to help you practice sql queries quickly and effectively.

*Before you start running sql queries you can run this `.tables` to get the list of tables in the databse and `.schema` to get the metadata about the database schema.*

```sql
-- to get a list of all table names
.tables

-- to see the schema including tables and indices
.schema
```
This is the list of tables found in student record database.
- `courses` — course catalog
- `departments` — college departments
- `enrollments` - links students ↔ courses
- `grades` — stores grades per enrollment     
- `instructors` — course instructors information
- `students` — basic student info

## Running basic queries