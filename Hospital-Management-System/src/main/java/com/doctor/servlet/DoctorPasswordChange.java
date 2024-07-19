package com.doctor.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDao;
import com.dao.UserDao;
import com.db.DBConnect;

@WebServlet("/doctChangePassword")
public class DoctorPasswordChange extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int uid = Integer.parseInt(req.getParameter("uid"));
		String oldPassword = req.getParameter("oldpassword");
		String newPassword = req.getParameter("newpassword");

		DoctorDao dao = new DoctorDao(DBConnect.getConnection());
		HttpSession session = req.getSession();
		if (dao.checkOldPassword(uid, oldPassword)) {

			if (dao.changePassword(uid, newPassword)) {
				session.setAttribute("sucMsg", "Password Change Sucessesfully");
				resp.sendRedirect("doctor/edit_profile.jsp");
			} else {
				session.setAttribute("error", "Somthing Went Worng On Server");
				resp.sendRedirect("doctor/edit_profile.jsp");
			}
		} else {
			session.setAttribute("error", "Old Password Incorrect");
			resp.sendRedirect("doctor/edit_profile.jsp");

		}
	}
}
