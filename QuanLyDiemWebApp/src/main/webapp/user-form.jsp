<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ page import="org.dhcl.model.User" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>
				<%= (request.getAttribute("user") !=null) ? "Sửa Người Dùng" : "Thêm Người Dùng" %>
			</title>
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
				input[type="text"],
				input[type="password"] {
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
				<% User user=(User) request.getAttribute("user"); %>
					<h1>
						<%= (user !=null) ? "Sửa Thông Tin User" : "Tạo User Mới" %>
					</h1>

					<form action="user" method="post">
						<% if (user !=null) { %>
							<input type="hidden" name="action" value="update">
							<input type="hidden" name="id" value="<%= user.getUserId() %>">
							<% } else { %>
								<input type="hidden" name="action" value="insert">
								<% } %>

									<div class="form-group">
										<label>Tên Đăng Nhập (Username):</label>
										<input type="text" name="username"
											value="<%= (user != null) ? user.getUsername() : "" %>" required>
									</div>

									<div class="form-group">
										<label>Mật Khẩu (Password):</label>
										<input type="password" name="password"
											value="<%= (user != null) ? user.getPassword() : "" %>" required>
									</div>

									<div class="form-group">
										<label>Vai Trò (Role):</label>
										<select name="role" required>
											<option value="student" <%=(user !=null && "student"
												.equals(user.getRole())) ? "selected" : "" %>>Sinh Viên (Student)
											</option>
											<option value="teacher" <%=(user !=null && "teacher"
												.equals(user.getRole())) ? "selected" : "" %>>Giảng Viên (Teacher)
											</option>
											<option value="admin" <%=(user !=null && "admin" .equals(user.getRole()))
												? "selected" : "" %>>Quản Trị (Admin)</option>
										</select>
									</div>

									<button type="submit" class="btn btn-success">Lưu</button>
									<a href="user" class="btn btn-secondary">Hủy</a>
					</form>
			</div>
		</body>

		</html>