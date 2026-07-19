<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ page import="org.dhcl.model.Student" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>
				<% Student student=(Student) request.getAttribute("student"); if (student !=null) { out.print("Sửa Sinh Viên"); } else { out.print("Thêm Sinh Viên Mới"); } %>
			</title>
			<style>
				body {
					font-family: Arial, sans-serif;
					margin: 0;
					padding: 20px;
					background-color: #f4f4f4;
				}

				.container {
					max-width: 600px;
					margin: 0 auto;
					background-color: white;
					padding: 30px;
					border-radius: 8px;
					box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
				}

				h1 {
					text-align: center;
					margin-bottom: 30px;
				}

				.form-group {
					margin-bottom: 20px;
				}

				label {
					display: block;
					margin-bottom: 5px;
					font-weight: bold;
				}

				input[type="text"] {
					width: 100%;
					padding: 10px;
					border: 1px solid #ddd;
					border-radius: 4px;
					box-sizing: border-box;
				}

				.btn {
					background-color: #007bff;
					color: white;
					padding: 10px 20px;
					text-decoration: none;
					border-radius: 4px;
					display: inline-block;
					border: none;
					cursor: pointer;
				}

				.btn:hover {
					background-color: #0056b3;
				}

				.btn-secondary {
					background-color: #6c757d;
				}

				.btn-secondary:hover {
					background-color: #545b62;
				}

				.form-actions {
					text-align: center;
					margin-top: 30px;
				}
			</style>
		</head>

		<body>
			<div class="container">
				<h1>
					<% if (request.getAttribute("student") !=null) { out.print("Sửa Sinh Viên"); } else {
						out.print("Thêm Sinh Viên Mới"); } %>
				</h1>

				<form action="student" method="post">
					<%-- Kiểm tra để set hidden input action --%>
						<% if (request.getAttribute("student") !=null) { %>
							<input type="hidden" name="action" value="update"> <input type="hidden" name="id"
								value="<%=((Student) request.getAttribute(" student")).getStudentId()%>">
							<% } else { %>
								<input type="hidden" name="action" value="insert">
								<% } %>

									<div class="form-group">
										<label>Họ Tên:</label> <input type="text" name="fullName"
											value="<%=(request.getAttribute(" student") !=null) ? ((Student)
											request.getAttribute("student")).getFullName() : "" %>"
										required>
									</div>

									<div class="form-group">
										<label>Lớp:</label> <input type="text" name="className"
											value="<%=(request.getAttribute(" student") !=null) ? ((Student)
											request.getAttribute("student")).getClassName() : "" %>"
										required>
									</div>

									<div class="form-actions">
										<input type="submit" class="btn" value="Lưu"> <a href="student"
											class="btn btn-secondary">Hủy</a>
									</div>
				</form>
			</div>
		</body>