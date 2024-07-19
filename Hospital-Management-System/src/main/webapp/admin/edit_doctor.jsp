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
.point-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<div class="container-fluid p-3">
		<div class="row">
			<div class="col-md-4  offset-md-4">
				<div class="card point-card">
					<div class="card-body">
						<p class="fs-3 text-center">Edit Doctor Details</p>

						<c:if test="${not empty sucMsg}">
							<p class="text-center text-success fs-3">${sucMsg}</p>
							<c:remove var="sucMsg" />
						</c:if>
						<c:if test="${not empty error}">
							<p class="text-center text-danger fs-3">${error}</p>
							<c:remove var="error" />
						</c:if>


						<%
						int id = Integer.parseInt(request.getParameter("id"));
						DoctorDao dao2 = new DoctorDao(DBConnect.getConnection());
						Doctor d = dao2.getDoctorById(id);
						%>

						<form action="../updateDoctor" method="post">
							<div class="mb-3">
								<label class="form-lable">Full Name</label><input type="text"
									required name="fullname" class="form-control"
									value="<%=d.getFullname()%>">
							</div>
							<div class="mb-3">
								<label class="form-lable">DOB</label><input type="date"
									name="dob" class="form-control" value="<%=d.getDob()%>">
							</div>
							<div class="mb-3">
								<label class="form-lable">Qualification</label><input
									type="text" name="quoli" class="form-control"
									value="<%=d.getQuoli()%>">
							</div>
							<div class="mb-3">
								<label class="form-lable">Specialist</label><select name="spec"
									required class="form-control">
									<option><%=d.getSpec()%></option>
									<%
									SpecalistDao dao = new SpecalistDao(DBConnect.getConnection());
									List<Specalist> list = dao.getAllSpecialist();
									for (Specalist s : list) {%>
									<option><%=s.getSpecalistName()%></option>
									<%
									}
									%>
								</select>
							</div>

							<div class="mb-3">
								<label class="form-lable">Email</label><input type="text"
									required name="email" class="form-control"
									value="<%=d.getEmail()%>">
							</div>
							<div class="mb-3">
								<label class="form-lable">Mob No</label><input type="text"
									name="mobno" class="form-control" value="<%=d.getMobno()%>">
							</div>
							<div class="mb-3">
								<label class="form-lable">Password</label><input type="text"
									required name="password" class="form-control"
									value="<%=d.getPassword()%>">
							</div>
							<input type="hidden" name="id" required value="<%=d.getId()%>">
							<button type="submit" class="btn btn-primary col-md-12">Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>


</body>
</html>