<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="pacote.Conexao" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
  Conexao c = new Conexao();
  String sql = "SELECT * FROM usuario WHERE ds_email LIKE ? AND vl_senha LIKE SHA2(?, 512) AND fg_banido NOT LIKE 'S'";
  String email = request.getParameter("email");
  String senha = request.getParameter("senha");

  try (PreparedStatement pstmt = c.efetuarConexao().prepareStatement(sql)) {
    pstmt.setString(1, email);
    pstmt.setString(2, senha);
    ResultSet rs = pstmt.executeQuery();
    if(rs.next()) {
      session.setAttribute("cdUsuario", rs.getInt(1));
      session.setAttribute("nome", rs.getString(2));
      session.setAttribute("tipo", rs.getString(3));
      response.sendRedirect("index.jsp");
    } else {
      response.sendRedirect("login.jsp?problema='userNotFound'");
    }
  } catch (Exception e) {
    System.out.println(e.getMessage());
  }
%>
</body>
</html>
