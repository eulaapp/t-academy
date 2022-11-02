<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Login</title>

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	
	<link rel="stylesheet" href="style.css">
</head>
<body>
	<div class="container text-center">
	  <div class="row">
		    <div class="col">
				<form action="index.jsp">
					<h1>Login</h1>
					<input type="email" placeholder="E-mail" name="email" class="form-control"> <br>
					<input type="password" placeholder="Senha" name="senha" class="form-control"><br>
					<input type="submit" value="Entrar" name="login" class="btn btn-primary">
				</form>
		    </div>
	  </div>
</div>
</body>
</html>