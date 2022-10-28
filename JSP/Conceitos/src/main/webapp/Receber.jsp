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
		// obter dados
		//out.print("<h1>"+request.getParameter("nome")+"</h1>");
		//out.print("<h1>"+request.getParameter("idade")+"</h1>");
		
		String nome = request.getParameter("nome");
		int idade = Integer.parseInt(request.getParameter("idade"));
		
		out.print("<h1>"+nome+"</h1>");
		out.print("<h1>"+idade+"</h1>");
		
	%>
</body>
</html>