
<%@page import="java.sql.ResultSet"%>
<%@page import="pacote.Conexao"%>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <title>Seja Bem-vindo</title>
  <link rel="shortcut icon" href="https://cdn-icons-png.flaticon.com/512/4922/4922073.png" type="image/x-icon">
  <!-- CSS only -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

  <link rel="stylesheet" href="style.css">
  <!-- JavaScript Bundle with Popper -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
  <script src="script.js"></script>
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

<main>
  <%

    if (session.getAttribute("cdUsuario") != null) {

      Conexao c = new Conexao();

      String sql = "SELECT cd_usuario, nm_usuario, ds_email FROM usuario WHERE cd_usuario = ?";

      PreparedStatement pstmt = c.efetuarConexao().prepareStatement(sql);

      pstmt.setInt(1, Integer.parseInt( session.getAttribute("cdUsuario").toString() ));

      ResultSet rs = pstmt.executeQuery();

      while (rs.next()){
    %>
  <h1>Bem-vindo(a) <% out.print(session.getAttribute("nome")); %></h1>
  <div id="alerta"></div>
  <form action="alterarDados.jsp" method="post" onsubmit="return validaCadastro()">
    <input type="text" required name="nome" id="nome" placeholder="Nome" class="form-control" maxlength="50" value="<%out.print(rs.getString(2));%>">
    <input type="email" required name="email" id="email" placeholder="E-mail" class="form-control" maxlength="50" value="<% out.print(rs.getString(3));%>">
    <input type="email" required name="confEmail" id="confEmail" placeholder="Confirmar E-mail" class="form-control" maxlength="50">
    <input type="password" required name="senha" id="senha" placeholder="Nova Senha" class="form-control" maxlength="50">
    <input type="password" required name="confSenha" id="confSenha" placeholder="Confirmar Senha" class="form-control" maxlength="50">
    <input type="hidden" name="cd_usuario" value="<% out.print(rs.getInt(1));%>">
    <input type="submit" class="btn btn-outline-warning" value="Alterar">
  </form>
  <%
      }
    } else {
  %>
      <p>Você não está logado, clique <a href="login.jsp">aqui</a> para fazer login.</p>
  <%
      }
  %>
</main>
</body>
</html>