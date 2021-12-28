package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBManager {
	private DBManager() {}

	private static DBManager instance = new DBManager();

	public static DBManager getInstance() {
		return instance;
	}

	public static Connection getConnection() {
		Connection conn = null;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			String url = "jdbc:mysql://localhost:3306/board?serverTimezone=UTC";
			String id = "root";
			String pw = "9745";

			conn = DriverManager.getConnection(url, id, pw);

			if (conn != null) {
				System.out.println("데이터베이스 연동 성공");
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("데이터베이스 연동 실패");
		}

		return conn;
	}
}
