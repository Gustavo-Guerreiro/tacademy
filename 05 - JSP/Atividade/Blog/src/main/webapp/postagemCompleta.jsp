<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pacote.Conexao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <title>Post Completo</title>

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



<main id="mainPostagemCompleta">
	<% 
	
	Conexao c = new Conexao();
	
	int cd_postagem = Integer.parseInt(request.getParameter("cd_postagem"));
	
	String sql = "SELECT * FROM postagem WHERE cd_postagem = ?";
	
	PreparedStatement pstmt = c.efetuarConexao().prepareStatement(sql);
	
	pstmt.setInt(1, cd_postagem);
	
	ResultSet rs = pstmt.executeQuery();
	
	if(rs.next()){
	
	%>
	
  <div class="card">
    <div class="card-header">
      Por: <% out.print(rs.getString(2)); %>
    </div>
    <div class="card-body">
      <h5 class="card-title"> <% out.print(rs.getString(3)); %> </h5>
      <p class="card-text"> <% out.print(rs.getString(4)); %> </p>
        <a href="alteracaoPostagem.jsp?cd_postagem=<% out.print(rs.getInt(1)); %>" class="btn btn-outline-warning">Alterar</a>
        <a href="removerPostagem.jsp?cd_postagem=<% out.print(rs.getInt(1)); %>" class="btn btn-outline-danger" >Remover</a>
    </div>
  </div>
	<%} %>
  <hr>
  <h2>Adicionar comentário</h2>
  <form action="cadastrarComentario.jsp" method="post">
    <input required type="text" placeholder="Nome" id="nome" class="form-control" name="nome" maxlength="49">
    <input value="<% out.print(cd_postagem); %>" style="display: none;" name="cd_postagem">
    <textarea required id="mensagem" cols="30" rows="10" class="form-control" placeholder="Mensagem" name="mensagem" maxlength="149"></textarea>
    <input type="submit" value="Comentar" class="btn btn-outline-primary">
  </form>
  <hr>
  
    <h2>Comentários</h2>
  <%
  
 	c = new Conexao();
	
	
	sql = "SELECT * FROM comentario WHERE cd_postagem = ? ORDER BY hr_postagem DESC";
	
	pstmt = c.efetuarConexao().prepareStatement(sql);
	
	pstmt.setInt(1, cd_postagem);
	
	rs = pstmt.executeQuery();
	
	while(rs.next()){
  
  %>

  <div class="comentarios">

    <div class="card">
      <div class="card-header">
        Por: <% out.print(rs.getString(2)); %>
      </div>
      <div class="card-body">
        <p class="card-text"><% out.print(rs.getString(3)); %></p>
      </div>
    </div>
  </div>
  <% } %>
</main>
</body>
</html>