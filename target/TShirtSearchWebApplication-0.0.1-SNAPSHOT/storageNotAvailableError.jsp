<%@page import="com.nagarro.dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Storage Not Available</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
	<%
		ProductDAO productDAO = new ProductDAO();
		float availableStorage = productDAO.getAvailableStorage() / (1024.0f);
	%>

	<jsp:include page="header.jsp"></jsp:include>
	<p class="text-danger m-5">Not enough storage is available to save new product.</p>
	<p class="text-danger m-5">Available Storage left = <%= availableStorage %>KB</p>
	<a class="m-5" href="productManagementTool.jsp">Go to Product Management Tool</a>
</body>
</html>