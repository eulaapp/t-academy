<% 

	String email=(String)session.getAttribute("email");

	if(email != null) {
		session.invalidate();
		response.sendRedirect("index.jsp");
	} else {
		response.sendRedirect("index.jsp");
	}


%>