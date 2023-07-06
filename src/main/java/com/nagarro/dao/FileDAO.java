package com.nagarro.dao;

import java.io.IOException;
import java.nio.file.DirectoryNotEmptyException;
import java.nio.file.Files;
import java.nio.file.NoSuchFileException;
import java.nio.file.Paths;

import com.nagarro.constants.ProductConstants;

public class FileDAO {
	public boolean deleteProductImage(String imageName) {
		try {
            Files.deleteIfExists(
                Paths.get(ProductConstants.PRODUCT_IMAGES_DIRECTORY_PATH + imageName));
        }
        catch (NoSuchFileException e) {
            System.out.println(
                "No such file/directory exists");
            return false;
        }
        catch (DirectoryNotEmptyException e) {
            System.out.println("Directory is not empty.");
            return false;
        }
        catch (IOException e) {
            System.out.println("Invalid permissions.");
            return false;
        }
		return true;
	}
}