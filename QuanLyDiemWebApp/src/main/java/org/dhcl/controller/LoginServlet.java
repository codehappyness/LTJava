package org.dhcl.controller;

import org.dhcl.dao.UserDAO;
import org.dhcl.model.User;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private UserDAO userDAO = new UserDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user = request.getParameter("username");
        String pass = request.getParameter("password");

        try {
            User account = userDAO.checkLogin(user, pass);
            
            if (account != null) {
                HttpSession session = request.getSession();
                session.setAttribute("currentUser", account);

                response.sendRedirect("index.jsp");
            } else {
                request.setAttribute("message", "Tên đăng nhập hoặc mật khẩu không đúng!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}