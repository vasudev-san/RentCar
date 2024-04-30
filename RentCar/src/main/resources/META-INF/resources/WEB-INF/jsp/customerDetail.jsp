<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="webjars/bootstrap/5.1.3/css/bootstrap.min.css"
	rel="stylesheet">
<title>Rent Car</title>
<style>
.account-section {
	background-color: #f8f9fa;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1), 0 1px 3px rgba(0, 0, 0, 0.08);
}

.account-details {
	margin-bottom: 20px;
}

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
		<h1>Customer Details</h1>
		<div class="account-section">
			<h3 class="mb-4">Account Information</h3>
			<div class="row account-details">
				<div class="col-md-3">Name:</div>
				<div class="col-md-9">${customer.firstname}
					${customer.lastname}</div>
			</div>
			<div class="row account-details">
				<div class="col-md-3">Phone No:</div>
				<div class="col-md-9">${customer.phoneNo}</div>
			</div>
			<div class="row account-details">
				<div class="col-md-3">Gender:</div>
				<div class="col-md-9">${customer.gender}</div>
			</div>
			<div class="row account-details">
				<div class="col-md-3">Driving License:</div>
				<div class="col-md-9">${customer.drivingLicenseNo}</div>
			</div>
		</div>
	</div>
	<script src="webjars/bootstrap/5.1.3/js/bootstrap.min.js"></script>
	<script src="webjars/jquery/3.6.0/jquery.min.js"></script>
</body>
</html>