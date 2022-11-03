<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="avaliacao_jsp.Conexao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Alterar dados</title>
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	
	<link rel="stylesheet" href="style.css">
	
	<script src="script.js"></script>
</head>
<body>

	<%
		String email=(String)session.getAttribute("email");
	
		if(email != null) {
			
		Conexao c = new Conexao();
		
		String sql = "SELECT * FROM usuario WHERE email = ?";
		
		PreparedStatement pstmt = c.efetuarConexao().prepareStatement(sql);
		pstmt.setString(1, email);
		
		ResultSet rs = pstmt.executeQuery();
		
		String nome = "";
		String sobrenome = "";
		String emailUsuario = "";
		String senha = "";
		Boolean isAdmin = false;
		
		while(rs.next()) {
			nome = rs.getString(2);
			sobrenome = rs.getString(3);
			emailUsuario = rs.getString(4);
			senha = rs.getString(5);
			isAdmin = rs.getBoolean(6);
		}
	%>
	<div class="container text-center">
	  <div class="row">
		    <div class="col">
			 <form action="alterarDadosConexaoBanco.jsp" onsubmit="return validarCadastroUsuario()">
		      	<h1>Alterar dados</h1>
		      	<input type="text" placeholder="Nome" name="nome" class="form-control" value=<% out.print(nome); %>><br>
		      	<input type="text" placeholder="Sobrenome" name="sobrenome" class="form-control" value=<% out.print(sobrenome); %>><br>
		      	<input type="email" placeholder="E-mail" name="email-cadastro" class="form-control" value=<% out.print(emailUsuario); %>><br>
		      	<input type="password" placeholder="Senha" name="senha-cadastro" class="form-control" value=<% out.print(senha); %>><br>
		      	<input type="submit" value="Enviar" name="alterarDados" class="btn btn-primary">
		      </form>
		    </div>
	  </div>
	  <% } else {
	  		response.sendRedirect("acessarConta.jsp");
	  } %>
</body>
</html>