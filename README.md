# School-Database-in-mySQL

This project encompasses a comprehensive database model developed in MySQL, showcasing example queries, a database schema, and an Entity-Relationship Diagram (ERD).

## Tables

The database comprises 10 tables:

- **College**
- **Buildings**
- **Classrooms**
- **Sections**
- **Courses**
- **Textbooks**
- **Persons**
- **Faculty**
- **Students**
- **Interns**

## Note

- All tables, except Buildings and Textbooks, possess foreign keys that establish relational connections.

- Format (Tables):

  - **College**: Holds names and IDs.
  - **Buildings**: Each building has a name.
  - **Classrooms**: Indicates projector presence, along with the building and room  - number.
  - **Sections**: Contains course, building, person, and classroom details.
  - **Courses**: Includes course names and associated textbook ISBNs.
  - **Textbooks**: Comprises title, author, and ISBN information.
  - **Persons**: Contains names and phone numbers.
  - **Faculty**: Includes titles, names, and salaries of faculty members.
  - **Students**: Stores grade point averages and student names.
  - **Interns**: Contains hourly wage and IDs.


## Summary of Format:

- Most tables are designed with unique IDs as primary keys for unique identification, accompanied by unique indices.

- Foreign keys establish relationships between tables; for instance, students/faculty have a person ID from the Person table, as a student is also a person within the college.

- Table creation was done using the `CREATE TABLE` statement, followed by data insertion via `INSERT INTO` and `VALUES`.

- A range of queries was executed, covering basic retrieval, compound conditions, computed fields, SQL functions, subqueries, grouping, sorting, table joins, unions, special operators, views, updates, and deletes. All queries were successful and documented in a Word file named 'Final Queries.' This file contains query screenshots with corresponding numbers, totaling 15 queries, showcasing diverse actions performable in MySQL.

