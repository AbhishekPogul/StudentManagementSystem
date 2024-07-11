package com.example.servlet;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.util.DatabaseUtil;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/create")
public class CreateServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        int age = Integer.parseInt(request.getParameter("age"));
        String errorMessage = null;

        try (Connection connection = DatabaseUtil.getConnection()) {
            String sql = "INSERT INTO students (name, email, age) VALUES (?, ?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, name);
                statement.setString(2, email);
                statement.setInt(3, age);
                statement.executeUpdate();
            }
        } catch (SQLException | ClassNotFoundException e) {
            errorMessage = "Error while adding student: " + e.getMessage();
            e.printStackTrace();
        }

        if (errorMessage != null) {
            request.setAttribute("errorMessage", errorMessage);
            request.getRequestDispatcher("add.jsp").forward(request, response);
        } else {
            response.sendRedirect("list");
        }
    }
}
