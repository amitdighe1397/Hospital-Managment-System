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

@WebServlet("/updateDoctor")
public class UpdateDoctor extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String fullname = req.getParameter("fullname");
			String dob = req.getParameter("dob");
			String quali = req.getParameter("quoli");
			String spec = req.getParameter("spec");
			String email = req.getParameter("email");
			String mobno = req.getParameter("mobno");
			String password = req.getParameter("password");
			int id = Integer.parseInt(req.getParameter("id"));

			Doctor d = new Doctor(id, fullname, dob, quali, spec, email, mobno, password);
			
			DoctorDao dao = new DoctorDao(DBConnect.getConnection());
			HttpSession session = req.getSession();

			if (dao.updateDoctor(d)) {
				session.setAttribute("succMsg", "Doctor updated successfully!");
				resp.sendRedirect("admin/doctor.jsp");
			} else {
				session.setAttribute("errorr", "Something went wrong on the server.");
				resp.sendRedirect("admin/doctor.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();

		}
	}
}
