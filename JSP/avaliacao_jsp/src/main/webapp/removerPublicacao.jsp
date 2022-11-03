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
	
		if (email != null) {
			try {
				int codigo = Integer.parseInt(request.getParameter("codigo"));
				
				Conexao c = new Conexao();
				
				String deleteCometario = "DELETE FROM comentario WHERE codigo_publicacao = ?";
				
				PreparedStatement pstmt = c.efetuarConexao().prepareStatement(deleteCometario);
				pstmt.setInt(1, codigo);
				
				pstmt.execute();
				
				String deletePublicacao = "DELETE FROM publicacao WHERE codigo = ?";
				
				pstmt = c.efetuarConexao().prepareStatement(deletePublicacao);
				pstmt.setInt(1, codigo);
				
				pstmt.execute();
				
				response.sendRedirect("index.jsp");
			} catch(Exception e) {
				response.sendRedirect("index.jsp");
			}
		} else {
			response.sendRedirect("index.jsp");
		}

		
	%>
</body>
</html>