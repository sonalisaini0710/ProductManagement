<%@page import="com.nagarro.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.nagarro.dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <%
	    ProductDAO productDAO = new ProductDAO();
		List<Product> products = productDAO.getAllProducts();
    	if(products != null && products.size() > 0){ %>
    		<div class="container-fluid m-2 mt-5  p-0" style="box-sizing:border-box; max-height : 100vh; overflow-y : auto; border:1px solid black;">
		        <table class="table table-striped " style="position:relative;">
		            <thead class="thead-dark" style="position: sticky; top: 0; background: black; color: white;">
		                <tr>
		                    <th>S. No.</th>
		                    <th>TITLE</th>
		                    <th>QUANTITY</th>
		                    <th>SIZE</th>
		                    <th>IMAGE</th>
		                    <th>ACTION</th>
		                </tr>
		            </thead>
		            <tbody>
    	<%
    		int serialNumber = 1;
    	
    		for(Product product : products) { if(product.getUid()!=(int)session.getAttribute("uid")){
    			continue;
    		}
    		%>
    		
		    			 <tr>
		                  <th scope="row"><%= serialNumber++ %></th>
		                  <td><%= product.getTitle() %></td>
		                  <td><%= product.getQuantity() %></td>
		                  <td><%= product.getSize() %></td>
		                  <td>
		                      <img width="150px" src="productImages/<%= product.getImageName() %>" alt="img-<%= product.getImageName() %>">
		                  </td>
		                  <td>
		                  	  <form class="d-inline" action="updateProduct.jsp" method="post">
		                  	  	  <input name="productID" value="<%= product.getId() %>" class="d-none">
			                      <input type="submit" class="btn btn-outline-primary" value="Edit">		                  	  
		                  	  </form>
		                  	  <form class="d-inline" action="DeleteProductHandler" method="post">
		                  	  	  <input name="productID" value="<%= product.getId() %>" class="d-none">
			                      <input type="submit" class="btn btn-outline-danger" value="Delete">		                  	  
		                  	  </form>
		                  </td>
		                </tr>
    <%	
    		} %>
    				</tbody>
		        </table>
		    </div>
    <%		
    	} %>
    	<div class="container-fluid mt-2  p-2">
        	<h2>Products size : <%= productDAO.getProductsSize() / (1024.0f) %>KB</h2>
        	<h2>Available Storage : <%= productDAO.getAvailableStorage() / (1024.0f) %>KB</h2>
        </div>