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
		String nome = request.getParameter("nome");
		String mensagem = request.getParameter("mensagem");
		int cd_postagem =  Integer.parseInt( request.getParameter("cd_postagem") );
		
		// Efetuar conexão
		Conexao c = new Conexao();
		
		// SQL
		String sql = "INSERT INTO comentario (nm_cliente, ds_mensagem, cd_postagem, hr_postagem) VALUES (?,?,?, now())";
		
		// PreparedStatement
		PreparedStatement pstmt = c.efetuarConexao().prepareStatement(sql);
		
		// Passar os parâmetros para o SQL
		pstmt.setString(1, nome);
		pstmt.setString(2, mensagem);
		pstmt.setInt(3, cd_postagem);
		
		// Executar o comando SQL
		pstmt.execute();
		
		// Redirecionar
		response.sendRedirect("postagemCompleta.jsp?cd_postagem="+cd_postagem);
		
	%>
</body>
</html>