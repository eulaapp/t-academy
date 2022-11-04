<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
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
		
		Conexao c = new Conexao();
		
		String sql = "SELECT * FROM usuario WHERE email = ?";
		
		PreparedStatement pstmt = c.efetuarConexao().prepareStatement(sql);
		
		pstmt.setString(1, email);
		
		ResultSet rs = pstmt.executeQuery();
		

		String emailCadastrado = "";
		
		while(rs.next()) {
			emailCadastrado = rs.getString(4);

			
			if(emailCadastrado.equals(email)) {
				response.sendRedirect("usuarioExiste.jsp");
			} else {
				if (nome != "" && sobrenome != "" && email != "" && senha != "" && nome != null && sobrenome != null && email != null && senha != null) {
					
					c = new Conexao();
					
					sql = "INSERT INTO usuario(nome, sobrenome, email, senha, isActive, isAdmin) VALUE (?, ?, ?, ?, ?, ? )";
					
					pstmt = c.efetuarConexao().prepareStatement(sql);
					
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
					response.sendRedirect("index.jsp");
				}
			}
		}
	%>
</body>
</html>