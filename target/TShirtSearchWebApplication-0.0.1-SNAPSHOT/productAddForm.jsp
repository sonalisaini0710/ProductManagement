<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <div class="container-fluid mt-5">
        <div class="row">
            <div class="col-5">
                <div class="row m-2">
                    <p class="fw-bold">Please enter product details to add to stock</p>
                </div>
                <form id="form" action="AddProductHandler" method="post" enctype="multipart/form-data">
                    <div class="row m-2">
                        <label for="title" class="col-3">Title</label>
                        <input class="col-6" id="title" name="title" required>
                    	<svg xmlns="http://www.w3.org/2000/svg" width="10" fill="currentColor" class="bi bi-asterisk col-1 text-danger" viewBox="0 0 16 16">
						  <path d="M8 0a1 1 0 0 1 1 1v5.268l4.562-2.634a1 1 0 1 1 1 1.732L10 8l4.562 2.634a1 1 0 1 1-1 1.732L9 9.732V15a1 1 0 1 1-2 0V9.732l-4.562 2.634a1 1 0 1 1-1-1.732L6 8 1.438 5.366a1 1 0 0 1 1-1.732L7 6.268V1a1 1 0 0 1 1-1z"/>
						</svg>
                    </div>
                    <div class="row m-2">
                        <label for="quantity" class="col-3">Quantity</label>
                        <input type="number" class="col-6" id="quantity" name="quantity" required>
                    	<svg xmlns="http://www.w3.org/2000/svg" width="10" fill="currentColor" class="bi bi-asterisk col-1 text-danger" viewBox="0 0 16 16">
						  <path d="M8 0a1 1 0 0 1 1 1v5.268l4.562-2.634a1 1 0 1 1 1 1.732L10 8l4.562 2.634a1 1 0 1 1-1 1.732L9 9.732V15a1 1 0 1 1-2 0V9.732l-4.562 2.634a1 1 0 1 1-1-1.732L6 8 1.438 5.366a1 1 0 0 1 1-1.732L7 6.268V1a1 1 0 0 1 1-1z"/>
						</svg>
                    </div>
                    <div class="row m-2">
                        <label for="size" class="col-3">Size</label>
                        <input type="number" class="col-6" id="size" name="size" required>
                    	<svg xmlns="http://www.w3.org/2000/svg" width="10" fill="currentColor" class="bi bi-asterisk col-1 text-danger" viewBox="0 0 16 16">
						  <path d="M8 0a1 1 0 0 1 1 1v5.268l4.562-2.634a1 1 0 1 1 1 1.732L10 8l4.562 2.634a1 1 0 1 1-1 1.732L9 9.732V15a1 1 0 1 1-2 0V9.732l-4.562 2.634a1 1 0 1 1-1-1.732L6 8 1.438 5.366a1 1 0 0 1 1-1.732L7 6.268V1a1 1 0 0 1 1-1z"/>
						</svg>
                    </div>
                    <div class="row m-2">
                        <label for="image" class="col-3 form-control-file">Image</label>
                        <input type="file" accept="image/*" class="col-6 p-0" id="image" name="image" required>
                        <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-asterisk col-1 text-danger" viewBox="0 0 16 16">
						  <path d="M8 0a1 1 0 0 1 1 1v5.268l4.562-2.634a1 1 0 1 1 1 1.732L10 8l4.562 2.634a1 1 0 1 1-1 1.732L9 9.732V15a1 1 0 1 1-2 0V9.732l-4.562 2.634a1 1 0 1 1-1-1.732L6 8 1.438 5.366a1 1 0 0 1 1-1.732L7 6.268V1a1 1 0 0 1 1-1z"/>
						</svg>
						<div class="col-1" title="Image size must not exceed 1MB">
							<svg xmlns="http://www.w3.org/2000/svg" width="10" fill="currentColor" class="bi bi-info-circle w-100 text-primary" viewBox="0 0 16 16">
							  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
							  <path d="m8.93 6.588-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533L8.93 6.588zM9 4.5a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
							</svg>						
						</div>
                    </div>
                    <div class="row m-2">
                        <div class="col-3">
                            <input type="submit" class="btn btn-primary" value="Add Product">
                        </div>
                        <div class="col-3">
                            <input type="reset" class="btn btn-outline-danger" value="Reset">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    