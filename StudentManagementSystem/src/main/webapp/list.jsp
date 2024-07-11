<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.servlet.Student" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            text-align: center;
            padding: 50px;
        }
        .error {
            color: red;
        }
        table {
            margin: auto;
            border-collapse: collapse;
            width: 80%;
            margin-bottom: 20px;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        a.button {
            display: inline-block;
            margin: 20px;
            padding: 15px 25px;
            font-size: 18px;
            text-align: center;
            text-decoration: none;
            background-color: #4CAF50;
            color: white;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        a.button:hover {
            background-color: #45a049;
        }
        .pagination {
            margin: 20px 0;
        }
        .pagination a {
            display: inline-block;
            margin: 0 5px;
            padding: 10px 15px;
            text-decoration: none;
            color: white;
            background-color: #4CAF50;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .pagination a:hover {
            background-color: #45a049;
        }
        .pagination .active {
            background-color: #45a049;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <h2>Student List</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Age</th>
            <th>Actions</th>
        </tr>
        <%
            List<Student> students = (List<Student>) request.getAttribute("students");
            if (students != null) {
                for (Student student : students) {
                    out.println("<tr>");
                    out.println("<td>" + student.getId() + "</td>");
                    out.println("<td>" + student.getName() + "</td>");
                    out.println("<td>" + student.getEmail() + "</td>");
                    out.println("<td>" + student.getAge() + "</td>");
                    out.println("<td>");
                    out.println("<a href='update.jsp?id=" + student.getId() + "'>Edit</a> | ");
                    out.println("<a href='delete?id=" + student.getId() + "'>Delete</a>");
                    out.println("</td>");
                    out.println("</tr>");
                }
            }
        %>
    </table>
    <div>
        <a href="add.jsp" class="button">Add New Student</a>
        <a href="index.jsp" class="button">Home Page</a>
    </div>
    <div class="pagination">
        <%
            int currentPage = (int) request.getAttribute("currentPage");
            int totalPages = (int) request.getAttribute("totalPages");
            for (int i = 1; i <= totalPages; i++) {
                if (i == currentPage) {
                    out.println("<a href='list?page=" + i + "' class='active'>" + i + "</a>");
                } else {
                    out.println("<a href='list?page=" + i + "'>" + i + "</a>");
                }
            }
        %>
    </div>
    <%
        String errorMessage = (String) request.getAttribute("errorMessage");
        if (errorMessage != null) {
            out.println("<p class='error'>" + errorMessage + "</p>");
        }
    %>
</body>
</html>
