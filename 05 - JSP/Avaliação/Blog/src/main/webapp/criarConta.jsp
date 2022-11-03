<%@ page import="pacote.Conexao" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    // Obter dados do usuário
    String nome = request.getParameter("nome");
    String email = request.getParameter("email");
    String senha = request.getParameter("senha");

    Conexao c = new Conexao();

    // SQL
    String sql = "SELECT * FROM usuario WHERE nm_usuario LIKE ?";

    try (PreparedStatement pstmt = c.efetuarConexao().prepareStatement(sql)) {
        pstmt.setString(1, nome);
        ResultSet rs = pstmt.executeQuery();
        if (rs.next()) {
            response.sendRedirect("novaConta.jsp?problema=nome");
            return;
        }
    } catch (Exception e) {
        System.out.println(e.getMessage());
    }

    sql = "SELECT * FROM usuario WHERE ds_email LIKE ?";

    try (PreparedStatement pstmt = c.efetuarConexao().prepareStatement(sql)) {
        pstmt.setString(1, email);
        ResultSet rs = pstmt.executeQuery();
        if (rs.next()) {
            response.sendRedirect("novaConta.jsp?problema=email");
            return;
        }
    } catch (Exception e) {
        System.out.println(e.getMessage());
    }

    sql = "INSERT INTO usuario (nm_usuario, fg_tipo, ds_email, vl_senha) VALUES (?, 'U', ?, SHA2(?, 512))";

    try (PreparedStatement pstmt = c.efetuarConexao().prepareStatement(sql)) {
        pstmt.setString(1, nome);
        pstmt.setString(2, email);
        pstmt.setString(3, senha);
        pstmt.execute();
    } catch (Exception e) {
        System.out.println(e.getMessage());
    }

    response.sendRedirect("login.jsp");
%>
</body>
</html>
