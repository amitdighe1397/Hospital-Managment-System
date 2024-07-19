<%@page import="com.entity.Doctor"%>
<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.AppointmentDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Patient Details</title>
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
	<div class="container p-3">
		<div class="row">
			<div class="col-md-12">
				<div class="card point-card">
					<div class="card-body">
						<p class="fs-3 text-center text-primary">Patient Details</p>
						<c:if test="${not empty sucMsg}">
							<p class="text-center text-success fs-3">${sucMsg}</p>
							<c:remove var="sucMsg" scope="session" />
						</c:if>
						<c:if test="${not empty error}">
							<p class="text-center text-danger fs-3">${error}</p>
							<c:remove var="error" scope="session" />
						</c:if>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">FullName</th>
									<th scope="col">Gender</th>
									<th scope="col">Age</th>
									<th scope="col">Appointment Date</th>
									<th scope="col">Email</th>
									<th scope="col">Mob No</th>
									<th scope="col">Diseases</th>
									<th scope="col">Status</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								Doctor d = (Doctor) session.getAttribute("doctObj");
            
								if (d != null) {
									AppointmentDao dao = new AppointmentDao(DBConnect.getConnection());
									List<Appointment> list = dao.getAllAppointmentByDoctorLogin(d.getId());

									if (list != null && !list.isEmpty()) {
										for (Appointment ap : list) {
								%>
								<tr>
									<td><%=ap.getFullName()%></td>
									<td><%=ap.getGender()%></td>
									<td><%=ap.getAge()%></td>
									<td><%=ap.getAppoinDate()%></td>
									<td><%=ap.getEmail()%></td>
									<td><%=ap.getPhNo()%></td>
									<td><%=ap.getDiseases()%></td>
									<td><%=ap.getStatus()%></td>
									<td><a href="comment.jsp?id=<%=ap.getId() %>" class="btn btn-primary btn-sm">Comment</a>
									</td>
								</tr>
								<%
								}
								} else {
								%>
								<tr>
									<td colspan="9" class="text-center">No appointments found.</td>
								</tr>
								<%
								}
								} else {
								%>
								<tr>
									<td colspan="9" class="text-center">No doctor found in
										session.</td>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
