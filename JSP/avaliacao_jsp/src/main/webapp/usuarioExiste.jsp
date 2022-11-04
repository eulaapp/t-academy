<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Que pena!</title>

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	
	<link rel="stylesheet" href="style.css">

</head>
<body>

	<% 
		String email=(String)session.getAttribute("email"); 
	
		if (email != null) {
			response.sendRedirect("index.jsp");
		} 
	
	%>
		<form>
			<input type="text" placeholder="Esse e-mail já está sendo usado, tente novamente!" name="titulo" class="form-control" disabled=""><br><br>
			<a href="cadastrarConta.jsp" class="btn btn-primary">Voltar</a>
		</form>
</body>
</html>