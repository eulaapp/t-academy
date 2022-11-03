<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Cadastrar conta</title>
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	
	<link rel="stylesheet" href="style.css">
	
	<script src="script.js"></script>
</head>
<body>

	<%
		String email=(String)session.getAttribute("email");
	
		if(email != null) {
			response.sendRedirect("index.jsp");
		}
	
	%>
	<div class="container text-center">
		<div class="row">
			<div class="col">
			 <form action="cadastrarUsuario.jsp" method="POST" onsubmit="return validarCadastroUsuario()">
		      	<h1>Cadastre-se</h1>
		      	<input type="text" placeholder="Nome" name="nome" class="form-control"><br>
		      	<input type="text" placeholder="Sobrenome" name="sobrenome" class="form-control"><br>
		      	<input type="email" placeholder="E-mail" name="email-cadastro" class="form-control"><br>
		      	<input type="password" placeholder="Senha" name="senha-cadastro" class="form-control"><br>
		      	<input type="submit" value="Criar conta" name="cadastro" class="btn btn-primary">
		      </form>
			</div>
		</div>
	</div>
</body>
</html>