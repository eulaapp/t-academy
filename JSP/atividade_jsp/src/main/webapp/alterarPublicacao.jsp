<%@page import="java.sql.PreparedStatement"%>
<%@page import="atividade_jsp.Conexao"%>
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
		
		int codigo = Integer.parseInt(request.getParameter("codigo"));
		String titulo = request.getParameter("titulo");
		String conteudo = request.getParameter("publicacao");
		
		Conexao c = new Conexao();
		
		String sql = "UPDATE publicacao SET titulo = ?, conteudo = ? WHERE codigo = ? ";
		
		PreparedStatement pstmt = c.efetuarConexao().prepareStatement(sql);
		
		pstmt.setString(1, titulo);
		pstmt.setString(2, conteudo);
		pstmt.setInt(3, codigo);
		
		pstmt.execute();
		
		response.sendRedirect("index.jsp");
	
	%>
</body>
</html>