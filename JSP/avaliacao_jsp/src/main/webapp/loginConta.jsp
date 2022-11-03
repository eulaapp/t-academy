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
	
		String email = request.getParameter("email");
		String senha = request.getParameter("senha");
	
		if (email != "" && senha != "") {
			
			Conexao c = new Conexao();
			
			String sql = "SELECT nome FROM usuario WHERE email = ? AND senha = ?";
			
			PreparedStatement pstmt = c.efetuarConexao().prepareStatement(sql);
			
			pstmt.setString(1, email);
			pstmt.setString(2, senha);

			
			pstmt.execute();
			session.setAttribute("email", email);
			
			response.sendRedirect("index.jsp");
		} else {
			response.sendError(400, "Erro");
		}
	
	%>
</body>
</html>