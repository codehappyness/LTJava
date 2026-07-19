<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ page import="java.util.List" %>
		<%@ page import="org.dhcl.model.Student" %>
			<!DOCTYPE html>
			<html>

			<head>
				<meta charset="UTF-8">
				<title>Quản Lý Sinh Viên</title>
				<style>
					body {
						font-family: Arial, sans-serif;
						margin: 0;
						padding: 20px;
						background-color: #f4f4f4;
					}

					.container {
						max-width: 1200px;
						margin: 0 auto;
						background-color: white;
						padding: 20px;
						border-radius: 8px;
						box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
					}

					h1 {
						text-align: center;
						margin-bottom: 30px;
					}

					.btn {
						background-color: #007bff;
						color: white;
						padding: 8px 16px;
						text-decoration: none;
						border-radius: 4px;
						display: inline-block;
						margin-bottom: 20px;
					}

					.btn:hover {
						background-color: #0056b3;
					}

					.btn-danger {
						background-color: #dc3545;
					}

					.btn-danger:hover {
						background-color: #c82333;
					}

					.btn-warning {
						background-color: #ffc107;
						color: #212529;
					}

					.btn-warning:hover {
						background-color: #e0a800;
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

					tr:hover {
						background-color: #f5f5f5;
					}
				</style>
			</head>

			<body>
				<div class="container">
					<h1>Quản Lý Sinh Viên</h1>
					<a href="student?action=new" class="btn">Thêm Sinh Viên Mới</a>
					<table>
						<thead>
							<tr>
								<th>ID</th>
								<th>Họ Tên</th>
								<th>Lớp</th>
								<th>Hành Động</th>
							</tr>
						</thead>
						<tbody>
							<% List<Student> listStudent = (List<Student>) request.getAttribute("listStudent");
									if (listStudent != null) {
									for (Student sv : listStudent) {
									%>
									<tr>
										<td>
											<%=sv.getStudentId()%>
										</td>
										<td>
											<%=sv.getFullName()%>
										</td>
										<td>
											<%=sv.getClassName()%>
										</td>
										<td><a href="student?action=edit&id=<%=sv.getStudentId()%>"
												class="btn btn-warning">Sửa</a> <a
												href="student?action=delete&id=<%=sv.getStudentId()%>"
												class="btn btn-danger"
												onclick="return confirm('Bạn có chắc chắn muốn xóa?')">Xóa</a></td>
									</tr>
									<% } } %>
						</tbody>
					</table>
				</div>
			</body>

			</html>