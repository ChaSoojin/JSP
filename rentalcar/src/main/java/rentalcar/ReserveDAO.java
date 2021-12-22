package rentalcar;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import util.DBManager;

public class ReserveDAO {
	private ReserveDAO() {}
	
	private static ReserveDAO instance = new ReserveDAO();
	
	public static ReserveDAO getInstance() {
		return instance;
	}
	
	ArrayList<ReserveDTO> reservelist = null;
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	//예약 리스트
	public ArrayList<ReserveDTO> getReservelist(String id) {
		try {
			conn = DBManager.getConnection();
			
			String str = "select * from car_reserve where id = '" + id + "'";
			pstmt = conn.prepareStatement(str);
			rs = pstmt.executeQuery();
			
			reservelist = new ArrayList<ReserveDTO>();
			
			//reserve_seq no id cnt days r_day use_navi use_seat
			while(rs.next()) {
				int reserve_seq = rs.getInt(1);
				int no = rs.getInt(2);
				int cnt = rs.getInt(4);
				int days = rs.getInt(5);
				String r_day = rs.getString(6);
				int use_navi = rs.getInt(7);
				int use_seat = rs.getInt(8);
				
				
				//public ReserveDTO(int reserve_seq, int no, String id, int cnt, int days, String r_day, int use_navi, int use_seat) {
				reservelist.add(new ReserveDTO(reserve_seq, no, id, cnt, days, r_day, use_navi, use_seat));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return reservelist;
	}
	
	//예약하기
	public boolean addReserve (ReserveDTO reserve) {
		try {						
			conn = DBManager.getConnection();
			String str = "insert into car_reserve(no, id, cnt, days, r_day, use_navi, use_seat) values(?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(str);
			
			pstmt.setInt(1, reserve.getNo());
			pstmt.setString(2, reserve.getId());
			pstmt.setInt(3, reserve.getCnt());
			pstmt.setInt(4, reserve.getDays());
			pstmt.setString(5, reserve.getR_day());
			pstmt.setInt(6, reserve.getUse_navi());
			pstmt.setInt(7, reserve.getUse_seat());
			
			pstmt.executeUpdate();
			
			
			ReserveDTO newReserve = new ReserveDTO(reserve.getNo(), reserve.getId(), reserve.getCnt(), reserve.getDays(), reserve.getR_day(), reserve.getUse_navi(), reserve.getUse_seat());
			reservelist.add(newReserve);
			
			System.out.println("예약성공");						
			
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("예약실패");
		}
		return true;
	}
	
	//예약취소
	public boolean deleteReserve(int reserve_seq, String id) {
		int delIdx = -1;
		ArrayList<ReserveDTO> reservelist = getReservelist(id);
		
		try {
			conn = DBManager.getConnection();
			String str = "delete from car_reserve where reserve_seq = '" + reserve_seq + "'";
			pstmt = conn.prepareStatement(str);
			pstmt.executeUpdate();
			
			for(int i = 0; i < reservelist.size(); i++) {
				if(reservelist.get(i).getReserve_seq() == reserve_seq) {
					delIdx = i;
				}
			}
			
			reservelist.remove(delIdx);
			System.out.println("예약취소성공");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("예약취소실패");			
		}
		return true;
	}
}
