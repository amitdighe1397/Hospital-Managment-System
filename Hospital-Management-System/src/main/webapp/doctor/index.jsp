<%@page import="com.entity.Doctor"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="../component/allcss.jsp"%>
<style type="text/css">
body {
	background-image: url('../img/hospi.jpg');
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
	<%@ include file="navbar.jsp"%>

	<p class="text-center fs-3 mt-5 text-white">Doctor Dashboard</p>
	<div class="container p-5 offset-md-2">
		<c:if test="${not empty sucMsg}">
			<p class="text-center text-success fs-3">${sucMsg}</p>
			<c:remove var="sucMsg" />
		</c:if>
		<c:if test="${not empty error}">
			<p class="text-center text-danger fs-3">${error}</p>
			<c:remove var="error" />
		</c:if>
		<%
		Doctor d = (Doctor) session.getAttribute("doctObj");
		DoctorDao dao = new DoctorDao(DBConnect.getConnection());
		%>
		<div class="row">
			<div class="col-md-4">
				<div class="card point-card">
					<div class="card-body text-center text-primary">
						<i class="fas fa-user-md fa-3x"></i><br>
						<p class="fs-4 text-center">
							Doctor<br><%=dao.countDoctor()%>
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card point-card">
					<div class="card-body text-center text-primary">
						<i class="fas fa-calendar-check fa-3x"></i><br>
						<p class="fs-4 text-center">
							Total Appointments<br><%=dao.countAppointmentByDoctroId(d.getId())%>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>