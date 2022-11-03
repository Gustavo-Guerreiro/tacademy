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
	Conexao c = new Conexao();
	
	int cd_postagem = Integer.parseInt(request.getParameter("cd_postagem"));
	
	String sql = "DELETE FROM comentario WHERE cd_postagem = ?";
	
	PreparedStatement pstmt = c.efetuarConexao().prepareStatement(sql);
	
	pstmt.setInt(1, cd_postagem);
	
	pstmt.execute();
	
	sql = "DELETE FROM postagem WHERE cd_postagem = ?";
	
	pstmt = c.efetuarConexao().prepareStatement(sql);
	
	pstmt.setInt(1, cd_postagem);
	
	pstmt.execute();
	
	response.sendRedirect("index.jsp");

%>
</body>
</html>