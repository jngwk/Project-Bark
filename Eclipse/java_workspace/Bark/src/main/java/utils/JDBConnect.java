package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletContext;

public class JDBConnect {
	public Connection conn;
	public PreparedStatement pstmt;
	public ResultSet rs;
	
	public JDBConnect(ServletContext application) {
		try {
			String sql = application.getInitParameter("MySQLDriver");
			String url = application.getInitParameter("MySQLUrl");
			String id = application.getInitParameter("MySQLId");
			String pwd = application.getInitParameter("MySQLPwd");
			Class.forName(sql);
			conn = DriverManager.getConnection(url, id, pwd);
			System.out.println("Database connection successful");
		}catch (Exception e) {
			System.out.println("Database connection error: " + e.getMessage());
		}
	}
}
