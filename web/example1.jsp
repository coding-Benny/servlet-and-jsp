<%--
  Created by IntelliJ IDEA.
  User: benny
  Date: 2021/10/02
  Time: 1:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        String user = request.getParameter("name");
        if (user == null)
            user = "Guest";
    %>
    <h1>
        Hello
        <%= user %>!
    </h1>
</body>
</html>
