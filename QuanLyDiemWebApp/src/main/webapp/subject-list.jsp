<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ page import="java.util.List, org.dhcl.model.Subject" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Quản Lý Môn Học</title>
			<style>
				/* Copy CSS từ student-list.jsp hoặc file bài mẫu */
				body {
					font-family: Arial, sans-serif;
					padding: 20px;
					background-color: #f4f4f4;
				}

				.container {
					max-width: 1200px;
					margin: 0 auto;
					background-color: white;
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
				<h1>Danh Sách Môn Học</h1>

				<a href="subject?action=new" class="btn btn-primary">Thêm Môn Học Mới</a>
				<table>
					<thead>
						<tr>
							<th>Mã Môn</th>
							<th>Tên Môn</th>
							<th>Số Tín Chỉ</th>
							<th>Trạng Thái</th>
							<th>Hành Động</th>
						</tr>
					</thead>
					<tbody>
						<% List<Subject> listSubject = (List<Subject>) request.getAttribute("listSubject");
								if (listSubject != null) {
								for (Subject s : listSubject) {
								%>
								<tr>
									<td>
										<%= s.getSubjectCode() %>
									</td>
									<td>
										<%= s.getSubjectName() %>
									</td>
									<td>
										<%= s.getCredits() %>
									</td>
									<td>
										<%= s.isActive() ? "Đang hoạt động" : "Tạm ngưng" %>
									</td>
									<td>
										<a href="subject?action=edit&id=<%= s.getSubjectId() %>"
											class="btn btn-warning">Sửa</a>
										<a href="subject?action=delete&id=<%= s.getSubjectId() %>"
											class="btn btn-danger"
											onclick="return confirm('Bạn có chắc muốn xóa môn này?')">Xóa</a>
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