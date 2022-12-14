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
		String sql;
		if ( session.getAttribute("cdUsuario") == null) {
			sql = "INSERT INTO postagem (nm_cliente, ds_titulo, ds_mensagem) VALUES (?,?,?)";
		} else {
			sql = "INSERT INTO postagem (nm_cliente, ds_titulo, ds_mensagem, postagem.cd_usuario) VALUES (?,?,?,?)";
		}
		
		// PreparedStatement
		try (PreparedStatement pstmt = c.efetuarConexao().prepareStatement(sql)) {

			System.out.println( request.getParameter("cdUsuario") );

			// Passar os parâmetros para o SQL
			pstmt.setString(1, nome);
			pstmt.setString(2, titulo);
			pstmt.setString(3, postagem);

			if ( session.getAttribute("cdUsuario") != null ) {
				pstmt.setInt(4, Integer.parseInt( session.getAttribute("cdUsuario").toString() ));
			}

			// Executar o comando SQL
			pstmt.execute();

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		// Redirecionar
		response.sendRedirect("index.jsp");
		
	%>

</body>
</html>