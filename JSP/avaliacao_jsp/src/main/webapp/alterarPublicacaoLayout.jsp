<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="avaliacao_jsp.Conexao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Editar publicação</title>
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

	<link rel="stylesheet" href="style.css">
</head>
<body>
	
		<%
			String email=(String)session.getAttribute("email");
			Conexao c = new Conexao();
			int codigo = Integer.parseInt(request.getParameter("codigo"));
			
			String select = "SELECT * FROM usuario WHERE email = ?";
			PreparedStatement pstmt = c.efetuarConexao().prepareStatement(select);
						
			pstmt.setInt(1, codigo);
			
			ResultSet rs = pstmt.executeQuery();
			
			Boolean isAdmin = false;
			String titulo = "";
			String conteudo = "";
			
			while(rs.next()) {
				isAdmin = rs.getBoolean(7);
			}
		
			if(email != null) {
				if(isAdmin) {
					codigo = Integer.parseInt(request.getParameter("codigo"));
					
					String sql = "SELECT * FROM publicacao WHERE codigo = ?";
					
					pstmt = c.efetuarConexao().prepareStatement(sql);
					
					pstmt.setInt(1, codigo);
					
					rs = pstmt.executeQuery();
										
					while(rs.next()) {
						titulo = rs.getString(2);
						conteudo = rs.getString(3);
					}
				} else {
					response.sendRedirect("index.jsp");
				}

	%>
	
	<form action="alterarPublicacaoConexaoBanco.jsp">
		<input type="text" placeholder="Título" name="titulo" class="form-control" value="<% out.print(titulo); %>">
		<textarea class="form-control" name="publicacao"><% out.print(conteudo); %></textarea>
		<input type="hidden" name="codigo" value="<% out.print(codigo);%>">
		<input type="submit" value="Publicar" class="btn btn-primary">
	</form>
	
	<% } else {
			response.sendRedirect("acessarConta.jsp");
	  } %>
		
</body>
</html>