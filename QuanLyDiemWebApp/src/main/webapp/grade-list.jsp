<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ page import="java.util.List, org.dhcl.model.Grade" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Quản Lý Điểm</title>
			<style>
				/* Reuse CSS styles */
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
				<h1>Bảng Điểm Sinh Viên</h1>
				<a href="grade?action=new" class="btn btn-primary">Nhập Điểm Mới</a>
				<table>
					<thead>
						<tr>
							<th>ID</th>
							<th>Sinh Viên</th>
							<th>Môn Học</th>
							<th>Điểm Số</th>
							<th>Hành Động</th>
						</tr>
					</thead>
					<tbody>
						<% List<Grade> listGrade = (List<Grade>) request.getAttribute("listGrade");
								if (listGrade != null) {
								for (Grade g : listGrade) {
								%>
								<tr>
									<td>
										<%= g.getGradeId() %>
									</td>
									<td>
										<%= g.getStudentName() %> (ID: <%= g.getStudentId() %>)
									</td>
									<td>
										<%= g.getSubjectName() %>
									</td>
									<td>
										<%= g.getScore() %>
									</td>
									<td>
										<a href="grade?action=edit&id=<%= g.getGradeId() %>"
											class="btn btn-warning">Sửa</a>
										<a href="grade?action=delete&id=<%= g.getGradeId() %>" class="btn btn-danger"
											onclick="return confirm('Xóa điểm này?')">Xóa</a>
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