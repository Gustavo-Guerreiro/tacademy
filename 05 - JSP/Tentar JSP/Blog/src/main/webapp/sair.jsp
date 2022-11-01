<%--
  Created by IntelliJ IDEA.
  User: Gustavo.Guerreiro
  Date: 01/11/2022
  Time: 13:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sair</title>
</head>
<body>
<%
session.invalidate();
response.sendRedirect("index.jsp");
%>
</body>
</html>
