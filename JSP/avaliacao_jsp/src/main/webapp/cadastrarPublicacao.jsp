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
		String email=(String)session.getAttribute("email");
	
		if(email != null) {
			String titulo = request.getParameter("titulo");
			String conteudo = request.getParameter("publicacao");
			if(titulo != null && conteudo != null) {
				Conexao c = new Conexao();
				
				String sql = "INSERT INTO publicacao(titulo, conteudo) VALUES (?,?)";
				
				PreparedStatement pstmt = c.efetuarConexao().prepareStatement(sql);
				
				pstmt.setString(1, titulo);
				pstmt.setString(2, conteudo);
				
				pstmt.execute();
				
				response.sendRedirect("index.jsp");
			} else {
				response.sendRedirect("index.jsp");
			}
			
		} else {
			response.sendRedirect("acessarConta.jsp");
		}

	
	%>
</body>
</html>