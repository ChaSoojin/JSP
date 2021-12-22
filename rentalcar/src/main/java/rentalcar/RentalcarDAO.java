package rentalcar;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import util.DBManager;


public class RentalcarDAO {
	private RentalcarDAO() {}
	
	private static RentalcarDAO instance = new RentalcarDAO();
	
	public static RentalcarDAO getInstance() {
		return instance;
	}
	
	ArrayList<RentalcarDTO> carlist = null;
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	
	//렌터카 전체목록
	public ArrayList<RentalcarDTO> getCarlist() {
		try {
			conn = DBManager.getConnection();
			
			String str = "select * from rentcar";
			pstmt = conn.prepareStatement(str);
			rs = pstmt.executeQuery();
			
			carlist = new ArrayList<RentalcarDTO>();
			
			//no name category price use_people company img info
			while(rs.next()) {
				int no = rs.getInt(1);
				String name = rs.getString(2);
				int category = rs.getInt(3);
				int price = rs.getInt(4);
				int use_people = rs.getInt(5);
				String company = rs.getString(6);
				String img = rs.getString(7);
				String info = rs.getString(8);
				
				carlist.add(new RentalcarDTO(no, name, category, price, use_people, company, img, info));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return carlist;
	}
	
	
	//렌터카 상세페이지
	public RentalcarDTO getRentalCarView(int no) {
		RentalcarDTO car = null;
		
		try {
			conn = DBManager.getConnection();
			
			String str = "select * from rentcar where no = '" + no + "'";
			pstmt = conn.prepareStatement(str);
			rs = pstmt.executeQuery();
			
			//no name category price use_people company img info
			while(rs.next()) {
				String name = rs.getString(2);
				int category = rs.getInt(3);
				int price = rs.getInt(4);
				int use_people = rs.getInt(5);
				String company = rs.getString(6);
				String img = rs.getString(7);
				String info = rs.getString(8);
				
				car = new RentalcarDTO(no, name, category, price, use_people, company, img, info);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return car;
	}
	
	//렌터카검색
	public ArrayList<RentalcarDTO> searchRentalCar(String keyword){
		ArrayList<RentalcarDTO> cars= new  ArrayList<>();
		
		try {
			conn = DBManager.getConnection();
			
			String str = "select * from rentcar where name like '%" + keyword + "%' or company like '%" + keyword + "%'";
			//String str = "select * from rentcar where name like '%" + "카니발" + "%'";
			pstmt = conn.prepareStatement(str);
			rs = pstmt.executeQuery();
						
			//no name category price use_people company img info
			while(rs.next()) {
				int no = rs.getInt(1);
				String name = rs.getString(2);
				int category = rs.getInt(3);
				int price = rs.getInt(4);
				int use_people = rs.getInt(5);
				String company = rs.getString(6);
				String img = rs.getString(7);
				String info = rs.getString(8);
				
				System.out.printf("%d %s %s %s\n",no,name,company,img);
				cars.add(new RentalcarDTO(no, name, category, price, use_people, company, img, info));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return cars;
	}
}
