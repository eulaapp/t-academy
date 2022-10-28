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
		String nome = request.getParameter("nome");
		int idade = Integer.parseInt(request.getParameter("idade"));
		
		//out.print(nome + "<br>" + idade);
		
		//efetuar a conxeão
		Conexao c = new Conexao();
		//c.efetuarConexao();
		
		//sql
		String sql = "INSERT INTO pessoas(nome, idade) VALUES (?, ?)";
		
		// PrepareStatement
		PreparedStatement pstmt = c.efetuarConexao().prepareStatement(sql);
		
		// passar os parametros do sql
		pstmt.setString(1, nome);
		pstmt.setInt(2, idade);
		
		//executar comando sql
		pstmt.execute();
		
		// redirecionamento
		response.sendRedirect("pessoa.jsp");
	%>

</body>
</html>