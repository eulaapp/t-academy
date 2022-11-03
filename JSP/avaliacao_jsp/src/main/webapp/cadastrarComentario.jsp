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
				try {
					String nome = request.getParameter("nome");
					String mensagem = request.getParameter("mensagem");
					int codigo = Integer.parseInt(request.getParameter("codigo"));
					int codigoUsuario = Integer.parseInt(request.getParameter("codigoUsuario"));
					
					Conexao c = new Conexao();
					
					String sql = "INSERT INTO comentario(nome, mensagem, aprovado, codigo_publicacao, codigo_usuario) VALUES (?,?,?,?,?)";
			
					PreparedStatement pstmt = c.efetuarConexao().prepareStatement(sql);
					
					pstmt.setString(1, nome);
					pstmt.setString(2, mensagem);
					pstmt.setBoolean(3, false);
					pstmt.setInt(4, codigo);
					pstmt.setInt(5, codigoUsuario);
					
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