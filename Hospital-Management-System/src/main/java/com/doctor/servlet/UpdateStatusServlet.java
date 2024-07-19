package com.doctor.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.dao.AppointmentDao;
import com.db.DBConnect;

@WebServlet("/updateStatus")
public class UpdateStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			int id = Integer.parseInt(req.getParameter("id"));
			int did = Integer.parseInt(req.getParameter("did"));
			String comm = req.getParameter("comm");

			AppointmentDao dao = new AppointmentDao(DBConnect.getConnection());

			HttpSession session = req.getSession();
			if (dao.updateCommentStatus(id, did, comm)) {
				session.setAttribute("sucMsg", "Comment Updated");
				resp.sendRedirect("doctor/patient.jsp");
			} else {
				session.setAttribute("error", "Something went wrong on the server");
				resp.sendRedirect("doctor/patient.jsp");
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

	}
}
