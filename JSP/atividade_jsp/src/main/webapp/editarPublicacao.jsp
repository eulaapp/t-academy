<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="atividade_jsp.Conexao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Editar publicação</title>
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

	<link rel="stylesheet" href="style.css">
</head>
<body>
	
		<%
		
		int codigo = Integer.parseInt(request.getParameter("codigo"));
		Conexao c = new Conexao();
		
		String sql = "SELECT * FROM publicacao WHERE codigo = ?";
		
		PreparedStatement pstmt = c.efetuarConexao().prepareStatement(sql);
		
		pstmt.setInt(1, codigo);
		
		ResultSet rs = pstmt.executeQuery();
			
		String titulo = "";
		String conteudo = "";
		
		while(rs.next()) {
			titulo = rs.getString(2);
			conteudo = rs.getString(3);
		}
	%>
	
	<form action="alterarPublicacao.jsp">
		<input type="text" placeholder="Título" name="titulo" class="form-control">
		<textarea class="form-control" name="publicacao">Digite aqui para iniciar sua publicação...</textarea>
		<input type="hidden" name="codigo" value="<% out.print(codigo);%>">
		<input type="submit" value="Publicar" class="btn btn-primary">
	</form>
		
</body>
</html>