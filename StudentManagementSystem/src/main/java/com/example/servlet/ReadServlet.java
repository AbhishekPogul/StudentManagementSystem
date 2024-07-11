package com.example.servlet;

import com.example.util.DatabaseUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/list")
public class ReadServlet extends HttpServlet {
    private static final int PAGE_SIZE = 5; // Number of students per page

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int page = 1;
        int size = PAGE_SIZE;

        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }

       try {
    	   List<Student> students = DatabaseUtil.getStudents(page, size);
           int totalStudents = DatabaseUtil.getStudentCount();
           int totalPages = (int) Math.ceil((double) totalStudents / size);

           request.setAttribute("students", students);
           request.setAttribute("currentPage", page);
           request.setAttribute("totalPages", totalPages);
           request.getRequestDispatcher("list.jsp").forward(request, response);
       }
       catch(ClassNotFoundException e) {
    	   e.printStackTrace();
       }
    }
}
