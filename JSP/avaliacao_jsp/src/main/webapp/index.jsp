<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="avaliacao_jsp.Conexao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Blog</title>

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	
	<link rel="stylesheet" href="style.css">
</head>
<body>
	<nav class="navbar navbar-expand-lg bg-light">
	  <div class="container-fluid">
	    <div class="collapse navbar-collapse container-fluid" id="navbarSupportedContent">
	      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
	        <li class="nav-item dropdown">
	          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	            Menu
	          </a>
	          <ul class="dropdown-menu">
	            <li><a class="dropdown-item" href="alterarDados.jsp">Alterar dados</a></li>
	            <li><a class="dropdown-item" href="listaUsuarios.jsp">Usuários</a></li>
	            <li><hr class="dropdown-divider"></li>
	            <li><a class="dropdown-item" href="#">Sair</a></li>
	          </ul>
	        </li>
	      </ul>
			<div>
				<form class="d-flex" role="search" action="pesquisarPublicacao.jsp">
				    <input class="form-control me-2" type="search" name="pesquisa" placeholder="Pesquisar publicação">
				    <input type="submit" value="Pesquisar" class="btn btn-success">
		      	</form>
			</div>
	    </div>
	  </div>
	</nav>

	<!-- 
	
		<form action="cadastrarPublicacao.jsp">
			<input type="text" placeholder="Título" name="titulo" class="form-control">
			<textarea class="form-control" name="publicacao">Digite aqui para iniciar sua publicação...</textarea>
			<input type="submit" value="Publicar" class="btn btn-primary">
		</form>
		
	 -->

	<div class="container">
		<%
			Conexao c = new Conexao();
			
			String sql = "SELECT * FROM publicacao ORDER BY codigo DESC LIMIT 10";

			Statement stmt = c.efetuarConexao().createStatement();
			
			ResultSet rs = stmt.executeQuery(sql);
	
		%>
		<div class="row">
			
			<% while(rs.next()) { 
			
				String titulo = rs.getString(2);
				String conteudo = rs.getString(3).substring(0, 20);

			%>
			<div class="col-12 coluna">
				<div class="card">
					<h3><% out.print(titulo); %></h3>
					<p><% out.print(conteudo); %>...</p>
					<p><a href="detalhePublicacao.jsp?codigo=<% out.print(rs.getInt(1)); %>">Ver mais</a></p>
					
					<!-- 
						<div class="alinharBotoes">
							<a href="alterarPublicacaoLayout.jsp?codigo=<% out.print(rs.getInt(1)); %>" class="btn btn-primary">Alterar</a>
							<a href="removerPublicacao.jsp?codigo=<% out.print(rs.getInt(1)); %>" class="btn btn-danger">Remover</a>
						</div>
						
					 -->

				</div>
			</div>
			<% } %>
		</div>
	</div>
</body>
</html>