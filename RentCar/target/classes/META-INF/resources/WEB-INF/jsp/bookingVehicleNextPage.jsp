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
			<a class="navbar-brand" href="home"> <i
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
					<li class="nav-item"><a class="nav-link" href="home">Home</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="bookingVehicle">Book
							Vehicle</a></li>
					<li class="nav-item"><a class="nav-link" href="bookings">Your
							Bookings</a></li>
					<li class="nav-item"><a class="nav-link" href="userAccount">Account</a>
					</li>
				</ul>
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link" href="logout">Logout</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container mt-1">
		<h1 class="mb-4">Booking Details</h1>
		<div class="row">
			<div class="col">
				<div class="card">
					<img src="car_pic.png" class="card-img-top"
						alt="Vehicle Image">
					<div class="card-body">
						<h5 class="card-title">${vehicle.model}</h5>
						<p class="card-text">Seat Capacity: ${vehicle.capacity}</p>
						<p class="card-text">Rate Per Day: ${vehicle.ratePerDay}</p>
					</div>
				</div>
			</div>
			<div class="col">
				<h3>Enter Booking Dates</h3>
				<form method="post">
					<div class="mb-3">
						<label for="startDate" class="form-label">Start Date:</label> <input
							type="date" class="form-control" name="startDate" required>
					</div>
					<div class="mb-3">
						<label for="endDate" class="form-label">End Date:</label> <input
							type="date" class="form-control" name="endDate" required>
					</div>

					<pre class="text-danger small">${error}</pre>
					<button type="submit" class="btn btn-primary">Confirm
						Booking</button>
				</form>
			</div>
		</div>
	</div>
	<script src="webjars/bootstrap/5.1.3/js/bootstrap.min.js"></script>
	<script src="webjars/jquery/3.6.0/jquery.min.js"></script>
</body>
</html>