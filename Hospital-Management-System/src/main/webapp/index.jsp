<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index.jsp</title>
<style type="text/css">
.point-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0.3);
}
</style>

<%@ include file="component/allcss.jsp"%>

</head>
<body>
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
				<img src="img/doc4.png" class="d-block w-100" alt="..."
					height="800px">
			</div>
			<div class="carousel-item">
				<img src="img/doc2.png" class="d-block w-100" alt="..."
					height="800px">
			</div>
			<div class="carousel-item">
				<img src="img/doc3.png" class="d-block w-100" alt="..."
					height="800px">
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
		<p class="text-center fs-2">Key Features Of The Hospital</p>
		<div class="row">
			<div class="col-md-8 p-5">
				<div class="row">
					<div class="col-md-6">
						<div class="card point-card">
							<div class="card-body">
								<p class="fs-5">100% Safety</p>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
									voluptatem, inventore</p>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="card point-card">
							<div class="card-body">
								<p class="fs-5">Clean Environment</p>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
									voluptatem, inventore</p>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="card point-card">
							<div class="card-body">
								<p class="fs-5">Fraindly Doctors</p>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
									voluptatem, inventore</p>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="card point-card">
							<div class="card-body">
								<p class="fs-5">Medical Resarch</p>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
									voluptatem, inventore</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<img alt="" src="img/doc1.png" style="margin-top: 5%; width:"
					height="">
			</div>
		</div>
		<hr>
		<div class="container p-2">
			<p class="text-center fs-2">Our Team</p>
			<div class="row">
				<div class="col-md-3">
					<div class="card point-card">
						<div class="card-body text-center">
							<img alt="" src="img/samuani.png" width="250px" height="300px">
							<p class="fw-bold fs-5">Samuani Simi</p>
							<p class="fs-7">(CEO & Chairman)</p>

						</div>

					</div>

				</div>

				<div class="col-md-3">
					<div class="card point-card">
						<div class="card-body text-center">
							<img alt="" src="img/shiv.png" width="250px" height="300px">
							<p class="fw-bold fs-5">Dr.Shiv Kumar</p>
							<p class="fs-7">(Chief Doctor)</p>

						</div>

					</div>

				</div>
				<div class="col-md-3">
					<div class="card point-card">
						<div class="card-body text-center">
							<img alt="" src="img/Niuise.png" width="250px" height="300px">
							<p class="fw-bold fs-5">Dr. Niuise Paule</p>
							<p class="fs-7">(Chief Doctor)</p>

						</div>

					</div>

				</div>
				<div class="col-md-3">
					<div class="card point-card">
						<div class="card-body text-center">
							<img alt="" src="img/mathu.png" width="250px" height="300px">
							<p class="fw-bold fs-5">Dr. Mathue Samuel</p>
							<p class="fs-7">(Cheif Doctor)</p>

						</div>

					</div>

				</div>
			</div>

		</div>

		<%@ include file="component/footer.jsp"%>
</body>
</html>