package org.dhcl.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import org.dhcl.dao.GradeDAO;
import org.dhcl.dao.StudentDAO;
import org.dhcl.dao.SubjectDAO;
import org.dhcl.model.Grade;
import org.dhcl.model.Student;
import org.dhcl.model.Subject;

import jakarta.servlet.RequestDispatcher;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/grade")
public class GradeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private GradeDAO gradeDAO;
    private StudentDAO studentDAO;
    private SubjectDAO subjectDAO;

    public void init() {
        gradeDAO = new GradeDAO();
        studentDAO = new StudentDAO();
        subjectDAO = new SubjectDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "list";

        try {
            switch (action) {
                case "new": showNewForm(request, response); break;
                case "insert": insertGrade(request, response); break;
                case "delete": deleteGrade(request, response); break;
                case "edit": showEditForm(request, response); break;
                case "update": updateGrade(request, response); break;
                default: listGrade(request, response); break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listGrade(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Grade> listGrade = gradeDAO.getAllGrades();
        request.setAttribute("listGrade", listGrade);
        RequestDispatcher dispatcher = request.getRequestDispatcher("grade-list.jsp");
        dispatcher.forward(request, response);
    }

    // Khi hiện form thêm mới, cần gửi kèm danh sách SV và Môn học
    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        List<Student> listStudent = studentDAO.getAllStudents();
        List<Subject> listSubject = subjectDAO.getAllSubjects();

        request.setAttribute("listStudent", listStudent);
        request.setAttribute("listSubject", listSubject);

        RequestDispatcher dispatcher = request.getRequestDispatcher("grade-form.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Grade existingGrade = gradeDAO.getGradeById(id);

        List<Student> listStudent = studentDAO.getAllStudents();
        List<Subject> listSubject = subjectDAO.getAllSubjects();

        request.setAttribute("grade", existingGrade);
        request.setAttribute("listStudent", listStudent);
        request.setAttribute("listSubject", listSubject);

        RequestDispatcher dispatcher = request.getRequestDispatcher("grade-form.jsp");
        dispatcher.forward(request, response);
    }

    private void insertGrade(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int studentId = Integer.parseInt(request.getParameter("studentId"));
        int subjectId = Integer.parseInt(request.getParameter("subjectId"));
        double score = Double.parseDouble(request.getParameter("score"));

        Grade newGrade = new Grade(0, studentId, subjectId, score);
        gradeDAO.addGrade(newGrade);
        response.sendRedirect("grade");
    }

    private void updateGrade(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        int studentId = Integer.parseInt(request.getParameter("studentId"));
        int subjectId = Integer.parseInt(request.getParameter("subjectId"));
        double score = Double.parseDouble(request.getParameter("score"));

        Grade grade = new Grade(id, studentId, subjectId, score);
        gradeDAO.updateGrade(grade);
        response.sendRedirect("grade");
    }

    private void deleteGrade(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        gradeDAO.deleteGrade(id);
        response.sendRedirect("grade");
    }
}
