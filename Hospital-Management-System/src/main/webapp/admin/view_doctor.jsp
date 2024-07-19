<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
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
	<div class="container-fluid p-3">
		<div class="row">
			<div class="col-md-12">
				<div class="card point-card">
					<div class="card-body">
						<p class="fs-3 text-center">Doctor Details</p>
						<c:if test="${not empty succMsg}">
							<p class="text-center text-success fs-3">${succMsg}</p>
							<c:remove var="succMsg" />
						</c:if>
						<c:if test="${not empty errorr}">
							<p class="text-center text-danger fs-3">${errorr}</p>
							<c:remove var="errorr" />
						</c:if>

						<table class="table">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">DOB</th>
									<th scope="col">Qualification</th>
									<th scope="col">Specialist</th>
									<th scope="col">Email</th>
									<th scope="col">Mob No</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								DoctorDao dao1 = new DoctorDao(DBConnect.getConnection());
								List<Doctor> list1 = dao1.getAllDoctor();
								for (Doctor d : list1) {
								%>
								<tr>
									<td><%=d.getFullname()%></td>
									<td><%=d.getDob()%></td>
									<td><%=d.getQuoli()%></td>
									<td><%=d.getSpec()%></td>
									<td><%=d.getEmail()%></td>
									<td><%=d.getMobno()%></td>
									<td><a href="edit_doctor.jsp?id=<%=d.getId()%>"
										class="btn btn-sm mr-2 my-2 my-sm-0 btn-primary">Edit</a> 
										<a href="../deleteDoctor?id=<%=d.getId()%>"
										class="btn btn-sm btn-danger" style="margin-left: 10px;">Delete</a></td>

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