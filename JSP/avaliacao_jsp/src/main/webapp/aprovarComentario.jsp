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
	
	int codigoComentario = Integer.parseInt(request.getParameter("codigoComentario"));
	int codigo = Integer.parseInt(request.getParameter("codigo"));
	Conexao c = new Conexao();
			
	String sql = "UPDATE comentario SET aprovado = true WHERE codigo =?";
			
	PreparedStatement pstmt = c.efetuarConexao().prepareStatement(sql);
	pstmt.setInt(1, codigoComentario);
			
	pstmt.execute();
	
	response.sendRedirect("detalhePublicacao.jsp?codigo="+codigo);
	
	%>

</body>
</html>