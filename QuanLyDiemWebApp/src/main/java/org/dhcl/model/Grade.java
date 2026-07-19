package org.dhcl.model;
public class Grade {
    private int gradeId;
    private int studentId;
    private int subjectId;
    private double score;

    // Các trường bổ sung để hiển thị (View Model)
    private String studentName;
    private String subjectName;

    public Grade() {
    }

    // Constructor dùng khi thêm/sửa (chỉ cần ID)
    public Grade(int gradeId, int studentId, int subjectId, double score) {
        this.gradeId = gradeId;
        this.studentId = studentId;
        this.subjectId = subjectId;
        this.score = score;
    }

    // Constructor đầy đủ dùng khi hiển thị danh sách (có tên)
    public Grade(int gradeId, int studentId, String studentName, int subjectId, String subjectName, double score) {
        this.gradeId = gradeId;
        this.studentId = studentId;
        this.studentName = studentName;
        this.subjectId = subjectId;
        this.subjectName = subjectName;
        this.score = score;
    }

	public int getGradeId() {
		return gradeId;
	}

	public void setGradeId(int gradeId) {
		this.gradeId = gradeId;
	}

	public int getStudentId() {
		return studentId;
	}

	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}

	public int getSubjectId() {
		return subjectId;
	}

	public void setSubjectId(int subjectId) {
		this.subjectId = subjectId;
	}

	public double getScore() {
		return score;
	}

	public void setScore(double score) {
		this.score = score;
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}

}