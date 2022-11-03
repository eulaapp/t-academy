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
	<title>Usuários</title>
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	
	<link rel="stylesheet" href="style.css">
</head>
<body>
	<%
		
		Conexao c = new Conexao();
	
		String email=(String)session.getAttribute("email");
		
		String select = "SELECT * FROM usuario WHERE email = ?";
		
		PreparedStatement pstmt = c.efetuarConexao().prepareStatement(select);
		
		pstmt.setString(1, email);
		
		ResultSet rs = pstmt.executeQuery();
		
		Boolean isAdmin = false;
		
		while(rs.next()) {
			isAdmin = rs.getBoolean(7);
		}
		
		if(email != null) {
			if (isAdmin) {
				String sql = "SELECT * FROM usuario WHERE email <> ?";
				
				pstmt = c.efetuarConexao().prepareStatement(sql);
				
				pstmt.setString(1, email);
				pstmt.execute();
				
				rs = pstmt.executeQuery();
			} else {
				response.sendRedirect("index.jsp");
			}
			

		
		String usuario = "";
		int codigo = 0;
		Boolean isActive = true;
		String mensagem = "";
		
	%>
	<div class="container text-center">
		<div class="row">
			<div class="col">
				<h1>Usuários</h1>
				<% 	while(rs.next()) {
						usuario = rs.getString(2);
						codigo = rs.getInt(1);
						isActive = rs.getBoolean(6);
						
						if (!isActive) {
							mensagem = "Banido";
						} else {
							mensagem = "Ativo";
						}
						
						%>
					<form class="d-flex banirUsuario" action="banirUsuario.jsp">
						<input type="text" value=<% out.print(usuario); %> class="form-control" readonly>
						<input type="text" value=<% out.print(mensagem); %> class="form-control" readonly>
						<input type="hidden" name="codigo" value=<% out.print(codigo); %>>
						<input type="submit" value="Banir" class="btn btn-danger">
					</form>
				<% } %>
			</div>
		</div>
	</div>
	<% } else { 
		response.sendRedirect("acessarConta.jsp");
	} %>

</body>
</html>