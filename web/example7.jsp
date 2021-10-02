<%--
  Created by IntelliJ IDEA.
  User: benny
  Date: 2021/10/02
  Time: 3:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>구구단</title>
</head>
<body>
    <h3>스크립트릿으로 구구단 출력</h3>
    <%
        for (int i = 2; i < 10; i++) {
            for (int j = 1; j < 10; j++) {
                out.print(i + " * " + j + " = " + (i * j)); %><br>
            <% } %><br>
        <% } %>
</body>
</html>
