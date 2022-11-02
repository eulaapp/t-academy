<%@page import="java.sql.PreparedStatement"%>
<%@page import="avaliacao_jsp.Conexao"%>
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
		String mensagem = request.getParameter("mensagem");
		int codigo = Integer.parseInt(request.getParameter("codigo"));
		
		Conexao c = new Conexao();
		
		String sql = "INSERT INTO comentario(nome, mensagem, codigo_publicacao) VALUES (?,?,?)";

		PreparedStatement pstmt = c.efetuarConexao().prepareStatement(sql);
		
		pstmt.setString(1, nome);
		pstmt.setString(2, mensagem);
		pstmt.setInt(3, codigo);
		
		pstmt.execute();
		
		response.sendRedirect("detalhePublicacao.jsp?codigo="+codigo);
	
	%>
</body>
</html>