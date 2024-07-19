package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AppointmentDao;
import com.db.DBConnect;
import com.entity.Appointment;

@WebServlet("/add_Appointment")
public class AppointmentServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int userid = Integer.parseInt(req.getParameter("userid"));
		String fullName = req.getParameter("fullname");
		String gender = req.getParameter("gender");
		String age = req.getParameter("age");
		String appoinDate = req.getParameter("appoinDate");
		String email = req.getParameter("email");
		String phNo = req.getParameter("phno");
		String diseases = req.getParameter("diseases");
		int doctorId = Integer.parseInt(req.getParameter("doct"));
		String address = req.getParameter("address");
		Appointment ap = new Appointment(userid, fullName, gender, age, appoinDate, email, phNo, diseases, doctorId,
				address, "Pending");
		AppointmentDao dao = new AppointmentDao(DBConnect.getConnection());

		HttpSession session = req.getSession();
		if (dao.addAppointment(ap)) {

			session.setAttribute("sucMsg", "Appointment Sucessfully");
			resp.sendRedirect("user_appointment.jsp");
		} else {

			session.setAttribute("error", "Somthing worng on server");
			resp.sendRedirect("user_appointment.jsp");

		}
	}

}
