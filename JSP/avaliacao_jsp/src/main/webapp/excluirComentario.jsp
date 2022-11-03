<%@page import="java.sql.PreparedStatement"%>
<%@page import="avaliacao_jsp.Conexao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	
		String email=(String)session.getAttribute("email");
	
		if(email != null) {
			try {
				int codigoComentario = Integer.parseInt(request.getParameter("codigoComentario"));
				int codigo = Integer.parseInt(request.getParameter("codigo"));
				
				Conexao c = new Conexao();
				
				String deleteCometario = "DELETE FROM comentario WHERE codigo = ?";
				
				PreparedStatement pstmt = c.efetuarConexao().prepareStatement(deleteCometario);
				pstmt.setInt(1, codigoComentario);
				
				pstmt.execute();
				
				response.sendRedirect("detalhePublicacao.jsp?codigo="+codigo);
			} catch(Exception e) {
				response.sendRedirect("index.jsp");
			}
		} else {
			response.sendRedirect("acessarConta.jsp");
		}
	

	%>
</body>
</html>