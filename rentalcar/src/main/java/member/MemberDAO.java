package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import util.DBManager;

public class MemberDAO {
	public static final int REMOVE = 0;
	public static final int UPDATE = 1;
		
	private MemberDAO() {}
	
	private static MemberDAO instance = new MemberDAO();
	
	public static MemberDAO getInstance() {
		return instance;
	}
	
	ArrayList<MemberDTO> members = null;
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	

	//모든 member get
	public ArrayList<MemberDTO> getMembers() {
				
		try {
			conn = DBManager.getConnection();
			
			String str = "select * from member";
			pstmt = conn.prepareStatement(str);
			rs = pstmt.executeQuery();
			
			members = new ArrayList<MemberDTO>();
			
			//id pw name email tel age
			while(rs.next()) {
				String id = rs.getString(1);
				String pw = rs.getString(2);
				String name = rs.getString(3);
				String email = rs.getString(4);
				String tel = rs.getString(5);
				int age = rs.getInt(6);
				
				//MemberDTO(String id, String pw, String name, String email, String tel, int age)
				members.add(new MemberDTO(id,pw,name,email,tel,age));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return members;
	}
	
	//멤버추가
	public boolean addMember(MemberDTO member) {
		try {			
			//id pw name email tel age
			MemberDTO newMember = new MemberDTO(member.getId(), member.getPw(), member.getName(),member.getEmail(), member.getTel(), member.getAge());
			
			if(checkId(member.getId())) {
				conn = DBManager.getConnection();
				String str = "insert into member values(?, ?, ?, ?, ?, ?)"; 
				pstmt = conn.prepareStatement(str);
				
				pstmt.setString(1, newMember.getId()); 
				pstmt.setString(2, newMember.getPw());
				pstmt.setString(3, newMember.getName());
				pstmt.setString(4, newMember.getEmail());
				pstmt.setString(5, newMember.getTel());
				pstmt.setInt(6, newMember.getAge());
				
				pstmt.executeUpdate(); 
				members.add(newMember);
				
				System.out.println("멤버추가 성공");				
			}
			else {
				return false;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("멤버추가 실패");
		}
		return true;
	}
	
	//아이디 중복예외처리
	private boolean checkId(String id) {
		members = new ArrayList<MemberDTO>();
		members = getMembers();
		
		boolean chk = true;
		
		for(int i = 0; i < members.size(); i++){
			if(members.get(i).getId().equals(id)) {
				chk = false;
			}
		}
		
		return chk;
	}
	
	//로그인
	public boolean checkLogin(String id, String pw) {
		members = getMembers();
		
		for(MemberDTO member : members) {
			if(member.getId().equals(id) && member.getPw().equals(pw)) {
				return true;
			}
		}
		
		return false;
	}
	
	//탈퇴
	public int deleteMember(String id, String pw) {
		members = getMembers();
		int delIdx = -1;
		
		for(int i = 0; i < members.size(); i++){
			if(members.get(i).getId().equals(id) && members.get(i).getPw().equals(pw)) {
				delIdx = i;
			}
		}
		
		if(delIdx != -1) {
			try {
				conn = DBManager.getConnection();
				
				String sql = "delete from member where id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.executeUpdate();
				
				members.remove(delIdx);
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}	
		}
		
		return delIdx;
	}
	
	//수정
	public boolean updateMember(String id, String pw, String name, String email, String tel, int age) {
		try {			
			conn = DBManager.getConnection();
			String str = "update member set pw = ?, name = ?, email = ?, tel = ?, age = ? where id = '" + id + "'";
			pstmt = conn.prepareStatement(str);
			
			pstmt.setString(1, pw);
			pstmt.setString(2, name);
			pstmt.setString(3, email);
			pstmt.setString(4, tel);
			pstmt.setInt(5, age);
			
			pstmt.executeUpdate();
			
			for(MemberDTO member : members) {
				if(member.getId().equals(id)) {
					member.setPw(pw);
					member.setName(name);
					member.setEmail(email);
					member.setTel(tel);
					member.setAge(age);
				}
			}
			System.out.println("멤버 업데이트 성공");
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("멤버 업데이트 실패");
		}
		
		return true;
	}
}

