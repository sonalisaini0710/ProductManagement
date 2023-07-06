package com.nagarro.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nagarro.dao.ProductDAO;

/**
 * Servlet implementation class DeleteProductHandler
 */
@WebServlet("/DeleteProductHandler")
public class DeleteProductHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("productID"));
		ProductDAO productDAO = new ProductDAO();
		boolean isProductDeleted = productDAO.deleteProductByID(id);
		
		if(isProductDeleted) {
			response.sendRedirect("deleteProductSuccess.jsp");
		} else {
			response.sendRedirect("deleteProductSuccessFailure.jsp");
		}
	}

}
