<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Alterar dados</title>
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	
	<link rel="stylesheet" href="style.css">
</head>
<body>
	<div class="container text-center">
	  <div class="row">
		    <div class="col">
			 <form action="index.jsp">
		      	<h1>Alterar dados</h1>
		      	<input type="text" placeholder="Nome" name="nome" class="form-control"><br>
		      	<input type="text" placeholder="Sobrenome" name="sobrenome" class="form-control"><br>
		      	<input type="email" placeholder="E-mail" name="email-cadastro" class="form-control"><br>
		      	<input type="password" placeholder="Senha" name="senha-cadastro" class="form-control"><br>
		      	<input type="submit" value="Enviar" name="alterarDados" class="btn btn-primary">
		      </form>
		    </div>
	  </div>
</body>
</html>