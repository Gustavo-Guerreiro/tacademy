<%@page import="pacote.Aluno"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Aprendendo JSP</title>
</head>
<body>
	<h1>Hello World!</h1>
	
	<%
		String nome = "Bruna";
		out.print("<p>O nome é: "+nome+"</p>");
		out.print("<p>Exibindo dados via out.print</p>");
	%>
	
	<hr>
	
	<table border="1">
		<thead>
			<tr>
				<th>Número</th>
			</tr>
		</thead>
		<tbody>
			<%
				// Laço de repetição
				for (int i=0; i<10; i++) {
			%>
			
				<tr>
					<td> <%out.print(i);%> </td>
				</tr>
			
			<%
				}
			%>
		</tbody>
	</table>
	
	
	<hr>
	
	<%
		// Instanciar um aluno
		Aluno a = new Aluno("Alice", 8, 10);
	
		// Retornar o nome e a média
		out.print("<h1>" + a.retorno()+"</h1>");
	%>
	
</body>
</html>