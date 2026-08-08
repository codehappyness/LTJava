<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Đăng Nhập Hệ Thống</title>
    <style>
        body { display: flex; justify-content: center; align-items: center; height: 100vh; background: #f0f2f5; font-family: Arial; }
        .login-box { background: white; padding: 40px; border-radius: 8px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); width: 300px; }
        input { width: 100%; padding: 10px; margin: 10px 0; box-sizing: border-box; }
        button { width: 100%; padding: 10px; background: #007bff; color: white; border: none; cursor: pointer; }
        .error { color: red; text-align: center; font-size: 14px; }
    </style>
</head>
<body>
    <div class="login-box">
        <h2 style="text-align:center">Đăng Nhập</h2>
        <% String msg = (String) request.getAttribute("message"); %>
        <% if(msg != null) { %> <p class="error"><%= msg %></p> <% } %>
        
        <form action="login" method="post">
            <input type="text" name="username" placeholder="Tên đăng nhập" required>
            <input type="password" name="password" placeholder="Mật khẩu" required>
            <button type="submit">Đăng Nhập</button>
        </form>
    </div>
</body>
</html>