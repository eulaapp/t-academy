<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="avaliacao_jsp.Conexao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Pesquisar publicação</title>
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	
	<link rel="stylesheet" href="style.css">
</head>
<body>

	<nav class="navbar bg-light">
	  <div class="container-fluid">
	    <form class="d-flex" role="search" action="">
	      <input class="form-control me-2" type="search" name="pesquisa" placeholder="Pesquisar publicação">
	      <input type="submit" value="Pesquisar" class="btn btn-success">
	    </form>
	  </div>
	</nav>

	<div class="container">
	
		<%
			String termoPesquisado = request.getParameter("pesquisa");
	
			Conexao c = new Conexao();
			
			String sql = "SELECT * FROM publicacao WHERE titulo LIKE ?";
		
			PreparedStatement pstmt = c.efetuarConexao().prepareStatement(sql);
			
			pstmt.setString(1, "%" + termoPesquisado + "%");
	
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) { 
				String codigo = rs.getString(1);
				String titulo = rs.getString(2);
				String conteudo = rs.getString(3).substring(0, 20);
		%>
		<div class="row">
			<div class="col-12 coluna">
				<div class="card">
					<h3><% out.print(titulo); %></h3>
					<p><% out.print(conteudo); %>...</p>
					<p><a href="detalhePublicacao.jsp?codigo=<% out.print(codigo); %>">Ver receita</a></p>
					<div class="alinharBotoes">
						<a href="alterarPublicacaoLayout.jsp?codigo=<% out.print(codigo); %>" class="btn btn-primary">Alterar</a>
						<a href="removerPublicacao.jsp?codigo=<%out.print(codigo); %>" class="btn btn-danger">Remover</a>
					</div>
				</div>
			</div>
		</div>
		<% } %>
	</div>
	
</body>
</html>