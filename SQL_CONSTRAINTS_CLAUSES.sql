CREATE DATABASE UNIVERSITY_DB;
USE UNIVERSITY_DB;

CREATE TABLE STUDENTS(
STUDENT_ID INT,
FIRSTNAME VARCHAR(50),
LASTNAME VARCHAR(50),
EMAIL VARCHAR(100),
AGE INT,
CITY VARCHAR(50),
COURSEID INT
);



/*PART A - CONSTRAINTS
Modify the StudentID column to be the Primary Key and ensure it increments automatically.*/

ALTER TABLE STUDENTS
MODIFY STUDENT_ID INT PRIMARY KEY AUTO_INCREMENT;

SHOW CREATE TABLE STUDENTS;


-- 2.Ensure that the FirstName column can never be empty (NOT NULL).

ALTER TABLE STUDENTS
MODIFY COLUMN FIRSTNAME VARCHAR(50) NOT NULL;
SHOW CREATE TABLE STUDENTS;


-- 3.Add a constraint to make the Email column Unique so no two students have the same email.

ALTER TABLE STUDENTS
MODIFY EMAIL VARCHAR(100) UNIQUE;
SHOW CREATE TABLE STUDENTS;


-- 4.Add a Check Constraint to the Age column to ensure no student under the age of 17 can be enrolled.

ALTER TABLE STUDENTS
MODIFY AGE INT CHECK(AGE>=17);
SHOW CREATE TABLE STUDENTS;



-- 5.Set the Default value of the City column to 'Unknown'.

ALTER TABLE STUDENTS
MODIFY CITY VARCHAR(50) DEFAULT "UNKNOWN";
SHOW CREATE TABLE STUDENTS;


/*6.Create a separate table Courses with CourseID as Primary Key,
    then add a Foreign Key constraint to the Students table linking 
     CourseID to the Courses table.*/
     
     CREATE TABLE COURSES(COURSEID INT PRIMARY KEY);
    
    ALTER TABLE STUDENTS
    ADD FOREIGN KEY (COURSEID) REFERENCES COURSES(COURSEID);
    SHOW CREATE TABLE COURSES;
       SHOW CREATE TABLE STUDENTS;
       
/*Try to insert a student with an age of 15. 
Write down the error message you receive and explain why it failed.*/

-- INSERT INTO STUDENTS(STUDENT_ID,FIRSTNAME,LASTNAME,EMAIL,AGE,CITY,COURSEID) VALUES 
-- (101,"HEROLD","HERCULES","HERCULES@105",15,"NIZAMABAD",201);
 
 -- Error Code: 3819. Check constraint 'students_chk_1' is violateD.
 -- IT FAILED BECAUSE IT IS AGAINST THE CONSTRAINT IN AGE COLUMN(AGE>=17)
 
 
 -- 8.Drop the Unique constraint from the Email column.
 ALTER TABLE STUDENTS
 DROP INDEX EMAIL_2;
 SHOW CREATE TABLE STUDENTS;
 
 
/* 9. Remove the Primary Key from the Students table 
(Note: You may need to remove Auto_Increment first).*/
ALTER TABLE STUDENTS
MODIFY STUDENT_ID INT;
SHOW CREATE TABLE STUDENTS;
ALTER TABLE STUDENTS
DROP PRIMARY KEY;

ALTER TABLE STUDENTS
MODIFY COLUMN LASTNAME VARCHAR(50) NULL;
SHOW CREATE TABLE STUDENTS;




SHOW CREATE TABLE STUDENTS;
ALTER TABLE STUDENTS
DROP FOREIGN KEY students_ibfk_1;

ALTER TABLE COURSES
DROP PRIMARY KEY;

INSERT INTO Students VALUES 
(101, 'Aman', 'Sharma', 'aman@uni.com', 20, 'Delhi', 1),
(102, 'Sita', 'Verma', 'sita@uni.com', 22, 'Mumbai', 2),
(103, 'John', 'Doe', 'john@uni.com', 19, 'Delhi', 1),
(104, 'Anjali', 'Nair', 'anjali@uni.com', 21, 'Bangalore', 3),
(105, 'Rahul', 'Gupta', 'rahul@uni.com', 23, 'Mumbai', 2),
(106, 'Sanya', 'Malhotra', 'sanya@uni.com', 20, 'Delhi', 1),
(107, 'Kevin', 'Peter', 'kevin@uni.com', 24, 'Bangalore', 3);


-- PART B - CLAUSES

-- 1.Display all details of students who live in the city 'Delhi'.

SELECT * FROM STUDENTS
WHERE CITY="DELHI";

-- 2.List all unique cities where students are located.

SELECT DISTINCT(CITY) FROM STUDENTS;


-- 3.Show the FirstName and Age of all students, sorted by Age from youngest to oldest.

SELECT FIRSTNAME,AGE
FROM STUDENTS
ORDER BY AGE ASC; 

-- 4.Display the first 3 records from the Students table.

SELECT * FROM STUDENTS
LIMIT 3;

-- 5.List the FirstName and Email of students who are older than 20.
-- Rename the columns to Name and Contact in the output.

SELECT FIRSTNAME AS NAME,EMAIL AS CONTACT
FROM STUDENTS
WHERE AGE>20;

-- 6.Find all students who do not live in 'Bangalore'. 
-- Sort the results alphabetically by their FirstName.

SELECT * FROM STUDENTS
WHERE CITY != "BANGALORE"
ORDER BY FIRSTNAME;


-- 7.Show the FirstName and City of the 3 oldest students in the database.

SELECT FIRSTNAME,CITY
FROM STUDENTS
ORDER BY AGE DESC
LIMIT 3;


-- 8.List the FirstName and Age of students living in 'Mumbai' or 'Delhi'.
-- Sort them by Age descending, skip the first student, and show the next 2.

SELECT FIRSTNAME,AGE
FROM STUDENTS
WHERE CITY = "MUMBAI" OR CITY="DELHI"
ORDER BY AGE DESC
LIMIT 2 OFFSET 1;



-- 9.Display the FirstName and LastName of students whose Age is between 19 and 22.
-- Sort them by LastName and show only the top 4 results.

SELECT FIRSTNAME,LASTNAME
FROM STUDENTS
WHERE AGE BETWEEN 19 AND 22
ORDER BY LASTNAME
LIMIT 4;

-- 10.Find all unique ages of students who live in 'Delhi', 
-- sorted from oldest to youngest.

SELECT DISTINCT(AGE)
FROM STUDENTS
WHERE CITY="DELHI"
ORDER BY AGE DESC;










 





 
 





     
     
     
     




