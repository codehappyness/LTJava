package org.dhcl.controller;

// SubjectServlet.java
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import org.dhcl.dao.SubjectDAO;
import org.dhcl.model.Subject;

@WebServlet("/subject")
public class SubjectServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private SubjectDAO subjectDAO;

    public void init() {
        subjectDAO = new SubjectDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        try {
            switch (action) {
                case "new":
                    showNewForm(request, response);
                    break;
                case "insert":
                    insertSubject(request, response);
                    break;
                case "delete":
                    deleteSubject(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "update":
                    updateSubject(request, response);
                    break;
                default:
                    listSubject(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listSubject(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Subject> listSubject = subjectDAO.getAllSubjects();
        request.setAttribute("listSubject", listSubject);
        RequestDispatcher dispatcher = request.getRequestDispatcher("subject-list.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("subject-form.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Subject existingSubject = subjectDAO.getSubjectById(id);
        request.setAttribute("subject", existingSubject);
        RequestDispatcher dispatcher = request.getRequestDispatcher("subject-form.jsp");
        dispatcher.forward(request, response);
    }

    private void insertSubject(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String code = request.getParameter("subjectCode");
        String name = request.getParameter("subjectName");
        int credits = Integer.parseInt(request.getParameter("credits"));
        boolean isActive = request.getParameter("isActive") != null;

        Subject newSubject = new Subject(0, code, name, credits, isActive);
        subjectDAO.addSubject(newSubject);
        response.sendRedirect("subject");
    }

    private void updateSubject(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String code = request.getParameter("subjectCode");
        String name = request.getParameter("subjectName");
        int credits = Integer.parseInt(request.getParameter("credits"));
        boolean isActive = request.getParameter("isActive") != null;

        Subject subject = new Subject(id, code, name, credits, isActive);
        subjectDAO.updateSubject(subject);
        response.sendRedirect("subject");
    }

    private void deleteSubject(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        subjectDAO.deleteSubject(id);
        response.sendRedirect("subject");
    }
}
