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
		String emailSession=(String)session.getAttribute("email");
		
		String email = request.getParameter("email");
		String senha = request.getParameter("senha");
		
		if (emailSession != null) {
			response.sendRedirect("index.jsp");
		}
		
		if (emailSession == null) {
			if (email != "" && senha != "" && email != null && senha != null) {
				
				Conexao c = new Conexao();
				
				String sql = "SELECT count(*) FROM usuario WHERE email = ? AND senha = ?";
				
				PreparedStatement pstmt = c.efetuarConexao().prepareStatement(sql);
				
				pstmt.setString(1, email);
				pstmt.setString(2, senha);
				
				ResultSet rs = pstmt.executeQuery();
			
				while(rs.next()) {
					if(rs.getInt(1) > 0) {
						sql = "SELECT * FROM usuario WHERE email = ? AND senha = ?";
						
						pstmt = c.efetuarConexao().prepareStatement(sql);
						
						pstmt.setString(1, email);
						pstmt.setString(2, senha);
						
						rs = pstmt.executeQuery();
						
						while(rs.next()) {
							if(rs.getBoolean(6)) {
								session.setAttribute("email", email);
								response.sendRedirect("index.jsp");
							} else {
								response.sendRedirect("mensagemUsuarioBanido.jsp");
							}
						}

					} else {
						response.sendRedirect("acessarConta.jsp");
					}
				}
				
			} else {
				response.sendRedirect("acessarConta.jsp");
			}
		}
	

	
	%>
</body>
</html>