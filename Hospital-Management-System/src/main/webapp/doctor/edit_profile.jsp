<%@page import="com.entity.Specalist"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.SpecalistDao"%>
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
	background-image: url('../img/hospi.jpg');
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
<%@ include file="../component/allcss.jsp"%>
</head>
<body>

	<c:if test="${empty doctObj}">
		<c:redirect url="../doctor_login.jsp" />
	</c:if>

	<%@ include file="navbar.jsp"%>
	<div class="container p-4">
		<div class="row">
			<div class="col-md-4 ">
				<div class=" point-card">
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
							<form action="../doctChangePassword" method="post">
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
								<input type="hidden" value="${doctObj.id}" name="uid">
								<button type="submit" class="btn btn-primary col-md-12">Change
									Password</button>
							</form>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-8">
				<div class=" point-card">
					<div class="card-body">
						<p class="text-center fs-3">Edit Profile</p>
						<c:if test="${not empty sucMsg}">
							<p class="text-center text-success fs-3">${sucMsg}</p>
							<c:remove var="sucMsg" />
						</c:if>

						<c:if test="${not empty error}">
							<p class="text-center text-danger fs-3">${error}</p>
							<c:remove var="error" />
						</c:if>

						<form action="../doctorUpdateProfile" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label> <input type="text"
									required name="fullname" class="form-control"
									value="${doctObj.fullname}">
							</div>
							<div class="mb-3">
								<label class="form-label">DOB</label> <input type="date"
									name="dob" class="form-control" value="${doctObj.dob}">
							</div>
							<div class="mb-3">
								<label class="form-label">Qualification</label> <input
									type="text" name="quoli" class="form-control"
									value="${doctObj.quoli}">
							</div>
							<div class="mb-3">
								<label class="form-label">Specialist</label> <select name="spec"
									required class="form-control" value="${doctObj.spec}">
									<option>--Select--</option>
									<%
									SpecalistDao dao = new SpecalistDao(DBConnect.getConnection());
									List<Specalist> list = dao.getAllSpecialist();
									for (Specalist s : list) {
									%>
									<option><%=s.getSpecalistName()%></option>
									<%
									}
									%>
								</select>
							</div>

							<div class="mb-3">
								<label class="form-label">Email</label> <input type="text"
									readonly required name="email" class="form-control"
									value="${doctObj.email}">
							</div>
							<div class="mb-3">
								<label class="form-label">Mob No</label> <input type="text"
									name="mobno" class="form-control" value="${doctObj.mobno}">
							</div>
							<input type="hidden" name="id" value="${doctObj.id }">
							<button type="submit" class="col-md-12 btn btn-primary mt-3">Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
