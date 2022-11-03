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
		String sobrenome = request.getParameter("sobrenome");
		String email = request.getParameter("email-cadastro");
		String senha = request.getParameter("senha-cadastro");

		if (nome != "" && sobrenome != "" && email != "" && senha != "") {
			
			Conexao c = new Conexao();
			
			String sql = "INSERT INTO usuario(nome, sobrenome, email, senha, isActive, isAdmin) VALUE (?, ?, ?, ?, ?, ? )";
			
			PreparedStatement pstmt = c.efetuarConexao().prepareStatement(sql);
			
			pstmt.setString(1, nome);
			pstmt.setString(2, sobrenome);
			pstmt.setString(3, email);
			pstmt.setString(4, senha);
			pstmt.setBoolean(5, true);
			pstmt.setBoolean(6, false);

			pstmt.execute();
			session.setAttribute("email", email);
			
			response.sendRedirect("index.jsp");
		} else {
			response.sendError(400, "Erro");
		}
	
	%>
</body>
</html>