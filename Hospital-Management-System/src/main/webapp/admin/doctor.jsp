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
			<div class="col-md-5 offset-md-4 ">
				<div class="card point-card">
					<div class="card-body">
						<p class="fs-3 text-center">Add Doctor</p>

						<c:if test="${not empty sucMsg}">
							<p class="text-center text-success fs-4">${sucMsg}</p>
							<c:remove var="sucMsg" />
						</c:if>
						<c:if test="${not empty error}">
							<p class="text-center text-danger fs-4">${error}</p>
							<c:remove var="error" />
						</c:if>

						<form action="../add_doctor" method="post">
							<div class="mb-3">
								<label class="form-lable">Full Name</label><input type="text"
									required name="fullname" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-lable">DOB</label><input type="date"
									name="dob" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-lable">Qualification</label><input
									type="text" name="quoli" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-lable">Specialist</label><select name="spec"
									required class="form-control">
									<option>--Select--</option>
									<%
									SpecalistDao dao = new SpecalistDao(DBConnect.getConnection());
									List<Specalist> list = dao.getAllSpecialist();
									for (Specalist s : list) {
									%>
									<option><%=s.getSpecalistName()%>demo
									</option>
									<%
									}
									%>
								</select>
							</div>

							<div class="mb-3">
								<label class="form-lable">Email</label><input type="text"
									required name="email" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-lable">Mob No</label><input type="text"
									name="mobno" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-lable">Password</label><input type="password"
									required name="password" class="form-control">
							</div>
							<button type="submit" class="col-md-12 btn btn-primary mt-3">Submit</button>
						</form>
					</div>
				</div>
			</div>

		</div>
	</div>


</body>
</html>