<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>File Size Exceeded</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<!-- 
	<div class="container-fluid vh-100 d-flex flex-wrap justify-content-center align-items-center">
        <div class="row">
			<p class="text-danger m-5">Your image exceeds the limit i.e. 1.00MB</p>
			<a class="m-5" href="productManagementTool.jsp">Go to Product Management Tool</a>
        </div>
    </div>
    -->
    <div class="container-fluid vh-100 d-flex flex-wrap justify-content-center align-items-center">
    <div class="card border-dark mb-3" style="max-width: 80rem;">
  <div class="card-header">FILE SIZE ERROR EXCEED</div>
  <div class="card-body text-dark">
    <h5 class="card-title">Your image exceeds the limit i.e. 1.00MB</h5>
    <p class="card-text"><a href="productManagementTool.jsp">Go to Product Management Tool</a></p>
  </div>
  </div></div>
</body>
</html>