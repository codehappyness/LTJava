<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ page import="org.dhcl.model.Subject" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>
				<%= (request.getAttribute("subject") !=null) ? "Sửa Môn Học" : "Thêm Môn Học Mới" %>
			</title>
			<style>
				body {
					font-family: Arial, sans-serif;
					padding: 20px;
					background-color: #f4f4f4;
				}

				.container {
					max-width: 600px;
					margin: 0 auto;
					background-color: white;
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

				input[type="text"],
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
				<% Subject subject=(Subject) request.getAttribute("subject"); %>
					<h1>
						<%= (subject !=null) ? "Sửa Môn Học" : "Thêm Môn Học Mới" %>
					</h1>

					<form action="subject" method="post">
						<% if (subject !=null) { %>
							<input type="hidden" name="action" value="update">
							<input type="hidden" name="id" value="<%= subject.getSubjectId() %>">
							<% } else { %>
								<input type="hidden" name="action" value="insert">
								<% } %>

									<div class="form-group">
										<label>Mã Môn Học:</label>
										<input type="text" name="subjectCode"
											value="<%= (subject != null) ? subject.getSubjectCode() : "" %>" required>
									</div>

									<div class="form-group">
										<label>Tên Môn Học:</label>
										<input type="text" name="subjectName"
											value="<%= (subject != null) ? subject.getSubjectName() : "" %>" required>
									</div>

									<div class="form-group">
										<label>Số Tín Chỉ:</label>
										<input type="number" name="credits"
											value="<%= (subject != null) ? subject.getCredits() : "" %>" required
											min="1">
									</div>

									<div class="form-group">
										<label>
											<input type="checkbox" name="isActive" <%=(subject==null ||
												subject.isActive()) ? "checked" : "" %>>
											Đang hoạt động
										</label>
									</div>

									<button type="submit" class="btn btn-success">Lưu</button>
									<a href="subject" class="btn btn-secondary">Hủy</a>
					</form>
			</div>
		</body>

		</html>