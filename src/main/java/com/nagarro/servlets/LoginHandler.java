package com.nagarro.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nagarro.dao.LoginDAO;
import com.nagarro.entities.User;

@WebServlet("/LoginHandler")
public class LoginHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginHandler() {}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		LoginDAO loginDAO = new LoginDAO();
		
		boolean validUser = loginDAO.isValidUser(user);
		
		if(validUser) {
			HttpSession session = request.getSession();
			session.setAttribute("username", username);
			session.setAttribute("uid", user.getId());
			session.setMaxInactiveInterval(60);
			response.sendRedirect("productManagementTool.jsp");
		} else {
			response.sendRedirect("loginFail.jsp");
		}
	}

}