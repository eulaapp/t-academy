<%@page import="java.sql.PreparedStatement"%>
<%@page import="pacote.Conexao"%>
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
		//obter codigo pessoa
		int codigo = Integer.parseInt(request.getParameter("codigo"));
	
		out.print(codigo);
		
		Conexao c = new Conexao();
		
		String sql = "DELETE FROM pessoas WHERE codigo = ?";
		
		PreparedStatement pstmt = c.efetuarConexao().prepareStatement(sql);
		pstmt.setInt(1, codigo);
		
		pstmt.execute();
		
		response.sendRedirect("pessoa.jsp");
	%>
</body>
</html>