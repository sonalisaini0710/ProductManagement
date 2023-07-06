<%@page import="com.nagarro.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.nagarro.dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <%
		String username = "";
		if(session.getAttribute("username") == null){
			System.out.println("username not set");
			response.sendRedirect("login.jsp");
		} else {
			username = (String)session.getAttribute("username");
		}
	%>
	<style>
		.heading {
		    text-decoration: none;
    		color: black;
		}
	</style>
	
	<header class="container-fluid pt-2">
        <div class="row">
            <div class="col-6 offset-3 text-center">
                <h3><a class="heading" href="productManagementTool.jsp">Product Management Tool</a></h3>
            </div>
            <div class="col-3 d-flex justify-content-end align-items-center">
                <span class="m-2 text-capitalize">Hi <%= username %></span>
                <a href="LogoutHandler" class="btn btn-outline-danger">Logout</a>
            </div>
        </div>
    </header>