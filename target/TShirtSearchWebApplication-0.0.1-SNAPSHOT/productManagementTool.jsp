<%@page import="com.nagarro.dao.ProductDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.nagarro.entities.Product"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product Management Tool</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="css/styles.css">
</head>
<body class="ps-2 pe-2">

	<%
		String username = "";
		if(session.getAttribute("username") == null){
			response.sendRedirect("login.jsp");
			return;
		} else {
			username = (String)session.getAttribute("username");
		}
	%>
	
	<jsp:include page="header.jsp" /> 
	
	<hr>
	
	<jsp:include page="productAddForm.jsp"></jsp:include>
	
	<hr>
    
    <jsp:include page="productViewTable.jsp"></jsp:include>
    
</body>
</html>