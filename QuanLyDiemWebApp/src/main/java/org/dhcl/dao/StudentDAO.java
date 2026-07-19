package org.dhcl.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import org.dhcl.model.Student;

public class StudentDAO {

    public List<Student> getAllStudents() throws SQLException {
        List<Student> students = new ArrayList<>();
        String sql = "SELECT * FROM Student";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Student student = new Student(
                        rs.getInt("StudentID"),
                        rs.getString("FullName"),
                        rs.getString("ClassName")
                );
                students.add(student);
            }
        }
        return students;
    }

    public Student getStudentById(int studentId) throws SQLException {
        String sql = "SELECT * FROM Student WHERE StudentID = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, studentId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return new Student(
                        rs.getInt("StudentID"),
                        rs.getString("FullName"),
                        rs.getString("ClassName")
                );
            }
        }
        return null;
    }

    public boolean addStudent(Student student) throws SQLException {
        String sql = "INSERT INTO Student (FullName, ClassName) VALUES (?, ?)";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, student.getFullName());
            stmt.setString(2, student.getClassName());
            return stmt.executeUpdate() > 0;
        }
    }

    public boolean updateStudent(Student student) throws SQLException {
        String sql = "UPDATE Student SET FullName = ?, ClassName = ? WHERE StudentID = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, student.getFullName());
            stmt.setString(2, student.getClassName());
            stmt.setInt(3, student.getStudentId());
            return stmt.executeUpdate() > 0;
        }
    }

    public boolean deleteStudent(int studentId) throws SQLException {
        String sql = "DELETE FROM Student WHERE StudentID = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, studentId);
            return stmt.executeUpdate() > 0;
        }
    }
}