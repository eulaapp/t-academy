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
	
	<link rel="stylesheet" href="style.css">
</head>
<body>
	<div class="container">
	
		<%
			int codigo = Integer.parseInt(request.getParameter("codigo"));
		
			Conexao c = new Conexao();
			
			String sql = "SELECT * FROM publicacao WHERE codigo = ?";
			
			PreparedStatement pstmt = c.efetuarConexao().prepareStatement(sql);
			pstmt.setInt(1, codigo);
			
			ResultSet rs = pstmt.executeQuery();
			
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
		<!-- 
			<input type="text" placeholder="Nome" name="nome" class="form-control" disabled="">
		 -->
		<%
			String name=(String)session.getAttribute("email");  
			if (session.getAttribute("email") != null) {
		%>
		<p><% out.print(name); %></p>
		<% } %>
		<input type="text" placeholder="Mensagem" name="mensagem" class="form-control" disabled="">
		<input type="hidden" name="codigo" value="<% out.print(codigo);%>">
		<input type="submit" value="Comentar" class="btn btn-primary" disabled=""><br><br>
		<% if (session.getAttribute("email") == null) { %>
			<p> Para realizar comentários, é necessário ter uma conta, <a href="acessarConta.jsp">clique aqui</a> para fazer login.</p>
		<% } %>
	</form>
	
		<div class="container">
		<%
			sql = "SELECT * FROM comentario WHERE codigo_publicacao = ?";
			
			pstmt = c.efetuarConexao().prepareStatement(sql);
			pstmt.setInt(1, codigo);
			
			
			rs = pstmt.executeQuery();
			
			String nome = "";
			String mensagem = "";
			
			while(rs.next()) {
				nome = rs.getString(2);
				mensagem = rs.getString(3);
			 
		%>
		<div class="row">
			<div class="col-12 coluna-comentario">
				<div class=" card card-comentario">
					<h4><% out.print(nome); %></h4>
					<p><% out.print(mensagem); %></p>
					<!-- 
						<div>
							<a href="" class="btn btn-danger">Aprovar</a>
							<a href="excluirComentario.jsp" class="btn btn-danger">Excluir</a>
						</div>
					 -->

				</div>
			</div>
		</div>
		<% } %>
	</div>
	
</body>
</html>