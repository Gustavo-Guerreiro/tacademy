
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pacote.Conexao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Pesquisa</title>
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
    <h1>Resultados Encontrados:</h1>
	
	<%
		Conexao c = new Conexao();
	
		String termo = request.getParameter("termo").toLowerCase();
	
		String sql = "SELECT * FROM postagem WHERE LOWER(ds_titulo) LIKE Concat('%', ?, '%') ORDER BY hr_postagem DESC";
		
		PreparedStatement pstmt = c.efetuarConexao().prepareStatement(sql);
		
		pstmt.setString(1, termo);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
	%>
	
	
    <div class="card">
        <div class="card-header">
            Por: <% out.print(rs.getString(2)); %>
        </div>
        <div class="card-body">
            <h5 class="card-title"><% out.print(rs.getString(3)); %></h5>
            <p class="card-text"> <% out.print(rs.getString(4)); %> </p>
            <a href="postagemCompleta.jsp?cd_postagem=<% out.print(rs.getInt(1)); %>" class="btn btn-outline-primary">Visualizar Postagem Completa</a>
        </div>
    </div>
    
    
    <%
	}
    %>
</main>
</body>
</html>