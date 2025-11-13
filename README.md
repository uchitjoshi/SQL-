# 🎓 Online Education Management System (SQL Project)

## 📘 Overview
The **Online Education Management System** is a SQL-based database project designed to efficiently manage and analyze key aspects of an educational institution.  
It includes well-structured relational tables for **students, departments, instructors, courses, enrollments, classrooms, schedules, exams, assignments, and payments** — with realistic data and advanced analytical queries.

This project demonstrates core **Database Design**, **Data Manipulation (DML)**, **Constraints & Relationships**, and **Analytical SQL Querying** in **MySQL**.

---

## 🗂️ Database Information

**Database Name:** `OnlineEducationManagement`  
**SQL Platform:** MySQL  
**Entities:** 12 Tables  
**Records:** 20 Students, 5 Departments, 5 Courses, 5 Instructors, and related entries  

---

## 🧩 Key Tables and Relationships

| Table | Description |
|-------|--------------|
| **Student** | Stores student details such as name, email, gender, address, etc. |
| **Department** | Manages department names and heads of departments. |
| **Course** | Defines courses under each department with credits and duration. |
| **Instructor** | Contains details of instructors and their specializations. |
| **Enrollment** | Links students and courses, tracks grades and dates. |
| **Classroom** | Defines classroom location and capacity. |
| **Schedule** | Maps courses to instructors, classrooms, and time slots. |
| **Payment** | Records student payment details and transaction info. |
| **Exam** | Holds exam details such as date, duration, and type. |
| **Exam_Result** | Stores student performance data in each exam. |
| **Assignment** | Manages course assignments and due dates. |
| **Assignment_Submission** | Tracks student submissions and grades. |

All relationships are enforced using **FOREIGN KEY constraints** with **ON DELETE CASCADE** for referential integrity.

---

## 🧱 Database Schema Overview

**Relationships Summary:**
- `Student` → `Enrollment`, `Payment`, `Exam_Result`, `Assignment_Submission`
- `Department` → `Course`, `Instructor`
- `Course` → `Enrollment`, `Exam`, `Assignment`, `Schedule`
- `Instructor` → `Schedule`
- `Classroom` → `Schedule`
- `Exam` → `Exam_Result`
- `Assignment` → `Assignment_Submission`

---

## 📊 Sample Data
- **20 Students** (diverse names, addresses, and genders)  
- **5 Departments:** Computer Science, Mathematics, Physics, Chemistry, Biology  
- **5 Courses** — one per department  
- **5 Instructors**, one per course  
- **20 Enrollments**, **20 Payments**, **5 Exams**, **20 Exam Results**, **20 Assignment Submissions**

---

## ⚙️ Example Analytical Queries

| Query | Description |
|--------|--------------|
| `SELECT * FROM Course;` | View all available courses |
| Retrieve all students enrolled in **Physics101** | Joins `Student`, `Enrollment`, and `Course` tables |
| Count total students by gender | Uses `GROUP BY` aggregation |
| Calculate average grade per course | Uses conditional aggregation with `CASE` |
| View total payments by payment method | Groups and sums transactions |
| Retrieve schedule details for specific courses | Joins `Course`, `Instructor`, `Classroom`, and `Schedule` |
| Predict high-performing students | Filters students with average scores above 85 |
| Identify top 5 most enrolled courses | Uses `ORDER BY` and `LIMIT` for ranking |

---

## 🚀 How to Run the Project

1. **Open MySQL Workbench** or your preferred SQL client.  
2. Copy all commands from the `.sql` file into a new SQL script.  
3. Execute the script to:
   - Create the database and tables.
   - Insert sample data.
   - Run example queries for analysis.
4. Verify tables using:
   ```sql
   SHOW TABLES;
   SELECT * FROM Student;
