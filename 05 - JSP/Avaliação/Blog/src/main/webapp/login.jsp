
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Faça Login</title>
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
                    <a class="nav-link active" href="login.jsp">
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
    <h1>Fazer Login</h1>
    <%
        String problema = request.getParameter("problema");

        if (problema != null) {
    %>
        <div class="alert alert-danger text-center">
            E-mail ou senha podem estar incorretos. <br>
            Caso esse não seja o caso você foi banido.
        </div>
    <%
        }
    %>
    <form action="fazerLogin.jsp">
        <input type="email" name="email" id="email" placeholder="E-mail" class="form-control" maxlength="50">
        <input type="password" name="senha" id="senha" placeholder="Senha" class="form-control" maxlength="50">
        <input type="submit" class="btn btn-outline-success">
        <p>Não possui uma conta? <a href="novaConta.jsp">Cadastre-se</a></p>
    </form>
</main>

</body>
</html>
