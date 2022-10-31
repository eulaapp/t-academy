<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="atividade_jsp.Conexao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Blog</title>

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	
	<link rel="stylesheet" href="style.css">
</head>
<body>
	<form action="cadastrarPublicacao.jsp">
		<input type="text" placeholder="Título" name="titulo" class="form-control">
		<textarea class="form-control" name="publicacao">Digite aqui para iniciar sua publicação...</textarea>
		<input type="submit" value="Publicar" class="btn btn-primary">
	</form>
	<div class="container">
		<%
			Conexao c = new Conexao();
			
			String sql = "SELECT * FROM publicacao ORDER BY codigo DESC LIMIT 10";

			Statement stmt = c.efetuarConexao().createStatement();
			
			ResultSet rs = stmt.executeQuery(sql);
	
		%>
		<div class="row">
			
			<% while(rs.next()) { 
			
				String texto = rs.getString(3);
				texto.substring(0, 10);
				
			%>
			<div class="col-12 coluna">
				<div class="card">
					<h3><% out.print(rs.getString(2)); %></h3>
					<p><% out.print(texto + "..."); %></p>
					<p><a href="detalhePublicacao.jsp?codigo=<% out.print(rs.getInt(1)); %>">Continue lendo...</a></p>
				</div>
			</div>
			<% } %>
		</div>
	</div>
</body>
</html>