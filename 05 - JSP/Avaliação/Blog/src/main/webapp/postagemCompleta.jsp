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
    <link rel="shortcut icon" href="https://cdn-icons-png.flaticon.com/512/4922/4922073.png" type="image/x-icon">

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

                <%
                    if (session.getAttribute("tipo") == null) {
                %>
                <li class="nav-item">
                    <a class="nav-link" href="login.jsp">
                        Login
                    </a>
                </li>
                <%
                    }
                %>

                <%
                    if(session.getAttribute("tipo") != null) {
                        if (session.getAttribute("tipo").equals("U")) {
                %>
                <li class="nav-item">
                    <a class="nav-link" href="perfil.jsp">Meu Perfil</a>
                </li>
                <%
                        }
                    }
                %>

                <%
                    if(session.getAttribute("tipo") != null) {
                        if (session.getAttribute("tipo").equals("A")) {
                %>
                <li class="nav-item">
                    <a class="nav-link" href="analiseComentarios.jsp">Analisar Comentários</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="analiseUsuarios.jsp">Gerenciar Perfis</a>
                </li>
                <%
                    }
                %>
                <li class="nav-item">
                    <a href="sair.jsp" class="nav-link">Sair</a>
                </li>
                <%
                    }
                %>
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
      Por: <%out.print(rs.getString(2));%>
    </div>
    <div class="card-body">
      <h5 class="card-title"> <% out.print(rs.getString(3)); %> </h5>
      <p class="card-text"> <% out.print(rs.getString(4)); %> </p>
        <%

        if (session.getAttribute("tipo") != null && session.getAttribute("cdUsuario") != null) {

            if (session.getAttribute("tipo").toString().equals("A") || Integer.parseInt(session.getAttribute("cdUsuario").toString() ) == rs.getInt(6)) {
        %>
            <a href="alteracaoPostagem.jsp?cd_postagem=<% out.print(rs.getInt(1)); %>" class="btn btn-outline-warning">Alterar</a>
            <a href="removerPostagem.jsp?cd_postagem=<% out.print(rs.getInt(1)); %>" class="btn btn-outline-danger" >Remover</a>
        <%
            }
        }
        %>
    </div>
  </div>

  <hr>
  <h2>Adicionar comentário</h2>
    <%}

        if (session.getAttribute("cdUsuario") == null) {
    %>
    <p>Para realizar comentários é necessário ter uma conta, clique <a href="login.jsp">aqui</a> para fazer
        o login ou criar uma conta.</p>
    <%
    } else {
    %>
  <form action="cadastrarComentario.jsp" method="post">
    <input required type="text" readonly placeholder="Nome" id="nome" class="form-control" name="nome" maxlength="50" value=" <%out.print(session.getAttribute("nome"));%> ">
    <input value="<% out.print(cd_postagem); %>" type="hidden" name="cd_postagem">
    <input value="<% out.print(session.getAttribute("cdUsuario")); %>" type="hidden" name="cd_usuario">
    <textarea required id="mensagem" cols="30" rows="10" class="form-control" placeholder="Mensagem" name="mensagem" maxlength="150"></textarea>
    <input type="submit" value="Comentar" class="btn btn-outline-primary">
  </form>
  <hr>

    <%}%>
  
    <h2>Comentários</h2>
  <%

 	c = new Conexao();
	
	sql = "SELECT * FROM comentario WHERE (fg_aceito = 'S' AND cd_postagem = ?) ORDER BY hr_postagem DESC";
	
	pstmt = c.efetuarConexao().prepareStatement(sql);
	
	pstmt.setInt(1, cd_postagem);
	
	rs = pstmt.executeQuery();

    int qtdComentarios = 0;

    while(rs.next()){
  
  %>

  <div class="comentarios">

    <div class="card">
      <div class="card-header">
        Por: <% out.print(rs.getString(2)); %>
      </div>
      <div class="card-body">
        <p class="card-text"><% out.print(rs.getString(3)); %></p>

  <%
      if(session.getAttribute("tipo") != null) {
        if (session.getAttribute("tipo").toString().equals("A")) {
    %>
          <a href="rejeitarComentario.jsp?cd_comentario=<%out.print( rs.getInt(1) );%>"
             class="btn btn-outline-danger">
              Apagar Comentário
          </a>
  <%}}%>
      </div>
    </div>
  </div>
  <%
    qtdComentarios++;
    }

    if (qtdComentarios == 0) {
%>
    <p class="text-center">Ainda não há comentários</p>
<%
    }
  %>
</main>
</body>
</html>