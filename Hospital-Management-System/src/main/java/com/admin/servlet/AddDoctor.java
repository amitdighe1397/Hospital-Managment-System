package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDao;
import com.db.DBConnect;
import com.entity.Doctor;

@WebServlet("/add_doctor")
public class AddDoctor extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String fullname = req.getParameter("fullname");
		String dob = req.getParameter("dob");
		String quoli = req.getParameter("quoli");
		String spec = req.getParameter("spec");
		String email = req.getParameter("email");
		String mobno = req.getParameter("mobno");
		String password = req.getParameter("password");

		Doctor d = new Doctor(fullname, dob, quoli, spec, email, mobno, password);

		DoctorDao dao = new DoctorDao(DBConnect.getConnection());
		HttpSession session = req.getSession();

		if (dao.registerDoctro(d)) {
			session.setAttribute("sucMsg", "Doctor added Sucessfully...!");
			resp.sendRedirect("admin/doctor.jsp");
		} else {

			session.setAttribute("error", "Somthing went worng on server");
			resp.sendRedirect("admin/doctor.jsp");

		}
	}

}
