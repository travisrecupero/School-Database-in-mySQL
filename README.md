# CST171-Database-Applications-Concepts---Final-Project-
Complete database coded in mySQL with example queries, model, and ERD. 

The school system consists of 10 tables: College, Buildings, Classrooms, Sections, Courses, Textbooks, Persons, Faculty, Students, and Interns. 

**Note:**

  All the tables have foreign keys besides Buildings and Textbooks. 

**Format (Tables):**

  The College has a name and id. 
  The Buildings each have a name. 
  The Classrooms will indicate whether there is a projector, while also giving the building and projector. 
  The Sections each have a course, building, person, and classroom. 
  The Courses have names and textbooks ISBN’s. 
  The Textbooks have a title, author, and ISBN. 
  The Persons have names and phone numbers. 
  The Faculty members have titles, names, and salaries. 
  The Students have grade point averages and names.
  The Interns have an hourly wage, and id. 

**Summary of format:**

  Most of these tables have ids for the primary key so that the row can be uniquely identified. I also made unique indices for them. The foreign keys link the two tables together. For example, each student/faculty has a person id from the Person table, this is because a student is also a person at the college. Every time this happens, it’s REFERENCING the Person table. The creation of the tables was all done using CREATE TABLE. Then I inserted all the data using INSERT followed by VALUES. 
  
	For the queries I included simple retrieval, compound conditions, computed fields, built-in SQL functions, subqueries, grouping, sorting, joining tables, union, special operators, views, updates, and deletes. All the results were successful, which I displayed in a word file called Final Queries. This file contains screenshots with the correlating query number. In total there were 15 queries, showing actions you can perform in MySQL.  
