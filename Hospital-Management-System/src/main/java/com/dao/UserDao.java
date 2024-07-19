package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.entity.User;

public class UserDao {
	private Connection conn;

	public UserDao(Connection conn) {
		this.conn = conn;
	}

	public boolean userRegister(User u) {
		boolean f = false;
		try {
			String query = "INSERT INTO user_dtls(full_name, email, password) VALUES (?, ?, ?)";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, u.getName());
			pstmt.setString(2, u.getEmail());
			pstmt.setString(3, u.getPassword());

			int i = pstmt.executeUpdate();
			if (i > 0) {
				f = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return f;
	}

	public User login(String em, String pw) {
		User u = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT * FROM user_dtls WHERE email = ? AND password = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, em);
			ps.setString(2, pw);

			rs = ps.executeQuery();
			if (rs.next()) {
				u = new User();
				u.setId(rs.getInt("id"));
				u.setName(rs.getString("full_name"));
				u.setEmail(rs.getString("email"));
				u.setPassword(rs.getString("password"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();

			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return u;
	}

	public boolean checkOldPassword(int userId, String oldPassword) {
		boolean isValid = false;
		try {
			String query = "SELECT * FROM user_dtls WHERE id=? AND password=?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, userId);
			pstmt.setString(2, oldPassword);

			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				isValid = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isValid;
	}

	public boolean changePassword(int userId, String newPassword) {
		boolean isChanged = false;
		try {
			String query = "UPDATE user_dtls SET password =? WHERE id=?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, newPassword);
			pstmt.setInt(2, userId);

			int rowsAffected = pstmt.executeUpdate();
			if (rowsAffected == 1) {
				isChanged = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isChanged;
	}

}
