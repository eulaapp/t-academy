<%@page import="java.sql.PreparedStatement"%>
<%@page import="atividade_jsp.Conexao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String nome = request.getParameter("nome");
		String publicacao = request.getParameter("publicacao");
		String titulo = request.getParameter("titulo");
		
		Conexao c = new Conexao();
		
		String sql = "INSERT INTO publicacoes(nome, titulo, conteudo) VALUES (?,?,?)";
		
		PreparedStatement pstmt = c.efetuarConexao().prepareStatement(sql);
		
		pstmt.setString(1, nome);
		pstmt.setString(2, titulo);
		pstmt.setString(3, publicacao);
		
		pstmt.execute();
		
		response.sendRedirect("index.jsp");
	
	%>
</body>
</html>