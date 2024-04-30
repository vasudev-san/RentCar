<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="webjars/bootstrap/5.1.3/css/bootstrap.min.css"
	rel="stylesheet">
<title>Rent Car</title>
</head>
<body>
	<div class="container mt-5">
		<div class="row justify-content-center">
			<div class="col-md-6">
				<div class="card shadow-lg p-5 bg-light">
					<h3 class="text-center mb-4">Login</h3>
					<form method="post">

						<!-- Email input -->
						<div data-mdb-input-init class="form-outline mb-4">
							<label for="username">Username</label> <input type="text"
								class="form-control" name="username"
								placeholder="Enter your username" />
						</div>

						<!-- Password input -->
						<div data-mdb-input-init class="form-outline mb-4">
							<label for="password">Password</label> <input type="password"
								class="form-control" name="password"
								placeholder="Enter your password" />
						</div>
						<p class="text-danger">${error}</p>
						<button type="submit" class="btn btn-primary">Login</button>
					</form>

					<p>
						Don't have account <a href="sign-up">click here</a>
					</p>

				</div>
			</div>
		</div>
	</div>

	<script src="webjars/bootstrap/5.1.3/js/bootstrap.min.js"></script>
	<script src="webjars/jquery/3.6.0/jquery.min.js"></script>
</body>
</html>