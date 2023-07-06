package com.nagarro.util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.nagarro.entities.Product;
import com.nagarro.entities.User;


public class DatabaseUtility {
	public static Session getSession() {
		Session session = null;
		
		try {
			Configuration con = new Configuration().configure().addAnnotatedClass(User.class).addAnnotatedClass(Product.class);
			
			SessionFactory sf = con.buildSessionFactory();
			session = sf.openSession();
			
			
		} catch (Exception e) {
			System.out.println("hibernate exception!");
		}
		return session;
	}
	
	public static void closeSession(Session session) {
		session.close();
	}
}