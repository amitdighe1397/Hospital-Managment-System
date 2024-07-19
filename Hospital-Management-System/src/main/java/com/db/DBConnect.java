package com.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	private static Connection conn;

	public static Connection getConnection() {
		try {
			if (conn == null) {
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "root");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
}
