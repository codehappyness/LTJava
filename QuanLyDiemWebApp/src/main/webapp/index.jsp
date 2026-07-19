<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>Hệ Thống Quản Lý Điểm</title>
		<style>
			body {
				font-family: Arial, sans-serif;
				margin: 0;
				padding: 0;
				background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
				min-height: 100vh;
			}

			.container {
				max-width: 1200px;
				margin: 0 auto;
				padding: 20px;
			}

			.header {
				text-align: center;
				color: white;
				margin-bottom: 50px;
				padding: 40px 0;
			}

			.header h1 {
				font-size: 3em;
				margin: 0;
			}

			.nav-grid {
				display: grid;
				grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
				gap: 30px;
			}

			.nav-card {
				background: white;
				border-radius: 15px;
				padding: 30px;
				text-align: center;
				box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
				transition: transform 0.3s ease;
				text-decoration: none;
				color: #333;
			}

			.nav-card:hover {
				transform: translateY(-10px);
			}

			.nav-card h3 {
				font-size: 1.5em;
				margin: 0 0 15px 0;
			}

			.nav-card p {
				color: #666;
				margin: 0;
			}
		</style>
	</head>

	<body>
		<div class="container">
			<div class="header">
				<h1>Grade Management System</h1>
				<p>Hệ thống quản lý điểm sinh viên</p>
			</div>

			<div class="nav-grid">
				<a href="student" class="nav-card">
					<h3>Quản Lý Sinh Viên</h3>
					<p>Thêm, sửa, xóa và quản lý thông tin sinh viên.</p>
				</a> <a href="subject" class="nav-card">
					<h3>Quản Lý Môn Học</h3>
					<p>Quản lý danh sách các môn học, tín chỉ và trạng thái.</p>
				</a> <a href="grade" class="nav-card">
					<h3>Quản Lý Điểm</h3>
					<p>Nhập điểm, xem bảng điểm chi tiết của sinh viên.</p>
				</a> <a href="user" class="nav-card">
					<h3>Quản Lý Người Dùng</h3>
					<p>Quản lý tài khoản đăng nhập vào hệ thống.</p>
				</a>
			</div>
		</div>
	</body>

	</html>