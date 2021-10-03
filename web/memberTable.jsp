<%--
  Created by IntelliJ IDEA.
  User: benny
  Date: 2021/10/02
  Time: 11:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>

<%
    Connection con = null;
    Statement stmt = null;
    String userName = "Put your user name";
    String password = "Put your password";

    try {
        Class.forName("com.mysql.jdbc.Driver");
    } catch (ClassNotFoundException e) {
        System.err.println(" !! <JDBC 오류> Driver load 오류: " + e.getMessage());
        e.printStackTrace();
    }

    try {
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/edu", userName, password);
        System.out.println("정상적으로 연결되었습니다.");
        stmt = con.createStatement();
        String sql = "create table member(id varchar(10) primary key, passwd varchar(10), name varchar(10), mail varchar(20))";
        stmt.executeUpdate(sql);
        out.print("member 테이블이 생성되었습니다.");
    } catch(SQLException e) {
        System.err.println("con 오류:" + e.getMessage());
        e.printStackTrace();
    }

    try {
        if (stmt != null)
            stmt.close();
        if (con != null)
            con.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
