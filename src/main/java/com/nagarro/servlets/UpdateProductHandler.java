package com.nagarro.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.nagarro.constants.ProductConstants;
import com.nagarro.dao.ProductDAO;

@WebServlet("/UpdateProductHandler")
@MultipartConfig(
		location = ProductConstants.PRODUCT_IMAGES_DIRECTORY_PATH,
		fileSizeThreshold = 1024 * 1024, // 1MB
		maxFileSize = 1024 * 1024, // 1MB
		maxRequestSize = 1024 * 1024 * 4 // 4MB
	)
public class UpdateProductHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			int productID = Integer.parseInt(request.getParameter("productID"));
			String title = request.getParameter("title");
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			String size = request.getParameter("size");
			Part part = request.getPart("newImage");
			
			ProductDAO productDAO = new ProductDAO();
			
			//check for available storage
			long availableStorage = productDAO.getAvailableStorage() + productDAO.getProductSizeByID(productID);
			if(availableStorage < part.getSize()) {
				response.sendRedirect("storageNotAvailableError.jsp");
			} else {
				boolean isProductUpdated = productDAO.updateProduct(productID, title, size, quantity, part);
				if(isProductUpdated) {
					response.sendRedirect("updateProductSuccess.jsp");
				} else {
					response.sendRedirect("updateProductFailure.jsp");
				}
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
