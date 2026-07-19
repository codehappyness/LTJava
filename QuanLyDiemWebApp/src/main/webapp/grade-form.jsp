<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ page import="org.dhcl.model.Grade, org.dhcl.model.Student, org.dhcl.model.Subject, java.util.List" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Thông Tin Điểm</title>
			<style>
				/* Reuse CSS styles */
				body {
					font-family: Arial, sans-serif;
					padding: 20px;
					background-color: #f4f4f4;
				}

				.container {
					max-width: 600px;
					margin: 0 auto;
					background: white;
					padding: 30px;
					border-radius: 8px;
				}

				.form-group {
					margin-bottom: 20px;
				}

				label {
					display: block;
					margin-bottom: 5px;
					font-weight: bold;
				}

				select,
				input[type="number"] {
					width: 100%;
					padding: 10px;
					box-sizing: border-box;
				}

				.btn {
					padding: 10px 20px;
					border: none;
					cursor: pointer;
					color: white;
					border-radius: 4px;
				}

				.btn-success {
					background-color: #28a745;
				}

				.btn-secondary {
					background-color: #6c757d;
					text-decoration: none;
					display: inline-block;
				}
			</style>
		</head>

		<body>
			<div class="container">
				<% Grade grade=(Grade) request.getAttribute("grade"); List<Student> listStudent = (List<Student>)
						request.getAttribute("listStudent");
						List<Subject> listSubject = (List<Subject>) request.getAttribute("listSubject");
								%>
								<h1>
									<%= (grade !=null) ? "Cập Nhật Điểm" : "Nhập Điểm Mới" %>
								</h1>

								<form action="grade" method="post">
									<% if (grade !=null) { %>
										<input type="hidden" name="action" value="update">
										<input type="hidden" name="id" value="<%= grade.getGradeId() %>">
										<% } else { %>
											<input type="hidden" name="action" value="insert">
											<% } %>

												<div class="form-group">
													<label>Sinh Viên:</label>
													<select name="studentId" required>
														<option value="">-- Chọn sinh viên --</option>
														<% if (listStudent !=null) { for (Student s : listStudent) { //
															// Kiểm tra nếu đang sửa thì selected sinh viên hiện tại
															boolean isSelected=(grade !=null &&
															grade.getStudentId()==s.getStudentId()); %>
															<option value="<%= s.getStudentId() %>" <%=isSelected
																? "selected" : "" %>>
																<%= s.getFullName() %> (Lớp: <%= s.getClassName() %>)
															</option>
															<% } } %>
													</select>
												</div>

												<div class="form-group">
													<label>Môn Học:</label>
													<select name="subjectId" required>
														<option value="">-- Chọn môn học --</option>
														<% if (listSubject !=null) { for (Subject sub : listSubject) {
															boolean isSelected=(grade !=null &&
															grade.getSubjectId()==sub.getSubjectId()); %>
															<option value="<%= sub.getSubjectId() %>" <%=isSelected
																? "selected" : "" %>>
																<%= sub.getSubjectCode() %> - <%= sub.getSubjectName()
																		%>
															</option>
															<% } } %>
													</select>
												</div>

												<div class="form-group">
													<label>Điểm Số (Hệ 10):</label>
													<input type="number" name="score" step="0.01" min="0" max="10"
														value="<%= (grade != null) ? grade.getScore() : "" %>" required>
												</div>

												<button type="submit" class="btn btn-success">Lưu</button>
												<a href="grade" class="btn btn-secondary">Hủy</a>
								</form>
			</div>
		</body>

		</html>