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
<style>
.navbar-blue {
	background-color: #007bff;
}

.navbar-blue .navbar-brand {
	color: #fff;
}

.navbar-blue .navbar-toggler-icon {
	color: #fff;
}

.navbar-blue .navbar-nav .nav-link {
	color: #fff;
	position: relative;
	transition: color 0.2s ease-in-out;
}

.navbar-blue .navbar-nav .nav-link:hover {
	color: #000;
}

.navbar-blue .navbar-nav .nav-link:hover::after {
	content: "";
	position: absolute;
	left: 0;
	right: 0;
	bottom: -1px;
	height: 2px;
	background-color: #000;
}

.navbar-blue .navbar-nav .nav-link.active {
	border-bottom: 2px solid #0056b3;
}

.container {
	padding: 3rem;
}

.img-fluid {
	max-width: 100%;
	height: auto;
}

h1 {
	font-size: 2.5rem;
	font-weight: bold;
	margin-bottom: 1.5rem;
}

p {
	font-size: 1.125rem;
	line-height: 1.5;
	margin-bottom: 1.5rem;
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-blue bg-blue">
		<div class="container-fluid">
			<a class="navbar-brand" href="index"> <i
				class="bi bi-car-front-fill"></i> <img src="logo_navbar.png"
				width="70" height="40" />
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="index">Home</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="manageVehicle">Manage
							Vehicle</a></li>
					<li class="nav-item"><a class="nav-link"
						href="adminBookingStatus"> Bookings</a></li>
				</ul>
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link" href="logout">Logout</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container mt-1">

		<h1>Update Vehicle Details</h1>
		<form:form method="post" modelAttribute="vehicle">
			<div class="form-row">
				<div class="form-group col-md-6">
					<form:input type="hidden" class="form-control" path="VehicleId"
						value="${vehicle.vehicleId}" placeholder="Enter Vehicle ID" />
				</div>
				<div class="form-group col-md-6">
					<label for="model">Vehicle Model</label>
					<form:input type="text" class="form-control" path="model"
						placeholder="Enter Model Name" />
					<span class="text-danger small"><form:errors path="model" /></span>
				</div>
				<div class="form-group col-md-6">
					<label for="capacity">Capacity</label>
					<form:input type="number" class="form-control" path="capacity"
						placeholder="Enter seat Capacity " />
					<span class="text-danger small"><form:errors path="capacity" /></span>

				</div>
				<div class="form-group col-md-6">
					<label for="ratePerDay">Rate Per Day</label>
					<form:input type="number" class="form-control" path="ratePerDay"
						placeholder="Enter Per Day Rate" />
					<span class="text-danger small"><form:errors
							path="ratePerDay" /></span>
				</div>
				<div class="form-group col-md-6">
					<label for="licencePlate">License Plate</label>
					<form:input type="text" class="form-control" path="licensePlate"
						placeholder="Enter License Plate number " />
					<span class="text-danger small"><form:errors
							path="licensePlate" /></span>
				</div>
			</div>
			<input type="submit" class="btn btn-success" />
		</form:form>
	</div>
	<script src="webjars/bootstrap/5.1.3/js/bootstrap.min.js"></script>
	<script src="webjars/jquery/3.6.0/jquery.min.js"></script>
</body>
</html>