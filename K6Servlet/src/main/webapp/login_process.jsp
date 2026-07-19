<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% //login_authentication.jsp
String username= request.getParameter("username");
String password= request.getParameter("password");
if (username.equals("root")){
    if(password.equals("123456")){
        response.sendRedirect("myaccount.jsp");
    }
    else{     /*sai password*/
        response.sendRedirect("login.jsp");
    }
}
else{     /*sai user*/
    response.sendRedirect("login.jsp");
}
%>
</body>
</html>