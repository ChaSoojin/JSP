package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;

//만들어놓은 DTO를 실제 DB로 처리

public class UserDAO {
	public static final int REMOVE = 0;
	public static final int UPDATE = 1;
	
	//DAO : Date Access Object (중앙에서 모든 데이터 관리)
	
	//1. Singletone Pattern
	
	//생성자
	private UserDAO() {}
	
	//다른 class에서 new하지 않게(DTO 데이터를 막 생성하지 않게) 해당 클래스에서만 new하고, 대신 getter생성
	private static UserDAO instance = new UserDAO();
	
	public static UserDAO getInstance() {
		return instance;
	}
	
	//2.DTO에 대한 객체 배열
	ArrayList<UserDTO> users = null;
	
	
	//3.실제 DB에 연동할 객체들[SQL에 대한 처리]
	//ㄴ 1) Connection : DB연동에 필요함
	//ㄴ 2) PreparedStatement : DB에 쿼리를 날릴 준비 
	//ㄴ 3) ResultSet : execute된 쿼리에 대한 결과값
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private Connection getConnection() {
		try {
			//드라이버 로드(Driver클래스 위치 넘겨줌으로써 해당 드라이버의 정보를 로드)
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			//jdbc:mysql://localhost:3306/데이터베이스스키마명?serverTimezone=UTC
			String url = "jdbc:mysql://localhost:3306/board?serverTimezone=UTC"; //DB주소[워크벤치-우클릭-copy jdbc connection string to clipboard]  
			String id = "root";
			String pw = "9745";
			
			//연결얻기(로드한 정보를 가지고 DriverManager에 해당 드라이버가 등록, 그 후 커넥션 get)
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
	
	//데이터조회(객체배열 초기화 -> 가져온 데이터에 대해서)
	public ArrayList<UserDTO> getUsers() {
				
		//쿼리를 스트링 타입으로 작성
		try {
			conn = getConnection(); 			//DB연동
			
			String str = "select * from users"; //sql 쿼리 준비
			pstmt = conn.prepareStatement(str); //준비한 쿼리를 prepareStatement() 메소드를 이용해 str을 태움
			rs = pstmt.executeQuery(); //태운 쿼리를 날림과 동시에 resultset으로 결과값을 받음(1줄씩 행단위 객체로 불러옴)
			
			//executeQuery : 반환값이 resultset이기 때문에 해당 메소드 호출
			
			users = new ArrayList<UserDTO>();
			
			while(rs.next()) { //행(row) 단위 : 다음 행이 있으면 계속 string타입으로 꺼내옴
				//mysql에서는 컬럼 인덱스가 1부터 시작
				//즉 id가 1인덱스, pw 2인덱스, regDate 3인덱스
				String id = rs.getString(1);  //id정보
				String pw = rs.getString(2);  //pw정보
				Timestamp regDate = rs.getTimestamp(3); //regDate정보
				
				users.add(new UserDTO(id,pw,regDate)); //브라우저에 사용자에게 보여주기 위한 객체생성
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return users;
	}
	
	//유저추가
	public boolean addUser(UserDTO user) {
		
		Calendar cd = Calendar.getInstance();
		long time = cd.getTimeInMillis();
		Timestamp regDate = new Timestamp(time);
		
		
		try {			
			UserDTO newUser = new UserDTO(user.getId(), user.getPw(), regDate);
			
			if(checkId(user.getId())) {
				conn = getConnection();
				String str = "insert into users values(?, ?, ?)"; //?자리는 맵핑값을 setter로 처리할 포맷
				pstmt = conn.prepareStatement(str);
				
				//쿼리완성
				pstmt.setString(1, newUser.getId()); //컬럼인덱스, 값
				pstmt.setString(2, newUser.getPw());
				pstmt.setTimestamp(3, newUser.getRegDate());
				
				pstmt.executeUpdate(); //완성된 쿼리를 연동된 데이터베이스에 날림(여기서 처리) <- DB
				users.add(newUser);    //실행중인 상태에서 dao의 객체배열도 업데이트 <- DAO
				
				System.out.println("업데이트 성공");				
			}
			else {
				return false;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("업데이트 실패");
		}
		return true;
	}
	
	//아이디 중복예외처리
	private boolean checkId(String id) {
		users = new ArrayList<UserDTO>();
		users = getUsers();
		
		boolean chk = true;
		
		for(int i = 0; i < users.size(); i++){
			if(users.get(i).getId().equals(id)) {
				chk = false;
			}
		}
		
		return chk;
	}
	
	//로그인
	public boolean checkLogin(String id, String pw) {
		users = getUsers();
		
		for(UserDTO user : users) {
			if(user.getId().equals(id) && user.getPw().equals(pw)) {
				return true;
			}
		}
		
		return false;
	}
	
	//탈퇴
	public int deleteUser(String id, String pw) {
		users = getUsers();
		int delIdx = -1;
		
		for(int i = 0; i < users.size(); i++){
			if(users.get(i).getId().equals(id) && users.get(i).getPw().equals(pw)) {
				delIdx = i;
			}
		}
		
		if(delIdx != -1) {
			try {
				conn = getConnection();
				
				String sql = "delete from users where id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.executeUpdate(); //DB 업데이트
				
				users.remove(delIdx); //dao 객체배열
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}	
		}
		
		return delIdx;
	}
	
	//수정
	public boolean updateUser(String id, String pw) {
		
		Calendar cd = Calendar.getInstance();
		long time = cd.getTimeInMillis();
		Timestamp regDate = new Timestamp(time);
		
		try {			
			
			conn = getConnection();
			String str = "update users set pw = ?, regDate = ? where id = '" + id + "'";
			pstmt = conn.prepareStatement(str);
			
			pstmt.setString(1, pw);
			pstmt.setTimestamp(2, regDate);
			
			pstmt.executeUpdate();
			
			for(UserDTO user : users) {
				if(user.getId().equals(id)) {
					user.setPw(pw);
					user.setRegDate(regDate);
				}
			}
			System.out.println("업데이트 성공");
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("업데이트 실패");
		}
		
		return true;
	}
}
