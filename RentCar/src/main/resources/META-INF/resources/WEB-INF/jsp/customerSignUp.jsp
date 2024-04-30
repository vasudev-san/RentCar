<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
					<h3 class="text-center mb-4">Sign Up</h3>
					<form:form method="post" modelAttribute="customer">

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
						<div class="row">
							<div class="col-md-6 mb-4">
								<div data-mdb-input-init class="form-outline">
									<label for="firstname">First Name</label>
									<form:input type="text" class="form-control" path="firstname"
										placeholder="Enter your first name" />

									<span class="text-danger small"><form:errors
											path="firstname" /></span>
								</div>
							</div>
							<div class="col-md-6 mb-4">
								<div data-mdb-input-init class="form-outline">
									<label for="lastname">Last Name</label>
									<form:input type="text" class="form-control" path="lastname"
										placeholder="Enter your last name" />

									<span class="text-danger small"><form:errors
											path="lastname" /></span>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6 mb-4">
								<div data-mdb-input-init class="form-outline">
									<label for="gender">Gender</label>
									<form:select class="form-control select" path="gender">
										<option value="male">Male</option>
										<option value="female">Female</option>
										<option value="other">Other</option>
									</form:select>
								</div>
							</div>
							<div class="col-md-6 mb-4">
								<div data-mdb-input-init class="form-outline">
									<label for="phoneNo">Phone Number</label>
									<form:input type="tel" class="form-control" path="phoneNo"
										placeholder="Enter your phone number" />

									<span class="text-danger small"><form:errors
											path="phoneNo" /></span>
								</div>
							</div>
						</div>
						<!-- Email input -->
						<div data-mdb-input-init class="form-outline mb-4">
							<label for="drivingLicenseNo">Driving License Number</label>
							<form:input type="text" class="form-control"
								path="drivingLicenseNo"
								placeholder="Enter your driving license number" />

							<span class="text-danger small"><form:errors
									path="drivingLicenseNo" /></span>
						</div>
						<!-- Submit button -->
						<button type="submit" class="btn btn-primary btn-block">Sign
							Up</button>
						
					</form:form>
					<p>
						Already have account <a href="login">click here</a>
					</p>
					
				</div>
			</div>
		</div>
	</div>
	<script src="webjars/bootstrap/5.1.3/js/bootstrap.min.js"></script>
	<script src="webjars/jquery/3.6.0/jquery.min.js"></script>
</body>
</html>