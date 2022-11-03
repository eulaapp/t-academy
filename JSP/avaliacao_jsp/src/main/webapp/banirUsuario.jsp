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
	
		int codigo = Integer.parseInt(request.getParameter("codigo"));
			
		Conexao c = new Conexao();

		String sql = "UPDATE usuario SET isActive = 0 WHERE codigo = ?";
		
		PreparedStatement pstmt = c.efetuarConexao().prepareStatement(sql);
		pstmt.setInt(1, codigo);
		pstmt.execute();
	
		response.sendRedirect("listaUsuarios.jsp");
	%>
</body>
</html>