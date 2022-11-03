
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="pacote.Conexao"%>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Análise de Comentários</title>
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

<main>
    <h2>Comentários</h2>
    <%
        Conexao c = new Conexao();

        String sql =
                "SELECT p.cd_postagem, p.nm_cliente, p.ds_titulo, comentario.nm_cliente, comentario.ds_mensagem, " +
                "comentario.cd_comentario FROM comentario LEFT JOIN postagem p ON p.cd_postagem = " +
                "comentario.cd_postagem WHERE comentario.fg_aceito = 'A' ORDER BY comentario.hr_postagem DESC";

        Statement stmt = c.efetuarConexao().createStatement();

        ResultSet rs = stmt.executeQuery(sql);

        int qtdComentários = 0;
        while(rs.next()){

    %>

    <div class="comentarios">

        <div class="card">
            <div class="card-header">
                Por: <% out.print(rs.getString(4)); %>
            </div>
            <div class="card-body">
                <p class="card-text"><% out.print(rs.getString(5)); %></p>
                <p class="card-text">Comentário feito em:</p>
                <h5 class="card-title"> <% out.print(rs.getString(3)); %> </h5>
                <p class="card-text"> De <% out.print(rs.getString(2)); %> </p>
                <a href="postagemCompleta.jsp?cd_postagem=<%out.print(rs.getString(1));%>" class="btn btn-outline-primary">
                    Visualizar Publicação Completa
                </a>
                <a href="aceitarComentario.jsp?cd_comentario=<%out.print(rs.getString(6));%>" class="btn btn-outline-success">
                    Aceitar Comentário
                </a>
                <a href="rejeitarComentario.jsp?cd_comentario=<%out.print(rs.getString(6));%>" class="btn btn-outline-danger">
                    Remover Comentário
                </a>
            </div>
        </div>
    </div>
    <% qtdComentários++;
        }
        if (qtdComentários == 0) {
    %>
        <p>Não há comentários para serem analisados</p>
    <%
        }
    %>
</main>
</body>
</html>