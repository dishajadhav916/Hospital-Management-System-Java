<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	 <%@ page import = "java.sql.Connection" %>
 <%@ page import = "com.db.DBConnect" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@ include file="component/allcss.jsp"%>
	<%@ include file="component/navbar.jsp"%>
	
	<div id="carouselExampleIndicators" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="img/main.jpg" class="d-block w-100" alt="..."
					height="600px">
			</div>
			<div class="carousel-item">
				<img src="img/main2.jpg" class="d-block w-100" alt="..."
					height="600px">
			</div>
			<div class="carousel-item">
				<img src="img/doc5.jpg" class="d-block w-100" alt="..."
					height="600px">
			</div>
			

		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>

	<div class="container p-3">

		<p class="text-center fs-2">Key features of our Hospital</p>
		
	
		
		<div class="row">
			<div class="col-md-8 p-5">
				<div class="row">
					<div class="col-md-6">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">100% Safety</p>
								<p>Lorem Ipsum is simply dummy text of the printing and
									typesetting industry.</p>
							</div>
						</div>
					</div>

					<div class="col-md-6">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">100% Safety</p>
								<p>Lorem Ipsum is simply dummy text of the printing and
									typesetting industry.</p>
							</div>
						</div>
					</div>

					<div class="col-md-6 mt-2">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">100% Safety</p>
								<p>Lorem Ipsum is simply dummy text of the printing and
									typesetting industry.</p>
							</div>
						</div>
					</div>

					<div class="col-md-6 mt-2">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">100% Safety</p>
								<p>Lorem Ipsum is simply dummy text of the printing and
									typesetting industry.</p>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<img alt="error" src="img/team1.jpg" width="400px" height="400px"/>
			</div>
		</div>
	</div>
	<hr>

		<div class="container p-2">
			<p class="text-center fs-2">Our Team</p>
			<div class="row">
				<div class="col-md-3">
					<div class="card paint-card">
						<div class="card-body text-center">
							<img src="img/team1.jpg" alt="error" width="280px" height="300px">
							<p class="fw-bold fs-5">Dr. Siya</p>
							<p class="fs-7">CEO & Chairman</p>
						</div>
					</div>
				</div>
				
				<div class="col-md-3">
					<div class="card paint-card">
						<div class="card-body text-center">
							<img src="img/team2.jpg" alt="error" width="280px" height="300px">
							<p class="fw-bold fs-5">Dr. Kavya</p>
							<p class="fs-7">Chief Doctor</p>
						</div>
					</div>
				</div>
				
				<div class="col-md-3">
					<div class="card paint-card">
						<div class="card-body text-center">
							<img src="img/team3.jpg" alt="error" width="280px" height="300px">
							<p class="fw-bold fs-5">Dr. John</p>
							<p class="fs-7">Chief Doctor</p>
						</div>
					</div>
				</div>
				
				<div class="col-md-3">
					<div class="card paint-card">
						<div class="card-body text-center">
							<img src="img/team4.jpg" alt="error" width="280px" height="300px">
							<p class="fw-bold fs-5">Dr. Nitin</p>
							<p class="fs-7">Chief Doctor</p>
						</div>
					</div>
				</div>
			</div>
		</div>

	<%@include file="component/footer.jsp" %>
</body>
</html>