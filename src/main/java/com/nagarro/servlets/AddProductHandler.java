package com.nagarro.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.nagarro.constants.ProductConstants;
import com.nagarro.dao.ProductDAO;

@WebServlet("/AddProductHandler")
@MultipartConfig(
			location = ProductConstants.PRODUCT_IMAGES_DIRECTORY_PATH,
			fileSizeThreshold = 1024 * 1024, // 1MB
			maxFileSize = 1024 * 1024, // 1MB
			maxRequestSize = 1024 * 1024 * 4 // 4MB
		)
public class AddProductHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			int uid = (int)(session.getAttribute("uid"));
			String title = request.getParameter("title");
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			String size = request.getParameter("size");
			Part part = request.getPart("image");
			
			ProductDAO productDAO = new ProductDAO();
			
			// check if enough storage is available to store the product;
			long availabeStorage = productDAO.getAvailableStorage();
			if(availabeStorage < part.getSize()) {
				response.sendRedirect("storageNotAvailableError.jsp");
			} else {
				boolean isProductInserted = productDAO.addProduct(title, size, quantity, part,uid);
				
				if(isProductInserted) {
					response.sendRedirect("addProductSuccess.jsp");
				} else {
					response.sendRedirect("addProductFailure.jsp");
				}
			}
			
			
		} catch (Exception e) {
			System.out.print(e.getMessage());
			response.sendRedirect("fileSizeExceedError.jsp");
		}
	}
}