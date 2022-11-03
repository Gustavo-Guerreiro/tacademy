<%@ page import="pacote.Conexao" %>
<%@ page import="java.sql.PreparedStatement" %><%--
  Created by IntelliJ IDEA.
  User: Gustavo.Guerreiro
  Date: 03/11/2022
  Time: 09:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Aceitar comentário</title>
</head>
<body>
<%
    if (session.getAttribute("tipo").toString().equals("A")) {

        String cdComentario = request.getParameter("cd_comentario");

        // Efetuar conexão
        Conexao c = new Conexao();

        // SQL
        String sql = "UPDATE comentario SET fg_aceito = 'S' WHERE cd_comentario = ?";

        // PreparedStatement
        try (PreparedStatement pstmt = c.efetuarConexao().prepareStatement(sql)) {

            pstmt.setInt(1, Integer.parseInt(cdComentario) );

            pstmt.execute();

            // Passar os parâmetros para o SQL
            response.sendRedirect("analiseComentarios.jsp");

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    } else {
        response.sendRedirect("index.jsp");
    }

%>
</body>
</html>
