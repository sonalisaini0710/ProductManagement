package com.nagarro.dao;

import org.hibernate.Session;

import com.nagarro.entities.User;
import com.nagarro.util.DatabaseUtility;

public class AdminDAO {
	public void addAdmin(User user) {
		Session session = DatabaseUtility.getSession();
		
		session.getTransaction().begin();
		
		session.save("User", user);
		
		session.getTransaction().commit();
		DatabaseUtility.closeSession(session);
		System.out.println(user.getUsername() + " created as admin!");
	}
}