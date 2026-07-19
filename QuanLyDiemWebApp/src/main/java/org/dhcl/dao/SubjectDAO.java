package org.dhcl.dao;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import org.dhcl.model.Subject;

public class SubjectDAO {

    // 1. Lấy danh sách tất cả môn học (Read)
    public List<Subject> getAllSubjects() throws SQLException {
        List<Subject> subjects = new ArrayList<>();
        String sql = "SELECT * FROM Subject";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                subjects.add(new Subject(
                        rs.getInt("SubjectID"),
                        rs.getString("SubjectCode"),
                        rs.getString("SubjectName"),
                        rs.getInt("Credits"),
                        rs.getBoolean("IsActive")
                ));
            }
        }
        return subjects;
    }

    // 2. Lấy thông tin môn học theo ID (Read)
    public Subject getSubjectById(int id) throws SQLException {
        String sql = "SELECT * FROM Subject WHERE SubjectID = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new Subject(
                            rs.getInt("SubjectID"),
                            rs.getString("SubjectCode"),
                            rs.getString("SubjectName"),
                            rs.getInt("Credits"),
                            rs.getBoolean("IsActive")
                    );
                }
            }
        }
        return null;
    }

    // 3. Thêm môn học mới (Create)
    public boolean addSubject(Subject subject) throws SQLException {
        String sql = "INSERT INTO Subject (SubjectCode, SubjectName, Credits, IsActive) VALUES (?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, subject.getSubjectCode());
            stmt.setString(2, subject.getSubjectName());
            stmt.setInt(3, subject.getCredits());
            stmt.setBoolean(4, subject.isActive());
            return stmt.executeUpdate() > 0;
        }
    }

    // 4. Cập nhật thông tin môn học (Update)
    public boolean updateSubject(Subject subject) throws SQLException {
        String sql = "UPDATE Subject SET SubjectCode=?, SubjectName=?, Credits=?, IsActive=? WHERE SubjectID=?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, subject.getSubjectCode());
            stmt.setString(2, subject.getSubjectName());
            stmt.setInt(3, subject.getCredits());
            stmt.setBoolean(4, subject.isActive());
            stmt.setInt(5, subject.getSubjectId());
            return stmt.executeUpdate() > 0;
        }
    }

    // 5. Xóa môn học (Delete)
    public boolean deleteSubject(int id) throws SQLException {
        String sql = "DELETE FROM Subject WHERE SubjectID=?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        }
    }
}