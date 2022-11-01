<%@ page import="pacote.Conexao" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
  // Obter dados do usuário
  int codigo =  Integer.parseInt(request.getParameter("cd_usuario"));
  String nome = request.getParameter("nome");
  String email = request.getParameter("email");
  String senha = request.getParameter("senha");

  // Efetuar conexão
  Conexao c = new Conexao();

  // SQL

  String sql = "UPDATE usuario SET nm_usuario = ?, ds_email = ?, vl_senha = SHA2(?, 512) WHERE cd_usuario = ?";

  // PreparedStatement
  try (PreparedStatement pstmt = c.efetuarConexao().prepareStatement(sql)) {

    // Passar os parâmetros para o SQL
    pstmt.setString(1, nome);
    pstmt.setString(2, email);
    pstmt.setString(3, senha);
    pstmt.setInt(4, codigo);

    // Executar o comando SQL
    pstmt.execute();

    session.setAttribute("nome", nome);
    session.setAttribute("idUsuario", codigo);

  } catch (Exception e) {
    System.out.println(e.getMessage());
  }

  // Redirecionar
  response.sendRedirect("index.jsp");
%>
</body>
</html>
