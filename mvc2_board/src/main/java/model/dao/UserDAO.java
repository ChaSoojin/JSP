package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;

import model.dto.UserDTO;
import util.DBManager;

public class UserDAO {
	public static final int REMOVE = 0;
	public static final int UPDATE = 1;

	private UserDAO() {}
	
	private static UserDAO instance = new UserDAO();
	
	public static UserDAO getInstance() {
		return instance;
	}
	
	ArrayList<UserDTO> users = null;
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public ArrayList<UserDTO> getUsers() {
				
		try {
			conn = DBManager.getConnection(); 			
			
			String str = "select * from users"; 
			pstmt = conn.prepareStatement(str); 
			rs = pstmt.executeQuery();
			
			users = new ArrayList<UserDTO>();
			
			while(rs.next()) {
				String id = rs.getString(1);
				String pw = rs.getString(2);
				Timestamp regDate = rs.getTimestamp(3);
				
				users.add(new UserDTO(id,pw,regDate));
			}
			
		} catch (SQLException e) {
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
				conn = DBManager.getConnection();
				String str = "insert into users values(?, ?, ?)";
				pstmt = conn.prepareStatement(str);
				
				pstmt.setString(1, newUser.getId());
				pstmt.setString(2, newUser.getPw());
				pstmt.setTimestamp(3, newUser.getRegDate());
				
				pstmt.executeUpdate();
				users.add(newUser);  
				
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
				conn = DBManager.getConnection();
				
				String sql = "delete from users where id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.executeUpdate();
				
				users.remove(delIdx);
				System.out.println("탈퇴성공");
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				System.out.println("탈퇴실패");
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
			
			conn = DBManager.getConnection();
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

