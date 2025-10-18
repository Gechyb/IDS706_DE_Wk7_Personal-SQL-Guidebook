# Personal SQL Guide Bool

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


# IDS706_DE_Wk6_Personal-SQL-Guidebook

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
