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
	
		String nome = request.getParameter("nome");
		String sobrenome = request.getParameter("sobrenome");
		String emailNovo = request.getParameter("email-cadastro");
		String senha = request.getParameter("senha-cadastro");
		
		if (nome != "" && sobrenome != "" && email != "" && senha != "") {
			
			Conexao c = new Conexao();
			
			String sql = "UPDATE usuario SET nome = ?, sobrenome =?, email =?, senha =? WHERE email = ?";
			
			PreparedStatement pstmt = c.efetuarConexao().prepareStatement(sql);
			
			pstmt.setString(1, nome);
			pstmt.setString(2, sobrenome);
			pstmt.setString(3, emailNovo);
			pstmt.setString(4, senha);
			pstmt.setString(5, email);
			
			pstmt.execute();
			

			session.setAttribute("email", emailNovo);

			response.sendRedirect("index.jsp");
		} else {
			response.sendError(400, "Erro");
		}
	
	%>
</body>
</html>