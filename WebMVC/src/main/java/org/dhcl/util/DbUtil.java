package org.dhcl.util;

import java.sql.*;

public class DbUtil {
    private static Connection connection = null;

    public static Connection getConnection() {
        if (connection != null)
            return connection;
        else {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                // Phần cuối của chuỗi url bị khuất trong ảnh, mình đã bổ sung cho hoàn chỉnh
                connection = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/DBMVC?useUnicode=true&characterEncoding=UTF-8", "root", "TG791508");
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return connection;
        }
    }
}