<%@page import="pacote.Conexao"%>
<%@page import="java.sql.PreparedStatement"%>
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
		String titulo = request.getParameter("titulo");
		String postagem = request.getParameter("postagem");
		
		// Efetuar conexão
		Conexao c = new Conexao();
		
		// SQL
		String sql = "INSERT INTO postagem (nm_cliente, ds_titulo, ds_mensagem, hr_postagem) VALUES (?,?,?, now())";
		
		// PreparedStatement
		PreparedStatement pstmt = c.efetuarConexao().prepareStatement(sql);
		
		// Passar os parâmetros para o SQL
		pstmt.setString(1, nome);
		pstmt.setString(2, titulo);
		pstmt.setString(3, postagem);
		
		// Executar o comando SQL
		pstmt.execute();
		
		// Redirecionar
		response.sendRedirect("index.jsp");
		
	%>

</body>
</html>