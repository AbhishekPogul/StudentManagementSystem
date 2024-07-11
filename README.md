Student Management System
Overview:
This is a Java EE web application that performs CRUD (Create, Read, Update, Delete) operations on a database table of students. It uses Servlets, JSP, and JDBC for database interactions and pagination.

Technologies Used:
Java 1.8
Tomcat 9.0
MySQL Database
JDBC
Servlets
JSP



Project Structure:

src/main/java/com/example/servlet/: Contains all the Servlets and model classes.
src/main/java/com/example/util/: Contains the DatabaseUtil class for managing database connections and queries.
src/main/webapp/: Contains JSP pages and web resources.
WEB-INF/web.xml: Deployment descriptor for configuring servlets.

Setup and Deployment:

Prerequisites:
Java 1.8: Make sure you have Java Development Kit (JDK) 1.8 installed.
Apache Tomcat 9.0: Ensure Tomcat 9.0 is installed and configured on your machine.
MySQL Database: Install MySQL and create a database named student_db.

Configuration:

Database Setup:

Create a database named student_db and a table named students using the following SQL script:

sql:
Copy code
CREATE DATABASE student_db;

USE student_db;

CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    email VARCHAR(50),
    age INT
);

use dummy data:
INSERT INTO students (id, name, email, age) VALUES
(1, 'Alice Johnson', 'alice.johnson@example.com', 20),
(2, 'Bob Smith', 'bob.smith@example.com', 22),
(3, 'Charlie Brown', 'charlie.brown@example.com', 19),
(4, 'Diana Prince', 'diana.prince@example.com', 21),
(5, 'Edward Cullen', 'edward.cullen@example.com', 23),
(6, 'Fiona Gallagher', 'fiona.gallagher@example.com', 20),
(7, 'George Clark', 'george.clark@example.com', 22),
(8, 'Hannah Adams', 'hannah.adams@example.com', 19),
(9, 'Isaac Newton', 'isaac.newton@example.com', 21),
(10, 'Jane Austen', 'jane.austen@example.com', 22),

JDBC Driver

Download the MySQL JDBC driver (mysql-connector-j-8.1.0.jar) and place it in the lib directory of your Tomcat installation.

Configure the Database Connection

Ensure that the database URL, user, and password in DatabaseUtil.java are correctly set to match your MySQL database setup.

Building the Project
Compile the Project

Use your IDE (like Eclipse or IntelliJ IDEA) to compile the project

Deploy to Tomcat

Package the project into a WAR file.
Copy the WAR file to the webapps directory of your Tomcat installation.
Start Tomcat if it is not already running.
Accessing the Application
Open your web browser and navigate to http://localhost:8080/StudentManagementSystem.

You should see the home page of the Student Management System where you can:

Add a new student
View the list of students

Troubleshooting:
ClassNotFoundException: Ensure that the MySQL JDBC driver is correctly placed in the Tomcat lib directory.
Database Connection Errors: Verify that the database URL, username, and password in DatabaseUtil.java are correct.
404 Errors: Check that the WAR file is correctly deployed and that the Tomcat server is running.
