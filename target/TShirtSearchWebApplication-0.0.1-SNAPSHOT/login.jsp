<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
	<div class="container-fluid vh-100 d-flex flex-wrap justify-content-center align-items-center">
        <div class="row">
            <div class="col-12">
    
                <h2 class="text-center col-12">Login</h2>
                
            </div>
            <form class="col-12 ps-5 pe-5" method="post" action="LoginHandler">
                <div class="row p-2">
                    <label class="col-3" for="username">Username</label>
                    <div class="col-9">
                        <input class="w-100" type="text" id="username" name="username">
                    </div>
                </div>
                <div class="row p-2">
                    <label class="col-3" for="password">Password</label>
                    <div class="col-9">
                        <input class="w-100" type="password" id="password" name="password">
                    </div>
                </div>
                <div class="row p-2">
                    <label class="col-3"></label>
                    <div class="col-9">
                        <a href="#">Forgotten your password?</a>
                    </div>
                </div>
                <div class="row p-2">
                    <div class="col">
                        <input class="btn btn-primary btn-block w-100" type="submit" value="Login">
                    </div>
                </div>
            </form>        </div>
    </div>

</body>
</html>