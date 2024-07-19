<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
body {
	background-image: url('img/hospi.jpg');
	background-size: cover;
	background-repeat: no-repeat;
	background-attachment: fixed;
}

.point-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
	background-color: rgba(255, 255, 255, 0.6);
	/* Adjust the transparency level as needed */
}
</style>
<%@ include file="component/allcss.jsp"%>
</head>
<body>
	<%@ include file="../component/navbar.jsp"%>
	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="point-card">
					<div class="card-body">
						<p class="text-center fs-3">Change Password</p>
						<c:if test="${not empty sucMsg}">
							<p class="text-center text-success fs-3">${sucMsg}</p>
							<c:remove var="sucMsg" />
						</c:if>

						<c:if test="${not empty error}">
							<p class="text-center text-danger fs-3">${error}</p>
							<c:remove var="error" />
						</c:if>
						<div class="card-body">
							<form action="userChangePassword" method="post">
								<div class="mb-3">
									<label for="newpassword" class="form-label">Enter New
										Password</label> <input type="password" id="newpassword"
										name="newpassword" class="form-control" required>
								</div>

								<div class="mb-3">
									<label for="oldpassword" class="form-label">Enter Old
										Password</label> <input type="password" id="oldpassword"
										name="oldpassword" class="form-control" required>
								</div>
								<input type="hidden" value="${userObj.id}" name="uid">
								<button type="submit" class="btn btn-primary col-md-12">Change
									Password</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
</body>
</html>
