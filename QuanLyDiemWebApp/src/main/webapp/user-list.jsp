<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ page import="java.util.List, org.dhcl.model.User" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Quản Lý Người Dùng</title>
			<style>
				/* Copy CSS từ các file trước */
				body {
					font-family: Arial, sans-serif;
					padding: 20px;
					background-color: #f4f4f4;
				}

				.container {
					max-width: 1200px;
					margin: 0 auto;
					background: white;
					padding: 20px;
					border-radius: 8px;
				}

				table {
					width: 100%;
					border-collapse: collapse;
					margin-top: 20px;
				}

				th,
				td {
					padding: 12px;
					text-align: left;
					border-bottom: 1px solid #ddd;
				}

				th {
					background-color: #f8f9fa;
				}

				.btn {
					padding: 8px 16px;
					text-decoration: none;
					border-radius: 4px;
					color: white;
					display: inline-block;
				}

				.btn-primary {
					background-color: #007bff;
				}

				.btn-warning {
					background-color: #ffc107;
					color: black;
				}

				.btn-danger {
					background-color: #dc3545;
				}
			</style>
		</head>

		<body>
			<div class="container">
				<h1>Danh Sách Người Dùng</h1>
				<a href="user?action=new" class="btn btn-primary">Thêm User Mới</a>
				<table>
					<thead>
						<tr>
							<th>ID</th>
							<th>Tên Đăng Nhập</th>
							<th>Vai Trò (Role)</th>
							<th>Hành Động</th>
						</tr>
					</thead>
					<tbody>
						<% List<User> listUser = (List<User>) request.getAttribute("listUser");
								if (listUser != null) {
								for (User u : listUser) {
								%>
								<tr>
									<td>
										<%= u.getUserId() %>
									</td>
									<td>
										<%= u.getUsername() %>
									</td>
									<td>
										<span style="font-weight: bold; color: <%= u.getRole().equals(" admin") ? "red"
											: (u.getRole().equals("teacher") ? "blue" : "green" ) %>">
											<%= u.getRole().toUpperCase() %>
										</span>
									</td>
									<td>
										<a href="user?action=edit&id=<%= u.getUserId() %>"
											class="btn btn-warning">Sửa</a>
										<a href="user?action=delete&id=<%= u.getUserId() %>" class="btn btn-danger"
											onclick="return confirm('Xóa người dùng này?')">Xóa</a>
									</td>
								</tr>
								<% } } %>
					</tbody>
				</table>
				<br>
				<a href="index.jsp">Quay lại Trang chủ</a>
			</div>
		</body>

		</html>