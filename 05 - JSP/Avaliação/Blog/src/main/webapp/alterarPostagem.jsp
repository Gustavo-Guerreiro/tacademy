<%@page import="java.sql.PreparedStatement"%>
<%@page import="pacote.Conexao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		// Obter dados do usuário
		int codigo =  Integer.parseInt(request.getParameter("cd_postagem"));

		String usuario = request.getParameter("cd_usuario");


		if (session.getAttribute("tipo").toString().equals("A") ||
		session.getAttribute("cdUsuario").toString().equals(usuario) ) {
			String nome = request.getParameter("nome");
			String titulo = request.getParameter("titulo");
			String postagem = request.getParameter("postagem");

			// Efetuar conexão
			Conexao c = new Conexao();

			// SQL

			String sql = "UPDATE postagem SET nm_cliente = ?, ds_titulo = ?, ds_mensagem = ? WHERE cd_postagem = ?";

			// PreparedStatement
			PreparedStatement pstmt = c.efetuarConexao().prepareStatement(sql);

			// Passar os parâmetros para o SQL
			pstmt.setString(1, nome);
			pstmt.setString(2, titulo);
			pstmt.setString(3, postagem);
			pstmt.setInt(4, codigo);

			// Executar o comando SQL
			pstmt.execute();
		}
		// Redirecionar
		response.sendRedirect("index.jsp");

	%>

</body>
</html>