package org.dhcl.dao;

import org.dhcl.model.Grade;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class GradeDAO {

    // Lấy danh sách điểm kèm theo Tên SV và Tên Môn
    public List<Grade> getAllGrades() throws SQLException {
        List<Grade> grades = new ArrayList<>();
        String sql = "SELECT g.GradeID, g.StudentID, s.FullName, g.SubjectID, sub.SubjectName, g.Score " +
                     "FROM Grade g " +
                     "JOIN Student s ON g.StudentID = s.StudentID " +
                     "JOIN Subject sub ON g.SubjectID = sub.SubjectID";
                     
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
             
            while (rs.next()) {
                Grade grade = new Grade(
                    rs.getInt("GradeID"),
                    rs.getInt("StudentID"),
                    rs.getString("FullName"),  // Lấy tên SV
                    rs.getInt("SubjectID"),
                    rs.getString("SubjectName"), // Lấy tên Môn
                    rs.getDouble("Score")
                );
                grades.add(grade);
            }
        }
        return grades;
    }

    public Grade getGradeById(int id) throws SQLException {
        String sql = "SELECT * FROM Grade WHERE GradeID = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
             
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    // Chỉ cần lấy ID để fill vào form sửa
                    return new Grade(
                        rs.getInt("GradeID"),
                        rs.getInt("StudentID"),
                        rs.getInt("SubjectID"),
                        rs.getDouble("Score")
                    );
                }
            }
        }
        return null;
    }

    public boolean addGrade(Grade grade) throws SQLException {
        // Kiểm tra trùng lặp (mỗi SV chỉ có 1 điểm cho 1 môn)
        String sql = "INSERT INTO Grade (StudentID, SubjectID, Score) VALUES (?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
             
            stmt.setInt(1, grade.getStudentId());
            stmt.setInt(2, grade.getSubjectId());
            stmt.setDouble(3, grade.getScore());
            return stmt.executeUpdate() > 0;
        }
    }

    public boolean updateGrade(Grade grade) throws SQLException {
        String sql = "UPDATE Grade SET StudentID=?, SubjectID=?, Score=? WHERE GradeID=?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
             
            stmt.setInt(1, grade.getStudentId());
            stmt.setInt(2, grade.getSubjectId());
            stmt.setDouble(3, grade.getScore());
            stmt.setInt(4, grade.getGradeId());
            return stmt.executeUpdate() > 0;
        }
    }

    public boolean deleteGrade(int id) throws SQLException {
        String sql = "DELETE FROM Grade WHERE GradeID=?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
             
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        }
    }
}