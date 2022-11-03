<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="avaliacao_jsp.Conexao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Alterar publicacao</title>
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
		int codigo = 0;
		
		while(rs.next()) {
			isAdmin = rs.getBoolean(7);
			codigo = rs.getInt(1);
		}
	
		if(email != null) {
			String titulo = request.getParameter("titulo");
			String conteudo = request.getParameter("publicacao");
			
			c = new Conexao();
			
			String sql = "UPDATE publicacao SET titulo = ?, conteudo = ? WHERE codigo = ? ";
			
			pstmt = c.efetuarConexao().prepareStatement(sql);
			
			pstmt.setString(1, titulo);
			pstmt.setString(2, conteudo);
			pstmt.setInt(3, codigo);
			
			pstmt.execute();
			
			response.sendRedirect("index.jsp");
		} else {
			response.sendRedirect("acessarConta.jsp");
		}
	
	%>
</body>
</html>