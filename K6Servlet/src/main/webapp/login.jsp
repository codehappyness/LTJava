<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>                                                                       
<html>                                                                                
<head>                                                                                
    <meta charset="UTF-8">                                                            
    <title>Trang Đăng Nhập</title>                                                    
</head>                                                                               
<body>                                                                                
    <h2>Đăng Nhập Hệ Thống</h2>                                                       
    <form action="login_process.jsp" method="post">                                   
        <div>                                                                         
            <label for="user">Username: </label>                                      
            <input type="text" id="user" name="username" required>                    
        </div>                                                                        
        <br>                                                                          
        <div>                                                                         
            <label for="pass">Password: </label>                                      
            <input type="password" id="pass" name="password" required>                
        </div>                                                                        
        <br>                                                                          
        <input type="submit" value="Login">                                           
    </form>                                                                           
</body>                                                                               
</html>                                                                               