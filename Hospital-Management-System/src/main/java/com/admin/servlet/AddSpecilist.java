package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.SpecalistDao;
import com.db.DBConnect;

@WebServlet("/addspecialist")
public class AddSpecilist extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String spec_Name = req.getParameter("specName");

		SpecalistDao dao = new SpecalistDao(DBConnect.getConnection());
		boolean f = dao.addSpecalist(spec_Name);

		HttpSession session = req.getSession();

		if (f) {
			session.setAttribute("sucMsg", "Specialist Added");
			resp.sendRedirect("admin/index.jsp");

		} else {

			session.setAttribute("error", "Somthing Worng on server");
			resp.sendRedirect("admin/index.jsp");
		}

	}

}
