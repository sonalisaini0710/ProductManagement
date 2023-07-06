package com.nagarro.controller;
import java.util.Scanner;

import com.nagarro.dao.AdminDAO;
import com.nagarro.entities.User;

public class AdminCreateController {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("Enter the username: ");
		String username = sc.nextLine();
		System.out.println("Enter the password: ");
		String password = sc.nextLine();
		sc.close();
		
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		
		AdminDAO adminDao = new AdminDAO();
		adminDao.addAdmin(user);
		
	}
}