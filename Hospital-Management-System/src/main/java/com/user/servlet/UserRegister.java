package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.dao.UserDao;
import com.db.DBConnect;
import com.entity.User;

@WebServlet("/user")
public class UserRegister extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String fullname = req.getParameter("fullname");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		User u = new User(fullname, email, password);
		UserDao userDao = new UserDao(DBConnect.getConnection());

		HttpSession session = req.getSession();

		try {
			boolean f = userDao.userRegister(u);

			if (f) {
				session.setAttribute("sucMsg", "Register Successful");
				resp.sendRedirect("signup.jsp"); // Ensure this path is correct
			} else {
				session.setAttribute("error", "Something went wrong on the server");
				resp.sendRedirect("signup.jsp"); // Ensure this path is correct
			}
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("error", "An unexpected error occurred: " + e.getMessage());
			resp.sendRedirect("signup.jsp"); // Ensure this path is correct
		}
	}
}
