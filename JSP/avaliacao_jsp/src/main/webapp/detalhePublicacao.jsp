<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="avaliacao_jsp.Conexao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Detalhe publicação</title>
	
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
			int codigo = Integer.parseInt(request.getParameter("codigo"));
		
			c = new Conexao();
			
			String sql = "SELECT * FROM publicacao WHERE codigo = ?";
			
			pstmt = c.efetuarConexao().prepareStatement(sql);
			pstmt.setInt(1, codigo);
			
			rs = pstmt.executeQuery();
			
			String titulo = "";
			String conteudo = "";
			
			while(rs.next()) {
				titulo = rs.getString(2);
				conteudo = rs.getString(3);
			}
		%>
		<div class="row">
			<div class="col-12 coluna">
				<div class="card">
					<h3><% out.print(titulo); %></h3>
					<p><% out.print(conteudo); %></p>
				</div>
			</div>
		</div>
	</div>
		
	<form action="cadastrarComentario.jsp">
		<label>Deixe um comentário</label><br><br>

		<%
			email=(String)session.getAttribute("email");  
		
			selectNomeUsuario = "SELECT * FROM usuario WHERE email = ?";
			
			pstmt = c.efetuarConexao().prepareStatement(selectNomeUsuario);
			pstmt.setString(1, email);
			
			rs = pstmt.executeQuery();
			
			String nomeUsuario = "";
			isAdmin = false;
			codigoUsuario = 0;
			
			while(rs.next()) {
				nomeUsuario = rs.getString(2);
				isAdmin = rs.getBoolean(7);
				codigoUsuario = rs.getInt(1);
			}
			
			if (session.getAttribute("email") != null) {
		%>
			<p><% out.print(nomeUsuario); %></p>
		<% } %>
		<input type="text" placeholder="Mensagem" name="mensagem" class="form-control" <% if (session.getAttribute("email") == null) { %>disabled=""<% } %> required>
		<input type="hidden" name="codigo" value="<% out.print(codigo);%>">
		<input type="hidden" name="codigoUsuario" value="<% out.print(codigoUsuario);%>">
		<input type="submit" value="Comentar" class="btn btn-primary" <% if (session.getAttribute("email") == null) { %>disabled=""<% } %>><br><br>
		<% if (session.getAttribute("email") == null) { %>
			<p> Para realizar comentários, é necessário ter uma conta, <a href="acessarConta.jsp">clique aqui</a> para fazer login.</p>
		<% } %>
	</form>
	
		<div class="container">
		<%
			sql = "SELECT cmt.*, us.* FROM comentario cmt INNER JOIN usuario us ON cmt.codigo_usuario = us.codigo WHERE cmt.codigo_publicacao = ?";
			
			pstmt = c.efetuarConexao().prepareStatement(sql);
			pstmt.setInt(1, codigo);
			
			
			rs = pstmt.executeQuery();
			
			String nome = "";
			String mensagem = "";
			Boolean comentarioAprovado = false;
			String nomeUsuarioComentario = "";
			int codigoUsuarioComentario = 0;
			int codigoComentario = 0;
			
			while(rs.next()) {
				codigoComentario = rs.getInt(1);
				nome = rs.getString(2);
				mensagem = rs.getString(3);
				comentarioAprovado = rs.getBoolean(4);
				nomeUsuarioComentario = rs.getString(8);
				codigoUsuarioComentario = rs.getInt(6);
				
				if (comentarioAprovado || isAdmin || codigoUsuarioComentario == codigoUsuario) {
			 
		%>
		<div class="row">
			<div class="col-12 coluna-comentario">
				<div class=" card card-comentario">
					<h4><% out.print(nomeUsuarioComentario); %></h4>
					<p><% out.print(mensagem); %></p>
					<% if (isAdmin) { %>
						<div>
						<% if(!comentarioAprovado) {%>
							<a href="aprovarComentario.jsp?codigoComentario=<% out.print(codigoComentario);%>&codigo=<% out.print(codigo);%>" class="btn btn-success">Aprovar</a>
						<% } else { %>
							<a href="aprovarComentario.jsp?codigoComentario=<% out.print(codigoComentario);%>&codigo=<% out.print(codigo);%>" class="btn btn-success">Aprovado</a>
						<% } %>
							<a href="excluirComentario.jsp?codigoComentario=<% out.print(codigoComentario);%>&codigo=<% out.print(codigo);%>" class="btn btn-danger">Excluir</a>
						</div>
					<% } %>
				</div>
			</div>
		</div>
		<% 
				} 

			} 
		%>
	</div>
	
</body>
</html>