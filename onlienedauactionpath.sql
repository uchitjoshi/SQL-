	-- 1. Studnet Table
    use OnlineEducationManagement;
Create	table Student(
	Student_ID INT PRIMARY KEY AUTO_INCREMENT ,
    Name Varchar(100) Not NUll,
    Email Varchar(100) Unique Not Null,
    Phone Varchar(15),
    Address Varchar(255),
    Date_of_Birth Date not Null,
    Enrollment_Date DATE NOT NULL,
    Gender ENUM('Male','Female','Other') NOT NULL
    );
   
    -- 2. Depatment table 
CREATE TABLE Department(
	Department_ID INT PRIMARY KEY AUTO_INCREMENT,
    Department_Name VARCHAR(100) UNIQUE NOT NULL,
    Head_of_Department VARCHAR(100) NOT NULL
);
SELECT * FROM Department;
-- 3. Course Table
CREATE TABLE Course (
    Course_ID INT PRIMARY KEY AUTO_INCREMENT,
    Course_Name VARCHAR(100) NOT NULL,
    Description TEXT,
    Credits INT NOT NULL,
    Duration INT NOT NULL,
    Department_ID INT NOT NULL,
    FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID) ON DELETE CASCADE
);
SELECT * FROM Course;

-- 4. Instructor Table
CREATE TABLE Instructor (
    Instructor_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15),
    Specialization VARCHAR(100),
    Department_ID INT NOT NULL,
    FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID) ON DELETE CASCADE
);
-- 5. Enrollment Table
CREATE TABLE Enrollment (
    Enrollment_ID INT PRIMARY KEY AUTO_INCREMENT,
    Student_ID INT NOT NULL,
    Course_ID INT NOT NULL,
    Enrollment_Date DATE NOT NULL,
    Grade VARCHAR(2),
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID) ON DELETE CASCADE,
    FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID) ON DELETE CASCADE
);

-- 6. Classroom Table
CREATE TABLE Classroom (
    Classroom_ID INT PRIMARY KEY AUTO_INCREMENT,
    Location VARCHAR(100) NOT NULL,
    Capacity INT NOT NULL
);

-- 7. Schedule Table
CREATE TABLE Schedule (
    Schedule_ID INT PRIMARY KEY AUTO_INCREMENT,
    Course_ID INT NOT NULL,
    Instructor_ID INT NOT NULL,
    Classroom_ID INT NOT NULL,
    Time_Slot VARCHAR(50) NOT NULL,
    Day_of_Week VARCHAR(20) NOT NULL,
    FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID) ON DELETE CASCADE,
    FOREIGN KEY (Instructor_ID) REFERENCES Instructor(Instructor_ID) ON DELETE CASCADE,
    FOREIGN KEY (Classroom_ID) REFERENCES Classroom(Classroom_ID) ON DELETE CASCADE
);

-- 8. Payment Table
CREATE TABLE Payment (
    Payment_ID INT PRIMARY KEY AUTO_INCREMENT,
    Student_ID INT NOT NULL,
    Payment_Date DATE NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    Payment_Method ENUM('Credit Card', 'Cash', 'Online') NOT NULL,
    Transaction_ID VARCHAR(100) UNIQUE NOT NULL,
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID) ON DELETE CASCADE
);
Select *FROM Payment;

-- 9. Exam Table
CREATE TABLE Exam (
    Exam_ID INT PRIMARY KEY AUTO_INCREMENT,
    Course_ID INT NOT NULL,
    Exam_Date DATE NOT NULL,
    Duration INT NOT NULL,
    Exam_Type ENUM('Final', 'Midterm') NOT NULL,
    FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID) ON DELETE CASCADE
);
-- 10. Exam_Result Table
CREATE TABLE Exam_Result (
    Result_ID INT PRIMARY KEY AUTO_INCREMENT,
    Exam_ID INT NOT NULL,
    Student_ID INT NOT NULL,
    Score DECIMAL(5, 2) NOT NULL,
    Grade VARCHAR(2),
    FOREIGN KEY (Exam_ID) REFERENCES Exam(Exam_ID) ON DELETE CASCADE,
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID) ON DELETE CASCADE
);
-- 11. Assignment Table
CREATE TABLE Assignment (
    Assignment_ID INT PRIMARY KEY AUTO_INCREMENT,
    Course_ID INT NOT NULL,
    Title VARCHAR(100) NOT NULL,
    Description TEXT,
    Due_Date DATE NOT NULL,
    FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID) ON DELETE CASCADE
);
-- 12. Assignment_Submission Table
CREATE TABLE Assignment_Submission (
    Submission_ID INT PRIMARY KEY AUTO_INCREMENT,
    Assignment_ID INT NOT NULL,
    Student_ID INT NOT NULL,
    Submission_Date DATE NOT NULL,
    File_Link VARCHAR(255),
    Grade VARCHAR(2),
    FOREIGN KEY (Assignment_ID) REFERENCES Assignment(Assignment_ID) ON DELETE CASCADE,
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID) ON DELETE CASCADE
);

-- 20 Students
INSERT INTO Student (Name, Email, Phone, Address, Date_of_Birth, Enrollment_Date, Gender) VALUES
('Alice Johnson', 'alice.johnson@example.com', '9801111111', 'Baneshwor, Kathmandu', '2001-03-12', '2023-01-10', 'Female'),
('Bikash Sharma', 'bikash.sharma@example.com', '9801111112', 'Patan, Lalitpur', '2000-07-25', '2022-07-15', 'Male'),
('Sita Rai', 'sita.rai@example.com', '9801111113', 'Pokhara, Kaski', '2002-11-05', '2023-02-20', 'Female'),
('David Lama', 'david.lama@example.com', '9801111114', 'Dharan, Sunsari', '1999-04-18', '2021-09-05', 'Male'),
('Priya Koirala', 'priya.koirala@example.com', '9801111115', 'Butwal, Rupandehi', '2001-12-30', '2023-03-01', 'Female'),
('Ramesh Thapa', 'ramesh.thapa@example.com', '9801111116', 'Bhaktapur', '2002-01-15', '2023-03-10', 'Male'),
('Anjali Shrestha', 'anjali.shrestha@example.com', '9801111117', 'Chitwan', '2000-02-20', '2022-06-05', 'Female'),
('Krishna Bhandari', 'krishna.bhandari@example.com', '9801111118', 'Janakpur', '2001-05-10', '2023-04-12', 'Male'),
('Maya Gurung', 'maya.gurung@example.com', '9801111119', 'Pokhara', '2002-07-15', '2023-05-01', 'Female'),
('Suman KC', 'suman.kc@example.com', '9801111120', 'Dhangadhi', '1999-10-05', '2021-08-01', 'Male'),
('Nisha Pandey', 'nisha.pandey@example.com', '9801111121', 'Biratnagar', '2001-03-18', '2023-01-15', 'Female'),
('Deepak Magar', 'deepak.magar@example.com', '9801111122', 'Lalitpur', '2000-09-09', '2022-08-01', 'Male'),
('Rekha Khadka', 'rekha.khadka@example.com', '9801111123', 'Dang', '2002-12-12', '2023-06-10', 'Female'),
('Suraj Yadav', 'suraj.yadav@example.com', '9801111124', 'Parsa', '1999-11-22', '2021-09-01', 'Male'),
('Kabita Oli', 'kabita.oli@example.com', '9801111125', 'Rolpa', '2001-06-30', '2023-02-10', 'Female'),
('Rajesh Adhikari', 'rajesh.adhikari@example.com', '9801111126', 'Morang', '2000-08-08', '2022-03-01', 'Male'),
('Sandhya KC', 'sandhya.kc@example.com', '9801111127', 'Nawalpur', '2002-04-15', '2023-04-01', 'Female'),
('Hari Kunwar', 'hari.kunwar@example.com', '9801111128', 'Banke', '1999-12-05', '2021-07-15', 'Male'),
('Laxmi Tamang', 'laxmi.tamang@example.com', '9801111129', 'Sindhupalchowk', '2001-02-11', '2023-03-20', 'Female'),
('Manish Jha', 'manish.jha@example.com', '9801111130', 'Siraha', '2000-05-19', '2022-05-05', 'Male');

-- 5 Departments
INSERT INTO Department (Department_Name, Head_of_Department) VALUES
('Computer Science', 'Dr. Nirmal Joshi'),
('Mathematics', 'Dr. Asha Shrestha'),
('Physics', 'Dr. Kiran Rana'),
('Chemistry', 'Dr. Prakash Singh'),
('Biology', 'Dr. Meera Shah');

-- 5 Courses
INSERT INTO Course (Course_Name, Description, Credits, Duration, Department_ID) VALUES
('CS301', 'Database Systems', 4, 60, 1),
('MATH301', 'Probability and Statistics', 3, 45, 2),
('PHY301', 'Electromagnetism', 4, 50, 3),
('CHEM301', 'Organic Chemistry', 3, 45, 4),
('BIO301', 'Genetics', 4, 60, 5);

-- 5 Instructors
INSERT INTO Instructor (Name, Email, Phone, Specialization, Department_ID) VALUES
('Prof. Ramesh Shrestha', 'ramesh.shrestha@example.com', '9811112200', 'Databases', 1),
('Prof. Anita Karki', 'anita.karki@example.com', '9811112201', 'Statistics', 2),
('Prof. Dipesh Rana', 'dipesh.rana@example.com', '9811112202', 'Electromagnetism', 3),
('Prof. Sunita Thapa', 'sunita.thapa@example.com', '9811112203', 'Organic Chemistry', 4),
('Prof. Kiran Gautam', 'kiran.gautam@example.com', '9811112204', 'Genetics', 5);

-- Classrooms
INSERT INTO Classroom (Location, Capacity) VALUES
('Block A - Room 101', 40),
('Block B - Room 202', 35),
('Block C - Room 303', 50),
('Block D - Room 404', 30),
('Block E - Room 505', 45);

-- Schedules (1 per course)
INSERT INTO Schedule (Course_ID, Instructor_ID, Classroom_ID, Time_Slot, Day_of_Week) VALUES
(1, 1, 1, '09:00 AM - 11:00 AM', 'Monday'),
(2, 2, 2, '11:30 AM - 01:00 PM', 'Tuesday'),
(3, 3, 3, '01:30 PM - 03:00 PM', 'Wednesday'),
(4, 4, 4, '10:00 AM - 12:00 PM', 'Thursday'),
(5, 5, 5, '02:00 PM - 04:00 PM', 'Friday');

-- Enrollments (students randomly assigned to courses)
INSERT INTO Enrollment (Student_ID, Course_ID, Enrollment_Date, Grade) VALUES
(1, 1, '2023-01-15', 'A'), (2, 2, '2023-01-16', 'B'), (3, 3, '2023-01-20', 'A'),
(4, 4, '2023-02-01', 'C'), (5, 5, '2023-02-05', 'B'),
(6, 1, '2023-02-06', 'B'), (7, 2, '2023-02-07', 'A'), (8, 3, '2023-02-08', 'C'),
(9, 4, '2023-02-09', 'B'), (10, 5, '2023-02-10', 'A'),
(11, 1, '2023-02-11', 'A'), (12, 2, '2023-02-12', 'B'), (13, 3, '2023-02-13', 'C'),
(14, 4, '2023-02-14', 'B'), (15, 5, '2023-02-15', 'A'),
(16, 1, '2023-02-16', 'B'), (17, 2, '2023-02-17', 'C'), (18, 3, '2023-02-18', 'A'),
(19, 4, '2023-02-19', 'A'), (20, 5, '2023-02-20', 'B');

-- Payments (1 per student)
INSERT INTO Payment (Student_ID, Payment_Date, Amount, Payment_Method, Transaction_ID) VALUES
(1, '2023-03-01', 1500, 'Credit Card', 'TXN2001'),
(2, '2023-03-01', 1500, 'Online', 'TXN2002'),
(3, '2023-03-01', 1500, 'Cash', 'TXN2003'),
(4, '2023-03-02', 1500, 'Credit Card', 'TXN2004'),
(5, '2023-03-02', 1500, 'Online', 'TXN2005'),
(6, '2023-03-03', 1500, 'Cash', 'TXN2006'),
(7, '2023-03-03', 1500, 'Credit Card', 'TXN2007'),
(8, '2023-03-03', 1500, 'Online', 'TXN2008'),
(9, '2023-03-04', 1500, 'Cash', 'TXN2009'),
(10, '2023-03-04', 1500, 'Credit Card', 'TXN2010'),
(11, '2023-03-04', 1500, 'Online', 'TXN2011'),
(12, '2023-03-05', 1500, 'Cash', 'TXN2012'),
(13, '2023-03-05', 1500, 'Credit Card', 'TXN2013'),
(14, '2023-03-05', 1500, 'Online', 'TXN2014'),
(15, '2023-03-06', 1500, 'Cash', 'TXN2015'),
(16, '2023-03-06', 1500, 'Credit Card', 'TXN2016'),
(17, '2023-03-06', 1500, 'Online', 'TXN2017'),
(18, '2023-03-07', 1500, 'Cash', 'TXN2018'),
(19, '2023-03-07', 1500, 'Credit Card', 'TXN2019'),
(20, '2023-03-07', 1500, 'Online', 'TXN2020');

-- Exams (1 per course)
INSERT INTO Exam (Course_ID, Exam_Date, Duration, Exam_Type) VALUES
(1, '2023-06-10', 120, 'Final'),
(2, '2023-06-12', 90, 'Midterm'),
(3, '2023-06-14', 120, 'Final'),
(4, '2023-06-16', 100, 'Midterm'),
(5, '2023-06-18', 120, 'Final');

-- Exam Results (for enrolled students)
INSERT INTO Exam_Result (Exam_ID, Student_ID, Score, Grade) VALUES
(1, 1, 85, 'A'), (1, 6, 75, 'B'), (1, 11, 90, 'A'), (1, 16, 70, 'C'),
(2, 2, 78, 'B'), (2, 7, 82, 'A'), (2, 12, 68, 'C'), (2, 17, 60, 'C'),
(3, 3, 88, 'A'), (3, 8, 72, 'B'), (3, 13, 65, 'C'), (3, 18, 92, 'A'),
(4, 4, 60, 'C'), (4, 9, 75, 'B'), (4, 14, 70, 'C'), (4, 19, 85, 'A'),
(5, 5, 95, 'A'), (5, 10, 80, 'B'), (5, 15, 77, 'B'), (5, 20, 66, 'C');

-- Assignments (1 per course)
INSERT INTO Assignment (Course_ID, Title, Description, Due_Date) VALUES
(1, 'Database Project', 'Design ER diagram and implement schema', '2023-05-15'),
(2, 'Statistics Homework', 'Solve probability problems', '2023-05-20'),
(3, 'Physics Assignment', 'Problems on electromagnetism', '2023-05-22'),
(4, 'Chemistry Lab Report', 'Organic compound analysis', '2023-05-25'),
(5, 'Genetics Assignment', 'Study Mendelian genetics', '2023-05-28');

-- Assignment Submissions
INSERT INTO Assignment_Submission (Assignment_ID, Student_ID, Submission_Date, File_Link, Grade) VALUES
(1, 1, '2023-05-14', 'http://assignments.com/db1', 'A'),
(1, 6, '2023-05-14', 'http://assignments.com/db2', 'B'),
(1, 11, '2023-05-14', 'http://assignments.com/db3', 'A'),
(1, 16, '2023-05-14', 'http://assignments.com/db4', 'C'),
(2, 2, '2023-05-19', 'http://assignments.com/stat1', 'B'),
(2, 7, '2023-05-19', 'http://assignments.com/stat2', 'A'),
(2, 12, '2023-05-19', 'http://assignments.com/stat3', 'C'),
(2, 17, '2023-05-19', 'http://assignments.com/stat4', 'C'),
(3, 3, '2023-05-21', 'http://assignments.com/phy1', 'A'),
(3, 8, '2023-05-21', 'http://assignments.com/phy2', 'B'),
(3, 13, '2023-05-21', 'http://assignments.com/phy3', 'C'),
(3, 18, '2023-05-21', 'http://assignments.com/phy4', 'A'),
(4, 4, '2023-05-24', 'http://assignments.com/chem1', 'C'),
(4, 9, '2023-05-24', 'http://assignments.com/chem2', 'B'),
(4, 14, '2023-05-24', 'http://assignments.com/chem3', 'C'),
(4, 19, '2023-05-24', 'http://assignments.com/chem4', 'A'),
(5, 5, '2023-05-27', 'http://assignments.com/bio1', 'A'),
(5, 10, '2023-05-27', 'http://assignments.com/bio2', 'B'),
(5, 15, '2023-05-27', 'http://assignments.com/bio3', 'B'),
(5, 20, '2023-05-27', 'http://assignments.com/bio4', 'C');
Select * FROM Assignment;

 use OnlineEducationManagement;
 
 SELECT Name FROM student
	WHERE NAME LIKE '%sa%';
SELECT NAME FROM Instructor 
	WHERE NAME LIKE '______';