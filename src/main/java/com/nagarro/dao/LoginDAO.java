package com.nagarro.dao;

import java.util.List;

import org.hibernate.Session;

import com.nagarro.entities.User;
import com.nagarro.util.DatabaseUtility;

public class LoginDAO {
	User user;
	public boolean isValidUser(User user) {
		Session session = DatabaseUtility.getSession();
		
		session.getTransaction().begin();
		
		List<User> userDetails = session.createQuery("from User where username = :username and password = :password", User.class)
										     .setParameter("username", user.getUsername())
											 .setParameter("password", user.getPassword())
											 .list();
		
		System.out.print(userDetails);
		
		if( !userDetails.isEmpty() ) {
			return true;
		}
		
		session.getTransaction().commit();
		DatabaseUtility.closeSession(session);
		return false;
	}
}