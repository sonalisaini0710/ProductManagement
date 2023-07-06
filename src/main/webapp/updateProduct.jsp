<%@page import="com.nagarro.entities.Product"%>
<%@page import="com.nagarro.dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Product</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
	<%
		String username = "";
		if(session.getAttribute("username") == null){
			response.sendRedirect("login.jsp");
			return;
		} else {
			username = (String)session.getAttribute("username");
		}

		int productID = Integer.parseInt(request.getParameter("productID"));
		ProductDAO productDAO = new ProductDAO();
		Product product = productDAO.getProductByID(productID);
	%>

	<jsp:include page="header.jsp" /> 
	
	<div class="container-fluid mt-5">
        <div class="row">
            <div class="col-5">
                <div class="row m-2">
                    <p class="fw-bold">Please enter details to update the Product</p>
                </div>
                <form id="form" action="UpdateProductHandler" method="post" enctype="multipart/form-data">
                	<div class="row m-2">
                        <input class="col-6 d-none" id="productID" name="productID" value="<%= productID %>" readonly>
                    </div>
                    <div class="row m-2">
                        <label for="title" class="col-3">Title</label>
                        <input class="col-6" id="title" name="title" value="<%= product.getTitle() %>" required>
                        <svg xmlns="http://www.w3.org/2000/svg" width="10" fill="currentColor" class="bi bi-asterisk col-1 text-danger" viewBox="0 0 16 16">
						  <path d="M8 0a1 1 0 0 1 1 1v5.268l4.562-2.634a1 1 0 1 1 1 1.732L10 8l4.562 2.634a1 1 0 1 1-1 1.732L9 9.732V15a1 1 0 1 1-2 0V9.732l-4.562 2.634a1 1 0 1 1-1-1.732L6 8 1.438 5.366a1 1 0 0 1 1-1.732L7 6.268V1a1 1 0 0 1 1-1z"/>
						</svg>
                    </div>
                    <div class="row m-2">
                        <label for="quantity" class="col-3">Quantity</label>
                        <input type="number" class="col-6" id="quantity" name="quantity" value="<%= product.getQuantity() %>" required>
                    	<svg xmlns="http://www.w3.org/2000/svg" width="10" fill="currentColor" class="bi bi-asterisk col-1 text-danger" viewBox="0 0 16 16">
						  <path d="M8 0a1 1 0 0 1 1 1v5.268l4.562-2.634a1 1 0 1 1 1 1.732L10 8l4.562 2.634a1 1 0 1 1-1 1.732L9 9.732V15a1 1 0 1 1-2 0V9.732l-4.562 2.634a1 1 0 1 1-1-1.732L6 8 1.438 5.366a1 1 0 0 1 1-1.732L7 6.268V1a1 1 0 0 1 1-1z"/>
						</svg>
                    </div>
                    <div class="row m-2">
                        <label for="size" class="col-3">Size</label>
                        <input type="number" class="col-6" id="size" name="size" value="<%= product.getSize() %>" required>
                    	<svg xmlns="http://www.w3.org/2000/svg" width="10" fill="currentColor" class="bi bi-asterisk col-1 text-danger" viewBox="0 0 16 16">
						  <path d="M8 0a1 1 0 0 1 1 1v5.268l4.562-2.634a1 1 0 1 1 1 1.732L10 8l4.562 2.634a1 1 0 1 1-1 1.732L9 9.732V15a1 1 0 1 1-2 0V9.732l-4.562 2.634a1 1 0 1 1-1-1.732L6 8 1.438 5.366a1 1 0 0 1 1-1.732L7 6.268V1a1 1 0 0 1 1-1z"/>
						</svg>
                    </div>
                    <div class="row m-2">
                        <label for="newImage" class="col-3">New Image</label>
                        <input type="file" accept="image/*" class="col-6 p-0" id="newImage" name="newImage">
                        <div class="col-1" title="Image size must not exceed 1MB">
							<svg xmlns="http://www.w3.org/2000/svg" width="10" fill="currentColor" class="bi bi-info-circle w-100 text-primary" viewBox="0 0 16 16">
							  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
							  <path d="m8.93 6.588-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533L8.93 6.588zM9 4.5a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
							</svg>						
						</div>
                    </div>
                    <div class="row m-2">
                        <div class="col">
                            <input type="submit" class="btn btn-primary" value="Update Product">
                        </div>
                        <div class="col">
                            <input type="reset" class="btn btn-outline-danger" value="Reset">
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-3">
            	<p>Current Image :</p>
            	<img width=150px alt="prev-image" src="productImages/<%= product.getImageName() %>">
            </div>
        </div>
    </div>
	
</body>
</html>