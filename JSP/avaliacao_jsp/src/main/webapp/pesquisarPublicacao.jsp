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
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	
	<link rel="stylesheet" href="style.css">
</head>
<body>

<%
	
		String email=(String)session.getAttribute("email");  
	
		Conexao c = new Conexao();
		
		String selectNomeUsuario = "SELECT * FROM usuario WHERE email = ?";
		
		PreparedStatement pstmt = c.efetuarConexao().prepareStatement(selectNomeUsuario);
		pstmt.setString(1, email);
		
		ResultSet rs = pstmt.executeQuery();
		
		Boolean isAdmin = false;
		int codigoUsuario = 0;
		
		while(rs.next()) {
			isAdmin = rs.getBoolean(7);
		}
	
	%>
	<nav class="navbar navbar-expand-lg bg-light">
	  <div class="container-fluid">
	    <div class="collapse navbar-collapse container-fluid" id="navbarSupportedContent">
	      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
	        <li class="nav-item dropdown">
	          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	            Menu
	          </a>
	          <ul class="dropdown-menu">
	          	
	          	<% if( email != null) { %>
	            <li><a class="dropdown-item" href="alterarDados.jsp">Alterar dados</a></li>
	            <% if (isAdmin) { %>
	            <li><a class="dropdown-item" href="listaUsuarios.jsp">Usuários</a></li>
	            <% } %>
	            <li><a class="dropdown-item" href="index.jsp">Home</a></li>
	            <li><hr class="dropdown-divider"></li>
	            <li><a class="dropdown-item" href="deslogarSistema.jsp">Sair</a></li>
	            <% } else { %>
	            <li><a class="dropdown-item" href="acessarConta.jsp">Login</a></li>
	            <% } %>
	          </ul>
	        </li>
	      </ul>

			<div class="container-fluid">
				<form class="d-flex" role="search" action="pesquisarPublicacao.jsp">
				    <input class="form-control me-2" type="search" name="pesquisa" placeholder="Pesquisar publicação">
				    <input type="submit" value="Pesquisar" class="btn btn-success">
		      	</form>
			</div>
	    </div>
	  </div>
	</nav>

	<div class="container">
	
		<%
			String termoPesquisado = request.getParameter("pesquisa");
	
			c = new Conexao();
			
			String sql = "SELECT * FROM publicacao WHERE titulo LIKE ?";
		
			pstmt = c.efetuarConexao().prepareStatement(sql);
			
			pstmt.setString(1, "%" + termoPesquisado + "%");
	
			rs = pstmt.executeQuery();
			
			while(rs.next()) { 
				String codigo = rs.getString(1);
				String titulo = rs.getString(2);
				String conteudo = rs.getString(3).substring(0, 10);
		%>
		<div class="row">
			<div class="col-12 coluna">
				<div class="card">
					<h3><% out.print(titulo); %></h3>
					<p><% out.print(conteudo); %>...</p>
					<p><a href="detalhePublicacao.jsp?codigo=<% out.print(codigo); %>">Ver receita</a></p>
					<% if(isAdmin) { %>
						<div class="alinharBotoes">
							<a href="alterarPublicacaoLayout.jsp?codigo=<% out.print(codigo); %>" class="btn btn-primary">Alterar</a>
							<a href="removerPublicacao.jsp?codigo=<% out.print(codigo); %>" class="btn btn-danger">Remover</a>
						</div>
					<% } %>
				</div>
			</div>
		</div>
		<% } %>
	</div>
	
</body>
</html>