<%@page import="java.util.ArrayList"%>
<%@page import="com.entity.Doctor"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Appointment Page</title>
<%@ include file="../component/allcss.jsp"%>
<style type="text/css">
body {
	background-image: url('img/hospi.jpg');
	background-size: cover;
	background-repeat: no-repeat;
	background-attachment: fixed;
}

.point-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
	background-color: rgba(255, 255, 255, 0.8);
	/* Adjust the transparency level as needed */
}


</style>
</head>
<body>
	<%@ include file="../component/navbar.jsp"%>

	<div class="container-fluid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>
	<div class="container p-3 ">
		<div class="row">
			<!-- <div class="col-md-6 p-5">
				<img alt="Doctor Image" src="img/doc1.png">
			</div> -->
			<div class="col-md-6 offset-md-3">
				<div class="card point-card">
					<div class="card-body">
						<p class="text-center fs-3">User Appointment</p>
						<c:if test="${not empty error}">
							<p class="text-center text-danger fs-4">${error}</p>
							<c:remove var="error" scope="session" />
						</c:if>
						<c:if test="${not empty sucMsg}">
							<p class="text-center text-success fs-4">${sucMsg}</p>
							<c:remove var="sucMsg" scope="session" />
						</c:if>
						<form class="row g-3" action="add_Appointment" method="post">

							<input type="hidden" name="userid" value="${userObj.id}">

							<div class="col-md-6">
								<label for="inputFullName" class="form-label">Full Name</label>
								<input required type="text" class="form-control"
									id="inputFullName" name="fullname">
							</div>
							<div class="col-md-6">
								<label for="inputGender" class="form-label">Gender</label> <select
									class="form-control" id="inputGender" name="gender" required>
									<option value="male">Male</option>
									<option value="female">Female</option>
								</select>
							</div>
							<div class="col-md-6">
								<label for="inputAge" class="form-label">Age</label> <input
									required type="number" class="form-control" id="inputAge"
									name="age">
							</div>
							<div class="col-md-6">
								<label for="inputDate" class="form-label">Appointment
									Date</label> <input type="date" class="form-control" id="inputDate"
									required name="appoinDate">
							</div>
							<div class="col-md-6">
								<label for="inputEmail" class="form-label">Email</label> <input
									required type="email" class="form-control" id="inputEmail"
									name="email">
							</div>
							<div class="col-md-6">
								<label for="inputPhone" class="form-label">Phone No</label> <input
									maxlength="10" required type="number" class="form-control"
									id="inputPhone" name="phno">
							</div>
							<div class="col-md-6">
								<label for="inputDiseases" class="form-label">Diseases</label> <input
									required type="text" class="form-control" id="inputDiseases"
									name="diseases">
							</div>
							<div class="col-md-6">
								<label for="inputDoctor" class="form-label">Doctor</label> <select
									required class="form-control" id="inputDoctor" name="doct">
									<option value="">--Select--</option>
									<%
									DoctorDao dao = new DoctorDao(DBConnect.getConnection());
									List<Doctor> list = dao.getAllDoctor();
									for (Doctor d : list) {
									%>
									<option value="<%=d.getId()%>"><%=d.getFullname()%> (<%=d.getSpec()%>)
									</option>
									<%
									}
									%>
								</select>
							</div>
							<div class="col-md-12">
								<label for="inputAddress" class="form-label">Full
									Address</label>
								<textarea required name="address" class="form-control"
									id="inputAddress" rows="3"></textarea>
							</div>
							<c:if test="${empty userObj}">
								<a href="user_login.jsp"
									class="col-md-6 offset-md-3 btn btn-primary">Submit</a>
							</c:if>
							<c:if test="${not empty userObj}">
								<button type="submit"
									class="col-md-6 offset-md-3 btn btn-primary">Submit</button>
							</c:if>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
