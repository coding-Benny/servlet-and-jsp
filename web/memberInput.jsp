<%--
  Created by IntelliJ IDEA.
  User: benny
  Date: 2021/10/03
  Time: 11:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원가입</title>
</head>
<body>
    <h3>회원가입</h3>

    <form action="memberProc.jsp" method="post">
        ID : <input type="text" name="id"><br>
        비밀번호 : <input type="password" name="passwd"><br>
        이름 : <input type="text" name="name"><br>
        E-mail : <input type="text" name="mail"><br>
        <input type="submit" value="가입">
    </form>
</body>
</html>
