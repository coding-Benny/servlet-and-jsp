package com.edu.dao;

import java.sql.*;

import com.edu.beans.Member;

public class MemberDAO {
    public Connection getConnection() {
        Connection con = null;
        String userName = "Put your user name";
        String password = "Put your password";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/edu", userName, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }

    public void insertMember(Member member) {
        try {
            Connection con = this.getConnection();
            PreparedStatement pstmt = con.prepareStatement("insert into member values(?, ?, ?, ?)");
            pstmt.setString(1, member.getId());
            pstmt.setString(2, member.getPasswd());
            pstmt.setString(3, member.getName());
            pstmt.setString(4, member.getMail());
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
