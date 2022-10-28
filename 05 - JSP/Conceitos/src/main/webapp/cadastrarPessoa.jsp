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
		// Obter o nome e a idade
		String nome = request.getParameter("nome");
		int idade = Integer.parseInt(request.getParameter("idade"));
		
		// Exibir
		//out.print(nome + "<br>" + idade);
		
		// Efetuar a conexão
		Conexao c = new Conexao();
		
		// SQL
		String sql = "INSERT INTO pessoas (nome, idade) VALUES (?, ?)";
		
		// PreparedStatement
		PreparedStatement pstmt = c.efetuarConexao().prepareStatement(sql);
		
		// Passar os parâmetros do SQL
		pstmt.setString(1, nome);
		pstmt.setInt(2, idade);
		
		// Executar o comando SQL
		pstmt.execute();
		
		// Redirecionamento
		response.sendRedirect("pessoa.jsp");
	%>
</body>
</html>