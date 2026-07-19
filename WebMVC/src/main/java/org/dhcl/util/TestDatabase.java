package org.dhcl.util;


import java.sql.*;

public class TestDatabase {
    Connection connection = DbUtil.getConnection();;
    public void printUsers() {
        try {
            Statement st = connection.createStatement();
            String sql = "select * from Users";
            ResultSet rs = st.executeQuery(sql);
            while(rs.next()) {
                System.out.println("User Id: " + rs.getInt("userid"));
                System.out.println("Username: " + rs.getString("username"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public static void main(String[] args) {
        TestDatabase test = new TestDatabase();
        test.printUsers();
    }
}