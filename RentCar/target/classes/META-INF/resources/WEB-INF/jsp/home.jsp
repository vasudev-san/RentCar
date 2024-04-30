<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Car Rental System</title>
<!-- Add Bootstrap CSS -->
<link href="webjars/bootstrap/5.1.3/css/bootstrap.min.css"
	rel="stylesheet">

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
		<div class="row">
			<div class="col-md-6">
				<img src="logo.png" alt="Image" class="img-fluid">
			</div>
			<div class="col-md-6">
				<h1>Welcome to Our Car Rental System</h1>
				<p>At Our Car Rental System, we offer a wide range of vehicles
					to suit your needs. Whether you're looking for a compact car for
					city driving or a spacious SUV for a family road trip, we have you
					covered.</p>
				<p>Our easy-to-use online booking system allows you to reserve
					your vehicle in just a few clicks. You can choose from our
					selection of cars, SUVs, and vans. We pride ourselves on our
					exceptional customer service, and our team is always available to
					answer any questions you may have. We also offer 24/7 roadside
					assistance, so you can have peace of mind while on the road.</p>
				<p>Book your rental car today and experience the convenience and
					flexibility of Our Car Rental System.</p>
			</div>
		</div>
	</div>

	<!-- Add Bootstrap JS -->
	<script src="webjars/bootstrap/5.1.3/js/bootstrap.min.js"></script>
	<script src="webjars/jquery/3.6.0/jquery.min.js"></script>
</body>
</html>