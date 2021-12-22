package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBManager {
	private DBManager() {}
	
	private static DBManager instance = new DBManager();
	
	public static DBManager getInstance() {
		return instance;
	}
		
	//모든 DAO 안에서 DB연동이 필요할때,
	//Connection conn = DBManager.getConnection()
	
	//연동된 DB(Schema) 안에 있는 데이터 중,
	//어떤 테이블을 쓸지 -> use 스키마명(sql 명령어 추가)
	
	public static Connection getConnection() {
		Connection conn = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String url = "jdbc:mysql://localhost:3306/rentalcar?serverTimezone=UTC";
			String id = "root";
			String pw = "9745";
			
			conn = DriverManager.getConnection(url, id, pw);
			
			if(conn != null) {
				System.out.println("데이터베이스 연동 성공");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("데이터베이스 연동 실패");
		}
		
		return conn;
	}
}
