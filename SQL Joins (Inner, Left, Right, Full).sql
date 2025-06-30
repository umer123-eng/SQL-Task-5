-- SQL INNER JOIN 
 -- TABLE 1 (Student table)
     
 CREATE TABLE Student
 ( Roll_no INT PRIMARY KEY,  -- common column ROLL_NO Using SQL JOINS, we can combine data from these tables based on their relationship
   Name VARCHAR(100),
   Address VARCHAR(100),
   Phone NUMERIC(10),
   Age VARCHAR(100)
   );
   
   -- TABLE 2(Student_Course table)
   CREATE TABLE Student_Course (
  Course_id INT,
  Roll_no INT,
  FOREIGN KEY (Roll_no) REFERENCES Student(Roll_no)
);


INSERT INTO Student(Roll_no,Name,Address,Phone,Age) VALUES
(1,'UMER','SURAT','2143658709','19'),
(2,'Amaan','Kim','2143568701','17'),
(3,'Aamir','Kosamba','2243658709','20'),
(4,'Hussian','Bharuch','2443658709','19'),
(5,'Saad','Bharuch','2143658788','21'),
(6,'Assad','Kim','214365509','18'),
(7,'Affan','Surat','2134658709','22'),
(8,'Hassan','Surat','2143658711','18'),
(9,'Pooja','	Kosamba','2143658705','17'),
(10,'Affi','Surat','2143658706','18');

INSERT INTO Student_Course (Course_id, Roll_no) VALUES
(101, 1),
(102, 2),
(103, 3),
(201, 4),
(202, 5),
(206, 6),
(106, 7),
(109, 8),
(110, 9),
(111, 10);


-- This query will show the names and age of students enrolled in different courses.  
SELECT Student_Course.Course_id,Student.name,Student.age FROM
Student 
INNER JOIN Student_Course
ON Student.Roll_no = Student_Course.Roll_no;


-- retrieves all rows from the Student table and the matching rows from the StudentCourse table based on the ROLL_NO column.
SELECT Student.name,Student_Course.Course_id
FROM Student
LEFT JOIN Student_Course
ON Student_Course.Roll_no = Student.Roll_no;

-- RIGHT JOIN retrieves all rows from the Student_Course table and the matching rows from the Student table based on the ROLL_NO column.
SELECT Student.phone,Student_Course.Course_id
FROM Student
RIGHT JOIN Student_Course
ON Student_Course.Roll_no = Student.Roll_no;


-- Simulate FULL JOIN in MySQL
--  Joining Multiple Tables with Full Join
-- LEFT JOIN part
SELECT s.NAME, s.age,s.Roll_no,s.phone,s.address,sc.COURSE_ID
FROM Student s
LEFT JOIN Student_Course sc ON s.ROLL_NO = sc.ROLL_NO
UNION
-- RIGHT JOIN part
SELECT s.NAME, s.age,s.Roll_no,s.phone,s.address,sc.COURSE_ID
FROM Student_Course sc
LEFT JOIN Student s ON s.ROLL_NO = sc.ROLL_NO;


-- Create Department table
CREATE TABLE Department (
    Dept_id INT PRIMARY KEY,
    Dept_name VARCHAR(50)
);

-- Insert data into Department table
INSERT INTO Department (Dept_id, Dept_name) VALUES
(10, 'IT'),
(30, 'HR'),
(40, 'TIS');

-- Create Employee table
CREATE TABLE Employee (
    Emp_id INT PRIMARY KEY,
    Emp_name VARCHAR(50),
    Dept_id INT,
    FOREIGN KEY (Dept_id) REFERENCES Department(Dept_id)
);

-- Insert data into Employee table
INSERT INTO Employee (Emp_id, Emp_name, Dept_id) VALUES
(1, 'Ram', 10),
(2, 'Jon', 30),
(3, 'Bob', 40); -- This will fail due to no matching Dept_id 50 in Department

SELECT 
  Employee.Emp_id,
  Employee.Emp_name,
  Employee.Dept_id,
  Department.Dept_id,
  Department.Dept_name
FROM 
  Employee
INNER JOIN 
  Department
ON 
  Employee.Dept_id = Department.Dept_id;


-- we will use the CROSS JOIN command to match the data of the Employee and Department table.
SELECT * FROM Employee
CROSS JOIN Department;

