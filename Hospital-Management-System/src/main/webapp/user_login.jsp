<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Login Page</title>
<%@ include file="component/allcss.jsp"%>
<style type="text/css">
body {
	background-image: url('img/hospi1.jpg');
	background-size: cover;
	background-repeat: no-repeat;
	background-attachment: fixed;
}

.point-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0.3);
	background-color: rgba(255, 255, 255, 0.8);
}
</style>
</head>
<body>
	<%@ include file="component/navbar.jsp"%>
	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card point-card">
					<div class="card-body">
						<p class="fs-4 text-center">User Login</p>
						<c:if test="${not empty sucMsg}">
							<p class="text-center text-success fs-5">${sucMsg}</p>
							<c:remove var="sucMsg" />
						</c:if>

						<c:if test="${not empty error}">
							<p class="text-center text-danger fs-5">${error}</p>
							<c:remove var="error" />
						</c:if>

						<form action="userLogin" method="post">
							<div class="md-3">
								<label class="form-lable">Email Address</label><input
									required="required" name="email" type="email"
									class="form-control">
							</div>
							<div class="md-3">
								<label class="form-lable">Password</label><input
									required="required" name="password" type="password"
									class="form-control">
							</div>
							<br>
							<button type="submit" class="btn bg-primary text-white col-md-12">Login</button>
						</form>
						<br> Don't have an account? <a href="signup.jsp"
							class="text-decoration-none">Create one </a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
