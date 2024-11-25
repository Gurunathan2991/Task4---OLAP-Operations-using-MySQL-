Create DATABASE student_database;
USE Student_database;
Create Table StudentInfo ( STUDENT_ID int PRIMARY KEY,STUDENT_NAME varchar(100),DOB DATE,PHONE_NO Varchar(20),EMAIL_ID Varchar(50),ADDRESS varchar(250) );
Create table Coursesinfo ( COURSE_ID int PRIMARY KEY, COURSE_NAME varchar(100),COURSE_INSTRUCTOR_NAME Varchar(100));
Create table EnrollmentInfo
( ENROLLMENT_ID int primary key , 
STUDENT_ID int, COURSE_ID int, 
ENROLL_STATUS varchar(20),
foreign key (STUDENT_ID) REFERENCES StudentInfo(STUDENT_ID), 
foreign key (COURSE_ID) REFERENCES Coursesinfo (COURSE_ID));
INSERT INTO StudentInfo (STUDENT_ID, STUDENT_NAME, DOB, PHONE_NO, EMAIL_ID, ADDRESS) 
VALUES
(1001, 'Tom Hardy', '1993-08-23', '9999999991', 'tom101@gmail.com', 'Bangalore'),
(1002, 'Sam Joseph', '1994-08-23', '9999999992', 'sam102@gmail.com', 'Bangalore'),
(1003, 'Ben Issac', '1993-08-25', '9999999993', 'ben103@gmail.com', 'Chennai'),
(1004, 'Kane Lewis', '1993-10-23', '9999999994', 'kane104@gmail.com', 'Mumbai'),
(1005, 'Ian Robert', '1994-06-14', '9999999995', 'ian105@gmail.com', 'Delhi'),
(1006, 'John Austin', '1991-07-17', '9999999996', 'john106@gmail.com', 'Kochi');
INSERT INTO CoursesInfo (COURSE_ID, COURSE_NAME, COURSE_INSTRUCTOR_NAME) VALUES
(1, 'SQL', 'David'),
(2, 'Python', 'Artur'),
(3, 'AWS', 'Sebastian'),
(4, 'JAVA', 'Harry'),
(5, 'CSS', 'Jack');
INSERT INTO EnrollmentInfo (ENROLLMENT_ID, STUDENT_ID, COURSE_ID, ENROLL_STATUS) VALUES 
(10001, 1001, 1, 'ENROLLED'),
(10002, 1003, 2, 'ENROLLED'),
(10003, 1004, 4, 'ENROLLED'),
(10004, 1002, 3, 'ENROLLED'),
(10005, 1005, 3, 'NOT ENROLLED'),
(10006, 1006, 5, 'ENROLLED');
SELECT s.STUDENT_NAME, s.PHONE_NO, s.ADDRESS, e.ENROLL_STATUS
FROM StudentInfo s
JOIN EnrollmentInfo e
ON s.STUDENT_ID = e.STUDENT_ID
ORDER BY e.ENROLL_STATUS ASC;
SELECT c.COURSE_NAME, s.STUDENT_NAME
FROM EnrollmentInfo e
JOIN CoursesInfo c ON e.COURSE_ID = c.COURSE_ID
JOIN StudentInfo s ON s.STUDENT_ID = e.STUDENT_ID;
SELECT COURSE_NAME, COURSE_INSTRUCTOR_NAME
FROM CoursesInfo;
SELECT COURSE_ID, COURSE_NAME, COURSE_INSTRUCTOR_NAME
FROM CoursesInfo
WHERE COURSE_NAME = 'SQL';
SELECT COURSE_ID, COURSE_NAME, COURSE_INSTRUCTOR_NAME
FROM CoursesInfo
WHERE COURSE_NAME IN ('SQL', 'Python');
SELECT * FROM StudentInfo;

SELECT c.Course_Name, COUNT(e.course_id) AS numberofStud
FROM CoursesInfo c
JOIN EnrollmentInfo e ON c.course_id = e.course_ID
WHERE e.enroll_status = 'ENROLLED'
GROUP BY c.Course_Name;
SELECT e.COURSE_ID, c.COURSE_NAME, s.STUDENT_NAME
FROM CoursesInfo c
JOIN EnrollmentInfo e ON c.course_id = e.course_ID
JOIN StudentInfo s ON s.STUDENT_ID = e.STUDENT_ID
WHERE e.enroll_status = 'ENROLLED';

SELECT c.COURSE_INSTRUCTOR_NAME, COUNT(e.STUDENT_ID) AS numberofStud
FROM CoursesInfo c
JOIN EnrollmentInfo e ON c.course_id = e.course_ID
WHERE e.enroll_status = 'ENROLLED'
GROUP BY c.COURSE_INSTRUCTOR_NAME;

SELECT c.COURSE_INSTRUCTOR_NAME, COUNT(e.STUDENT_ID) AS numberofStud
FROM CoursesInfo c
JOIN EnrollmentInfo e ON c.course_id = e.course_ID
WHERE e.enroll_status = 'ENROLLED'
GROUP BY c.COURSE_INSTRUCTOR_NAME;

SELECT e.student_id, COUNT(c.course_id) AS numberofStud
FROM CoursesInfo c
JOIN EnrollmentInfo e ON c.course_id = e.course_ID
WHERE e.enroll_status = 'ENROLLED'
GROUP BY e.student_id
HAVING COUNT(c.course_id) > 1;

SELECT c.COURSE_ID, c.COURSE_NAME, COUNT(e.STUDENT_ID) AS numberofStud
FROM CoursesInfo c
JOIN EnrollmentInfo e ON c.course_id = e.course_ID
WHERE e.enroll_status = 'ENROLLED'
GROUP BY c.COURSE_ID, c.COURSE_NAME
ORDER BY COUNT(e.STUDENT_ID) DESC;

CREATE DATABASE postgrestudent_database;
USE postgrestudent_database;
CREATE TABLE Student_table (
    Student_id INT,
    Stu_name VARCHAR(100),
    Department VARCHAR(50),
    Email_id VARCHAR(50),
    Phone_no NUMERIC,
    Address VARCHAR(250),
    Date_Of_Birth DATE,
    Gender VARCHAR(30),
    Major VARCHAR(50),
    GPA NUMERIC,
    Grade VARCHAR(10)
);

INSERT INTO Student_table (Student_id, Stu_name, Department, email_id, Phone_no, Address, Date_Of_Birth, Gender, Major, GPA, Grade)
VALUES
('1', 'Muskaan Arya', 'Business', 'muskaan@gmail.com', '9999999991', 'Delhi', '1999-04-26', 'Female', 'MBA', '8.8', 'A'),
('2', 'Kundan Kumar', 'Arts and Sciences', 'kundan@gmail.com', '9999999992', 'Bangalore', '1992-07-15', 'Male', 'Mathematics', '8.6', 'A'),
('3', 'Rajat Nema', 'Business', 'Rajat@gmail.com', '9999999993', 'Delhi', '1995-06-28', 'Male', 'MBA', '8.5', 'A'),
('4', 'Devashish Negi', 'Arts and Sciences', 'Devashish@gmail.com', '9999999994', 'Dehradhun', '1997-01-12', 'Male', 'Physics', '7.6', 'B'),
('5', 'Karishma Roy', 'Arts and communication', 'Karishma@gmail.com', '9999999995', 'Mumbai', '1995-10-26', 'Female', 'Communication', '6.9', 'B'),
('6', 'Shivani Saini', 'Arts and Sciences', 'Shivani@gmail.com', '9999999996', 'Goa', '2000-01-03', 'Female', 'Computer Science', '5.5', 'C'),
('7', 'Himanshu Chawla', 'Human Development', 'Himanshu@gmail.com', '9999999997', 'Uttar Pradesh', '2000-10-05', 'Male', 'Counseling', '7.0', 'B'),
('8', 'Pranshu Yadav', 'Arts and communication', 'Pranshu@gmail.com', '9999999998', 'Gujarat', '1999-11-16', 'Male', 'Theatre', '9.2', 'A'),
('9', 'Sarthak Arya', 'Business', 'Sarthak@gmail.com', '9999999999', 'Rajasthan', '2003-08-14', 'Male', 'Accounting', '7.9', 'B'),
('10', 'Sanya Gambhir', 'Arts and Sciences', 'Sanya@gmail.com', '9999999911', 'Mumbai', '1997-03-12', 'Female', 'Physics', '4.9', 'C');

SELECT *
FROM Student_info
ORDER BY GPA DESC ,Grade;
 
Select * from Student_table 
 where Gender = 'Male';
SELECT * 
FROM Student_table 
WHERE GPA = 5.0;
UPDATE Student_table
SET email_id = "Sanya@gmail.com", Grade = "D"
WHERE Student_id = 10;
UPDATE Student_table
SET email_id = 'Sanyaa@gmail.com', Grade = 'D'
WHERE Student_id = 10;

SELECT Stu_name, date_part('year',age(Date_Of_Birth)) as Age
FROM Student_table
Where Grade = 'B';
SELECT Stu_name, 
       TIMESTAMPDIFF(YEAR, Date_Of_Birth, CURDATE()) AS Age
FROM Student_table
WHERE Grade = 'B';
SELECT Department, Gender, Avg(GPA)
FROM Student_table
GROUP BY 1,2;
ALTER TABLE Student_table
RENAME TO Student_info;
SELECT * FROM Student_info;
SELECT Stu_name, GPA
FROM Student_info
WHERE GPA =(SELECT MAX(GPA) FROM Student_info);

CREATE DATABASE EventsManagement;
USE EventsManagement;

CREATE TABLE Events (
    Event_Id INT,
    Event_Name VARCHAR(30),
    Event_Date DATE,
    Event_Location VARCHAR(100),
    Event_Description VARCHAR(200),
    PRIMARY KEY (Event_Id)
);

CREATE TABLE Attendees (
    Attendee_Id INT,
    Attendee_Name VARCHAR(30),
    Attendee_Phone NUMERIC,
    Attendee_Email VARCHAR(30),
    Attendee_City VARCHAR(20),
    PRIMARY KEY (Attendee_Id)
);
CREATE TABLE Registrations (
    Registration_Id INT,
    Event_Id INT,
    Attendee_Id INT,
    Registration_Date DATE,
    Registration_Amount NUMERIC,
    PRIMARY KEY (Registration_Id),
    FOREIGN KEY (Event_Id) REFERENCES Events(Event_Id),
    FOREIGN KEY (Attendee_Id) REFERENCES Attendees(Attendee_Id)
);

INSERT INTO Events 
(Event_Id, Event_Name, Event_Date, Event_Location, Event_Description) VALUES
('101', 'Nakka mukka', '2024-03-03', 'Mumbai', 'Music Show'), 
('102', 'Comicstand', '2023-11-19', 'Bangalore', 'Comedy'),
('103', 'IIMF', '2023-11-12', 'Kerala', 'Music Show'),
('104', 'Lubberpandhu', '2024-01-06', 'Chennai', 'Comedy'),
('105', 'Leo', '2024-02-13', 'Kolkata', 'Thriller');

SELECT * FROM Events;

INSERT INTO Attendees (Attendee_Id, Attendee_Name, Attendee_Phone, Attendee_Email, Attendee_City) VALUES 
('1001', 'Guru', '9999999991', 'gurumaveric@gmail.com', 'Delhi'),
('1002', 'ram', '9999999992', 'Ram@gmail.com', 'Delhi'),
('1003', 'gethu', '9999999993', 'gethu@gmail.com', 'Mumbai'),
('1004', 'mathangi', '9999999994', 'mathu@gmail.com', 'Uttar Pradesh'),
('1005', 'suriya', '9999999995', 'suriya@gmail.com', 'Mumbai'),
('1006', 'Shivaranjani', '9999999996', 'Shiva@gmail.com', 'Goa'),
('1007', 'shishanth', '9999999997', 'shish@gmail.com', 'Uttrakhand'),
('1008', 'amizhdhini', '9999999998', 'amizh@gmail.com', 'Delhi');

SELECT * FROM Attendees;

INSERT INTO Registrations 
(Registration_Id, Event_Id, Attendee_Id, Registration_Date, Registration_Amount) VALUES 
('10001', '101', '1001', '2023-10-12', '7500'),
('10002', '102', '1003', '2023-09-25', '1000'),
('10003', '103', '1002', '2023-10-29', '2000'),
('10004', '104', '1004', '2023-10-20', '500'),
('10005', '101', '1005', '2023-09-10', '7500'),
('10006', '103', '1008', '2023-09-15', '2000'),
('10007', '101', '1007', '2023-11-01', '7500'),
('10008', '102', '1006', '2023-11-05', '1000');

SELECT * FROM Registrations;

Insert INTO Events (Event_Id, Event_Name, Event_Date, Event_Location, Event_Description) VALUES 
('106', 'Unheard Diaries', '2023-10-29', 'Delhi', 'Storytelling');

UPDATE Events
SET Event_Location = 'Bangalore' WHERE Event_Id = '104';

DELETE FROM Events WHERE Event_Id = '105';

INSERT INTO Attendees (Attendee_Id, Attendee_Name, Attendee_Phone, Attendee_Email, Attendee_City) 
VALUES ('1009', 'shriram', '9899999999', 'shri@gmail.com', 'Tamil Nadu');

INSERT INTO Registrations 
(Registration_Id, Event_Id, Attendee_Id, Registration_Date, Registration_Amount) 
VALUES ('10009', '101', '1009', '2024-11-11', '7500');

WITH Event1 AS(
SELECT E.Event_id, E.event_name, E.event_date, E.event_location,
SUM(R.registration_amount) OVER(PARTITION by E.event_id) AS Amtgenperevent
FROM Events E JOIN Registrations R ON E.event_id = R.event_id
JOIN Attendees A ON A.attendee_id = R.attendee_id)
SELECT Event_id, event_name, event_location, Amtgenperevent 
FROM Event1
GROUP BY 1,2,3,4;

CREATE DATABASE SalesData ;
USE salesdata;
CREATE TABLE Sales_sample (Product_Id INT, Region VARCHAR(50), On_date DATE, 
Sales_Amount NUMERIC);

INSERT INTO Sales_sample (Product_Id, Region, On_date, Sales_Amount) VALUES 
('1', 'East', '2024-10-10', '20000'),
('2', 'West', '2024-09-19', '50000'),
('2', 'East', '2024-10-21', '40000'),
('3', 'North', '2024-09-20', '15000'),
('4', 'North', '2024-08-06', '45000'),
('2', 'South', '2024-08-25', '45000'),
('5', 'North', '2024-11-23', '20000'),
('5', 'West', '2024-11-11', '60000'),
('3', 'East', '2024-09-19', '50000'),
('1', 'West', '2024-09-29', '70000');
Select * from Sales_Sample;

SELECT Region, Product_Id, Sum(Sales_Amount) AS Sales_Amount
FROM Sales_Sample
GROUP BY 1,2
ORDER BY Region, Product_Id, Sales_Amount;

SELECT Region, Product_Id, Sum(Sales_Amount) AS Sales_Amount
FROM Sales_Sample
GROUP BY ROLLUP (1,2)
ORDER BY Region;

SELECT Region, Product_Id, On_Date, SUM(Sales_Amount) AS Sales_Amount
FROM Sales_Sample
GROUP BY Region, Product_Id, On_Date WITH ROLLUP
ORDER BY Region, Product_Id, On_Date;

SELECT Region, Product_Id, On_Date, SUM(Sales_Amount) AS Sales_Amount
FROM Sales_Sample
WHERE Region = 'South' 
  AND Product_Id = 2 
  AND On_Date BETWEEN STR_TO_DATE('2024-08-20', '%Y-%m-%d') 
                  AND STR_TO_DATE('2024-10-20', '%Y-%m-%d')
GROUP BY Region, Product_Id, On_Date
ORDER BY Region, Product_Id, On_Date, Sales_Amount;































