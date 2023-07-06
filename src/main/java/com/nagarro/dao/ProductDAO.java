package com.nagarro.dao;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.hibernate.Session;

import com.nagarro.constants.ProductConstants;
import com.nagarro.entities.Product;
import com.nagarro.util.DatabaseUtility;

public class ProductDAO {
	
	public boolean addProduct(String title, String size, int quantity, Part part, int uid) {
		
		String imageName = getImageName(part);
		
		Product product = new Product();
		
		product.setUid(uid);
		product.setTitle(title);
		product.setSize(size);
		product.setQuantity(quantity);
		product.setImageName(imageName);
		product.setImageSize(part.getSize());
		
		Session session = DatabaseUtility.getSession();
		session.getTransaction().begin();
		
		session.save("Product", product);
		
		imageName = "pID-"+product.getId()+"-"+imageName;
		product.setImageName(imageName);
		
		session.getTransaction().commit();
		DatabaseUtility.closeSession(session);
		
		// save image
		try {
			part.write(imageName);
		} catch (IOException e) {
			System.err.println("Unable to save Product Image.");
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	public boolean updateProduct(int productID, String title, String size, int quantity, Part part) {
		String imageName = getImageName(part);
		String prevImageName = null;
		Product product = getProductByID(productID);
		prevImageName = product.getImageName();
		
		product.setTitle(title);
		product.setSize(size);
		product.setQuantity(quantity);
		
		Session session = DatabaseUtility.getSession();
		session.getTransaction().begin();
		
		session.update("Product", product);

		if(imageName.length() > 0) {
			// delete old image
			if(imageName.length() > 0) {
				FileDAO fileDAO = new FileDAO();
				boolean isPrevImageDeleted = fileDAO.deleteProductImage(prevImageName);
				if(!isPrevImageDeleted) {
					return false;
				}
			}
			
			imageName = "pID-"+product.getId()+"-"+imageName;
			product.setImageName(imageName);

			// save image
			try {
				part.write(imageName);
			} catch (IOException e) {
				System.err.println("Unable to update Product Image.");
				e.printStackTrace();
				return false;
			}
		}

		session.getTransaction().commit();
		DatabaseUtility.closeSession(session);

		return true;
	}
	
	public Product getProductByID(int id) {
		List<Product> products = null;
		
		Session session = DatabaseUtility.getSession();
		session.getTransaction().begin();
		
		products = session.createQuery("from Product where id = :id",Product.class)
				                  .setParameter("id", id)
				                  .list();
		
		session.getTransaction().commit();
		DatabaseUtility.closeSession(session);
		
		return products.get(0);
	}
	
	public List<Product> getAllProducts(){
		List<Product> products = null;
		
		Session session = DatabaseUtility.getSession();
		session.getTransaction().begin();
		
		products = session.createQuery("from Product",Product.class).list();
		
		session.getTransaction().commit();
		DatabaseUtility.closeSession(session);
		
		return products;
	}
	
	public long getProductsSize() {
		Long size = null;
		
		Session session = DatabaseUtility.getSession();
		session.getTransaction().begin();
		
		size = (Long)session.createQuery("select sum(imageSize) from Product").getSingleResult();
		
		session.getTransaction().commit();
		DatabaseUtility.closeSession(session);
		
		return size == null ? 0 : size;
	}
	
	public long getProductSizeByID(int productID) {
		Product product = getProductByID(productID);
		return product.getImageSize();
	}
	
	public long getAvailableStorage() {
		long availableStorage = ProductConstants.MAX_STORAGE_AVAILABLE - getProductsSize();
		return availableStorage;
	}

	private String getImageName(Part part) {
		return part.getSubmittedFileName();
	}

	public boolean deleteProductByID(int id) {
		Product product = getProductByID(id);
		String imageName = product.getImageName();
		
		FileDAO fileDAO = new FileDAO();
		boolean isImageDeleted = fileDAO.deleteProductImage(imageName);
		
		if(!isImageDeleted) {
			return false;
		}
		
		Session session = DatabaseUtility.getSession();
		session.getTransaction().begin();
		
		session.delete("Product", product);
		
		session.getTransaction().commit();
		DatabaseUtility.closeSession(session);
		
		return true;
	}
}