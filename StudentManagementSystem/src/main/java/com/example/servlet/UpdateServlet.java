package com.example.servlet;

import com.example.util.DatabaseUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/update")
public class UpdateServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        int age = Integer.parseInt(request.getParameter("age"));
        String errorMessage = null;

        try (Connection connection = DatabaseUtil.getConnection()) {
            String sql = "UPDATE students SET name = ?, email = ?, age = ? WHERE id = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, name);
                statement.setString(2, email);
                statement.setInt(3, age);
                statement.setInt(4, id);
                statement.executeUpdate();
            }
        } catch (SQLException | ClassNotFoundException e) {
            errorMessage = "Error while updating student: " + e.getMessage();
            e.printStackTrace();
        }

        if (errorMessage != null) {
            request.setAttribute("errorMessage", errorMessage);
            request.getRequestDispatcher("update.jsp?id=" + id).forward(request, response);
        } else {
            response.sendRedirect("list");
        }
    }
}
