<%@ page import="pacote.Conexao" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
  if(session.getAttribute("tipo") != null) {
    if (session.getAttribute("tipo").toString().equals("A")) {
      Conexao c = new Conexao();

      String sql = "UPDATE usuario SET fg_banido = 'S' WHERE cd_usuario = ?";

      PreparedStatement pstmt = c.efetuarConexao().prepareStatement(sql);

      pstmt.setInt(1, Integer.parseInt(request.getParameter("cd_usuario")));

      pstmt.execute();

      response.sendRedirect("analiseUsuarios.jsp");

    }
  } else {
    response.sendRedirect("index.jsp");
  }
%>

</body>
</html>
