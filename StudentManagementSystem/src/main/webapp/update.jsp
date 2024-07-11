<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.servlet.Student" %>
<%@ page import="com.example.util.DatabaseUtil" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Student</title>
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
        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            display: inline-block;
            text-align: left;
        }
        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
        }
        input[type="text"],
        input[type="email"],
        input[type="number"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        .button-container {
            margin-top: 20px;
        }
        .button {
            display: inline-block;
            margin: 10px;
            padding: 10px 20px;
            font-size: 16px;
            text-align: center;
            text-decoration: none;
            background-color: #4CAF50;
            color: white;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h2>Update Student</h2>
    <%
        String idParam = request.getParameter("id");
        if (idParam == null || idParam.isEmpty()) {
            out.println("<p class='error'>Invalid student ID.</p>");
        } else {
            try {
                int id = Integer.parseInt(idParam);
                Student student = DatabaseUtil.getStudentById(id);
                if (student == null) {
                    out.println("<p class='error'>Student not found.</p>");
                } else {
                    request.setAttribute("student", student);
        %>
                    <form action="update" method="post">
                        <input type="hidden" name="id" value="<%= student.getId() %>">
                        <label for="name">Name:</label>
                        <input type="text" id="name" name="name" value="<%= student.getName() %>" required>
                        
                        <label for="email">Email:</label>
                        <input type="email" id="email" name="email" value="<%= student.getEmail() %>" required>
                        
                        <label for="age">Age:</label>
                        <input type="number" id="age" name="age" value="<%= student.getAge() %>" required>
                        
                        <input type="submit" value="Update">
                    </form>
                    <div class="button-container">
                        <a href="list" class="button">Back to Student List</a>
                        <a href="index.jsp" class="button">Home Page</a>
                    </div>
        <%
                }
            } catch (NumberFormatException e) {
                out.println("<p class='error'>Invalid student ID format.</p>");
            } catch (Exception e) {
                out.println("<p class='error'>An error occurred: " + e.getMessage() + "</p>");
            }
        }
    %>
</body>
</html>
