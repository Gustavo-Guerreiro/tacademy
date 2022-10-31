<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="pacote.Conexao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <title>Alterar</title>

  <!-- CSS only -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

  <link rel="stylesheet" href="style.css">
  <!-- JavaScript Bundle with Popper -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

</head>
<body>
<nav class="navbar navbar-expand-lg bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp">Blog</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="postagem.jsp">Cadastrar Postagem</a>
                </li>
            </ul>
            <form action="pesquisa.jsp" method="get" class="d-flex" role="search">
                <input class="form-control me-2" type="search" placeholder="Pesquisar" aria-label="Search" name="termo" required>
                <input type="submit" class="btn btn-outline-success">
            </form>
        </div>
    </div>
</nav>
<main>
  <h1>Alterar Postagem</h1>
  <% 
	
	Conexao c = new Conexao();
	
	int cd_postagem = Integer.parseInt(request.getParameter("cd_postagem"));
	
	String sql = "SELECT * FROM postagem WHERE cd_postagem = ?";
	
	PreparedStatement pstmt = c.efetuarConexao().prepareStatement(sql);
	
	pstmt.setInt(1, cd_postagem);
	
	ResultSet rs = pstmt.executeQuery();
	
	if(rs.next()){
	
	%>
  <form action="alterarPostagem.jsp" method="post">
    <input type="text" required placeholder="Nome" id="nome" name="nome" class="form-control" maxlength="50" value="<% out.print(rs.getString(2)); %>" >
    
    <input type="text" required placeholder="Título" id="titulo" name="titulo" class="form-control" maxlength="100" value="<% out.print(rs.getString(3)); %>">
    
    <input type="text" style="display: none;"  value="<% out.print(rs.getInt(1)); %>" name="cd_postagem" >
    
    <textarea id="mensagem" required cols="30" rows="10" name="postagem" class="form-control" placeholder="Mensagem"  maxlength="255"><% out.print(rs.getString(4)); %></textarea>
    <input type="submit" value="Alterar" class="btn btn-outline-warning">
  </form>
  <%} %>
</main>
</body>
</html>